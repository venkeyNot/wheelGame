const db = require("../models");
const User = db.user;
const Op = db.Sequelize.Op;
const jwt = require('jsonwebtoken');
const bcrypt= require('bcrypt');
require('dotenv').config();
var fs = require('fs');
exports.profile=(req,res,next)=>{

   User.findByPk(req.userData.userId).then(user=>{
  var amount = user.wallet+user.earnings;
  
  data= Object.assign(user,{amount:amount});
  // user.push({amount:amount});
    res.status(200).json({

      user:data,
     // amount:amount,

    });
  })


};



exports.updateProfile= (req,res,next)=>{

  var user = User.findByPk(req.userData.userId).then(async user=>{

    User.update({name:req.body.name,profilePic:req.body.profilePic},{where:{id:user.id}});
    res.status(200).json({

      message:'Profile Updated Successfully',
      user:user,
      success:1
    });
  })


};


exports.updateBank=(req,res,next)=>{

   User.findByPk(req.userData.userId).then(async user=>{


   await User.update({
      bankAccountNumber:req.body.bankAccountNumber,
      bankAccountName:req.body.bankAccountName,
      bankIFSC:req.body.bankIFSC,
      bankName:req.body.bankName,
      bankAddress:req.body.bankAddress,
      UPI:req.body.UPI
    
    },{where:{id:user.id}});

    var data = await User.findByPk(req.userData.userId);
    res.status(200).json({
      message:'Bank Details Updated Successfully',
      user:data,
      success:1
    });
  })


};


exports.changePassword = (req, res) => {


    var condition =  { id:req.userData.userId };
    var user = User.findOne({ where: condition }).then(async userProfile=>{


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
         

  


    


    });


};