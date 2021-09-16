const db = require("../models");
const User = db.user;
const Setting = db.setting;
const walletHistory=db.walletHistory;
const Op = db.Sequelize.Op;
const bcrypt= require('bcrypt');
var http = require("http");
// Create and Save a new Tutorial
exports.create = (req, res) => {

    if (!req.body.name ||  !req.body.mobile || !req.body.password  ) {
        res.status(400).send({
          message: "Fields required"
        });
      }

      var condition =  { mobile:req.body.mobile };
      var user = User.findAll({ where: condition }).then(userData=>{

      if(userData.length>0){

        res.status(500).json({
            message: "Number Already Exist",
            success:0
          });
      }else{

        bcrypt.hash(req.body.password,10,(err,hash)=>{

            if(err){

                res.status(500).json({
                    message: "failed",
                  });
            }else{
              var otp =Math.floor(Math.random() * (999999 - 100000) + 100000);
                const newUser = {
                    name:req.body.name,
                   // email:req.body.email,
                    mobile:req.body.mobile,
                    your_id:Math.floor(Math.random() * (999999999 - 1000000) + 1000000),
                    password: hash,
                    otp:otp
                  };
                  User.create(newUser)
                  .then(async data => {
                    var message = 'Dear Customer! Your BIGSPG Login OTP is '+otp+'.';

                   var url = 'http://server2.smsnot.com/v2/sendSMS?username=spingame&message='+message+'&sendername=EBSPIG&smstype=TRANS&numbers='+req.body.mobile+'&apikey=0d387439-f834-4e0e-98eb-cb9e4dd5a10b&peid=1201163102281800017&templateid=1207163153499355887';
      
                  await http.get(url);

                    var setting = await Setting.findOne({where:{slug:'registration_bonus'}});
                    console.log(setting);
                    var bonus= setting.option;

                    await User.update({wallet:bonus},{where:{id:data.id}});
                    await walletHistory.create({
                      user_id:data.id,amount:bonus,balance:bonus,credit_debit:'credit',type:'bonus',comment:'Registration Bonus'
                    });

                    res.status(200).send({
                        message: "OTP Sent to Your Mobile Number",
                        data: data,
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


exports.verifyMobile = (req, res) => {
    const ids = req.body.id;
    const otp = req.body.otp;
    User.findByPk(ids)
    .then(data => {
      if(data.otp== otp){

        let values= {
            mobile_verified:"yes"
        };

        User.update(values,{where: {id:ids}}).then(num=>{

            res.status(200).send({
                message: "Mobile Verified Successfully",
                success:1
              });

        });

 
      }else{

        res.status(500).send({
            message: "Invalid OTP",
            success:0
          });
      }
    })
    .catch(err => {
      res.status(500).send({
        message: "Error retrieving Tutorial with id=" + id
      });
    });
};
