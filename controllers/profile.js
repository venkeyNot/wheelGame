const db = require("../models");
const User = db.user;
const Op = db.Sequelize.Op;
const jwt = require('jsonwebtoken');
const bcrypt= require('bcrypt');
require('dotenv').config();
var formidable = require('formidable');
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



exports.updateProfile=(req,res,next)=>{

  var user = User.findByPk(req.userData.userId).then(user=>{

  //       var form = new formidable.IncomingForm();
  //   form.parse(req, function (err, fields, files) {

  //       var oldpath = files.filetoupload.path;
  //      console.log(oldpath);
  //       var newpath = 'F:/change path to your project dir/' + files.filetoupload.name;
  //       mv(oldpath, newpath, function (err) {
  //         if (err) throw err;
  //         res.write('File uploaded and moved!');
  //         res.end();
  //       });

  // });
    User.update({name:req.body.name,profilePic:'public/images/' + files.filetoupload.name},{where:{id:user.id}});
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