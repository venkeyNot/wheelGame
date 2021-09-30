const db = require("../models");
const User = db.user;
const Setting = db.setting;
const walletHistory=db.walletHistory;
const Op = db.Sequelize.Op;
const bcrypt= require('bcrypt');
var http = require('http');
var urlencode = require('urlencode');
// Create and Save a new Tutorial
exports.create = async(req, res) => {

    if (!req.body.name ||  !req.body.mobile || !req.body.password  ) {
        res.status(400).send({
          message: "Fields required"
        });
      }

      var condition =  { mobile:req.body.mobile };
      var user = User.findAll({ where: condition }).then(async userData=>{
        if(userData.length>=1){

          if(userData[0].mobile_verified=='yes'){
  
          res.status(200).json({
              message: "Number Already Exist",
              success:0
            });
  
          }else{

            bcrypt.hash(req.body.password,10,async (err,hash)=>{
  
            var otp= Math.floor(Math.random() * (999999 - 100000) + 100000);
            await User.update({otp:otp,password:hash},{where:{id:userData[0].id}});


                      var message = urlencode('Dear Customer! Your BIGSPG Login OTP is '+otp+'.');
                  //  var msg=urlencode('hello js');
                    var number=userData[0].mobile;
                    var apikey='NjMzMzUyMzUzMTMxNjM0MzQzNzQ2ZDRlNDc0MjU0NDg=';
                 
                    var sender='EBSPIG';
                    var data='apikey='+apikey+'&sender='+sender+'&numbers='+number+'&message='+message
                    var options = {
                    host: 'api.textlocal.in',
                    path: '/send?'+data
                    };
                    callback = function(response) {
                    var str = '';
                    //another chunk of data has been recieved, so append it to `str`
                    response.on('data', function (chunk) {
                    str += chunk;
                    });
                    //the whole response has been recieved, so we just print it out here
                    response.on('end', function () {
                    console.log(str);
                    });
                    }
                    //console.log('hello js'))
                    http.request(options, callback).end();

            res.status(200).send({
              message: "OTP Sent to Your Mobile Number",
              data: userData[0],
              success:1
            });
          });
          }
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
                    your_id:req.body.mobile,
                    password: hash,
                    otp:otp
                  };
                  User.create(newUser)
                  .then(async data => {


                    var message = urlencode('Dear Customer! Your BIGSPG Login OTP is '+otp+'.');
                  //  var msg=urlencode('hello js');
                    var number=req.body.mobile;
                    var apikey='NjMzMzUyMzUzMTMxNjM0MzQzNzQ2ZDRlNDc0MjU0NDg=';
                 
                    var sender='EBSPIG';
                    var data='apikey='+apikey+'&sender='+sender+'&numbers='+number+'&message='+message
                    var options = {
                    host: 'api.textlocal.in',
                    path: '/send?'+data
                    };
                    callback = function(response) {
                    var str = '';
                    //another chunk of data has been recieved, so append it to `str`
                    response.on('data', function (chunk) {
                    str += chunk;
                    });
                    //the whole response has been recieved, so we just print it out here
                    response.on('end', function () {
                    console.log(str);
                    });
                    }
                    //console.log('hello js'))
                    http.request(options, callback).end();



                  //  var url = 'http://server2.smsnot.com/v2/sendSMS?username=spingame&message='+message+'&sendername=EBSPIG&smstype=TRANS&numbers='+req.body.mobile+'&apikey=0d387439-f834-4e0e-98eb-cb9e4dd5a10b&peid=1201163102281800017&templateid=1207163153499355887';
      
                  // await http.get(url);

                    // var setting = await Setting.findOne({where:{slug:'registration_bonus'}});
                    // console.log(setting);
                    // var bonus= setting.option;

                    // await User.update({wallet:bonus},{where:{id:data.id}});
                    // await walletHistory.create({
                    //   user_id:data.id,amount:bonus,balance:bonus,credit_debit:'credit',type:'bonus',comment:'Registration Bonus'
                    // });

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
      if(data.otp== otp && data.mobile_verified=="no"){

        let values= {
            mobile_verified:"yes"
        };

        User.update(values,{where: {id:ids}}).then(async num=>{

          var setting = await Setting.findOne({where:{slug:'registration_bonus'}});
          console.log(setting);
          var bonus= setting.option;

          await User.update({wallet:bonus},{where:{id:data.id}});
          await walletHistory.create({
            user_id:data.id,amount:bonus,balance:bonus,credit_debit:'credit',type:'bonus',comment:'Registration Bonus'
          });

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
