const db = require("../models");
const User = db.user;
const Op = db.Sequelize.Op;
const jwt = require('jsonwebtoken');
const bcrypt= require('bcrypt');
require('dotenv').config();

exports.login = async(req, res) => {

    var condition = {mobile:req.body.mobile};
    User.findAll({where:condition}).then(data => {
      if(data.length<1){

        res.status(401).json({
          message:'not registered',
          success:0,
        });
      }else{

        bcrypt.compare(req.body.password,data[0].password,async(err,result)=>{

            if(result){
              const token= jwt.sign({

                mobile:data[0].password,
                userId:data[0].id,
              },process.env.JWT_KEY,{expiresIn:"360h"});

               await User.update({token:token},{where:{id:data[0].id}});
               var user =await User.findByPk(data[0].id);
              return res.status(200).json({
                message:'Login Successful',
                token:token,
                data:user,
                success:1,
              });
            }else{

              return res.status(401).json({
                message:'Incorrect Password',
                success:0,
              });
            }

        });



      }
    })
    .catch(err => {
      res.status(500).send({
        message:
          err.message || "Some error occurred while retrieving tutorials."
      });
    });
};


exports.profile=(req,res,next)=>{

  var user = User.findByPk(req.userData.userId).then(user=>{

    res.status(200).json({

      user:user
    });
  })


};



exports.updateProfile=(req,res,next)=>{

  var user = User.findByPk(req.userData.userId).then(user=>{


    User.update();
    res.status(200).json({

      user:user
    });
  })


};


exports.resetPassword = (req, res) => {
  if (!req.body.mobile) {
      res.status(400).send({
        message: "Mobile Number required"
      });
    }

    var condition =  { mobile:req.body.mobile };
    var user = User.findOne({ where: condition }).then(userData=>{

    if(!userData){

      res.status(500).json({
          message: "Mobile Number not Registered with Us",
          success:0
        });
    }else{

  
              otp=Math.floor(Math.random() * (999999 - 100000) + 100000);
              const updateUser = {

                  otp:otp
                };
                User.update(updateUser,{where:{id:userData.id}})
                .then(async data => {

                  var message = 'Dear Customer! Your BIGSPG Login OTP is '+otp+'.';

                  await fetch('http://server2.smsnot.com/v2/sendSMS?username=spingame&message='+message+'&sendername=EBSPIG&smstype=TRANS&numbers='+req.body.mobile+'&apikey=0d387439-f834-4e0e-98eb-cb9e4dd5a10b&peid=1201163102281800017&templateid=1207163153499355887');

                  res.status(200).send({
                      message: "OTP Sent to Your Mobile Number",
                     // data: data,
                      success:1
                    });
                });
         

  


    }


    });


};


exports.changePassword = (req, res) => {
  if (!req.body.mobile) {
      res.status(400).send({
        message: "Mobile Number required"
      });
    }

    var condition =  { mobile:req.body.mobile };
    var user = User.findOne({ where: condition }).then(async userProfile=>{

    if(userProfile.otp!=req.body.otp){

      res.status(500).json({
          message: "Incorrect OTP",
          success:0
        });
    }else{

             var encPassword= await bcrypt.hash(req.body.password,10);
  
              const updateUser = {

                  password:encPassword
                };
                User.update(updateUser,{where:{id:userProfile.id}})
                .then(async data => {

                  res.status(200).send({
                      message: "Password Changed Successfully",
                     // data: data,
                      success:1
                    });
                });
         

  


    }


    });


};