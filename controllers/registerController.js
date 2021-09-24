const db = require("../models");
process.env.TZ = "Asia/Calcutta";
const User = db.user;
const Setting = db.setting;
const walletHistory=db.walletHistory;
const Op = db.Sequelize.Op;
const bcrypt= require('bcrypt');
var http = require("http");
// Create and Save a new Tutorial
exports.create = (req, res) => {
    if (!req.body.mobile || !req.body.password) {
        res.status(400).send({
          message: "Fields required"
        });
      }

      var condition =  { mobile:req.body.mobile };
      var user = User.findAll({ where: condition }).then( async userData=>{

      if(userData.length>=1){

        if(userData[0].mobile_verified=='yes'){

        res.status(200).json({
            message: "Number Already Exist",
            success:0
          });

        }else{

          var otp= Math.floor(Math.random() * (999999 - 100000) + 100000);
          await User.update({otp:otp},{where:{id:userData[0].id}});

          res.status(200).send({
            message: "OTP Sent to Your Mobile Number",
            data: data.mobile,
            success:1
          });

        }
      }else{
        var refer_id='';
        if (req.body.referral_id) {

            var referral= await User.findOne({where:{your_id:req.body.referral_id}});
            if(referral){

                var refer_id=referral.id;
            }else{

                res.status(200).send({
                    message: "Invalid Referral Id"
                  });

            }
          }

        bcrypt.hash(req.body.password,10,(err,hash)=>{

            if(err){

                res.status(500).json({
                    message: "failed",
                  });
            }else{
                var otp= Math.floor(Math.random() * (999999 - 100000) + 100000);
                const newUser = {
                    name:req.body.name,
                    referral_id:refer_id,
                    mobile:req.body.mobile,
                    password: hash,
                    otp:otp
                  };
                  User.create(newUser)
                  .then(async data => {

                    var message = 'Dear Customer! Your BIGSPG Login OTP is '+otp+'.';

                    var url = 'http://server2.smsnot.com/v2/sendSMS?username=spingame&message='+message+'&sendername=EBSPIG&smstype=TRANS&numbers='+req.body.mobile+'&apikey=0d387439-f834-4e0e-98eb-cb9e4dd5a10b&peid=1201163102281800017&templateid=1207163153499355887';
       
                   await http.get(url);
                    var referBonusSetting = await Setting.findOne({where:{slug:'refer_bonus'}});
                    var registerBonusSetting = await Setting.findOne({where:{slug:'refer_register_bonus'}});
                    var welcomeBonusSetting = await Setting.findOne({where:{slug:'registration_bonus'}});
             //       console.log(setting);

                    if(refer_id){

                      var referUser= await User.findByPk(refer_id);
                      
                      var refWallet = referUser.wallet+referBonusSetting.option;
                      var refBalance= refWallet+referUser.earnings;
                        await User.update({wallet:refWallet},{where:{id:refer_id}});
                        await User.update({wallet:registerBonusSetting.option},{where:{id:data.id}});
                        await walletHistory.create({
                          user_id:data.id,amount:registerBonusSetting.option,balance:registerBonusSetting.option,credit_debit:'credit',type:'bonus',comment:'Registration Bonus'
                        });
                        await walletHistory.create({
                          user_id:refer_id,amount:referBonusSetting.option,balance:refBalance,credit_debit:'credit',type:'bonus',comment:'Referral Registration Bonus'
                        });

                    }
                    var welcomeBonus= welcomeBonusSetting.option;
                    var newUser= await User.findByPk(data.id);
                    var userWallet = newUser.wallet+welcomeBonus;
                    var userBalance= userWallet+newUser.earnings;

                   await User.update({wallet:userWallet},{where:{id:data.id}});
                    await walletHistory.create({
                      user_id:data.id,amount:welcomeBonus,balance:userBalance,credit_debit:'credit',type:'bonus',comment:'Welcome Bonus'
                    });

                    res.status(200).send({
                        message: "OTP Sent to Your Mobile Number",
                        data: data.mobile,
                        success:1
                      });
                  });
            }

      });


      }


      });



  //  res.send(req.body.name);

};

// Retrieve all Tutorials from the database.
exports.findAll = (req, res) => {
    User.findAll()
    .then(data => {
      res.send(data);
    })
    .catch(err => {
      res.status(500).send({
        message:
          err.message || "Some error occurred while retrieving tutorials."
      });
    });
};

// Find a single Tutorial with an id
exports.findOne = (req, res) => {

};

// Update a Tutorial by the id in the request
exports.update = (req, res) => {
  
};

// Delete a Tutorial with the specified id in the request
exports.delete = (req, res) => {
  
};

// Delete all Tutorials from the database.
exports.deleteAll = (req, res) => {
  
};

// Find all published Tutorials
exports.findAllPublished = (req, res) => {
  
};


exports.verifyMobile = async(req, res) => {
    const ids = req.body.id;
    const otp = req.body.otp;
    console.log(ids);
    var user =await User.findOne({where:{mobile:ids}});
    console.log(user);
    User.findByPk(user.id)
    .then(data => {
      if(data.otp== otp){

        let values= {
            mobile_verified:"yes"
        };

        User.update(values,{where: {id:user.id}}).then(num=>{

            res.status(200).send({
                message: "Mobile Verified Successfully",
                success:1
              });

        });

 
      }else{

        res.status(200).send({
            message: "Invalid OTP",
            success:0
          });
      }
    })
    .catch(err => {
      res.status(200).send({
        message: "Error retrieving Tutorial with id="
      });
    });
};
