const db = require("../models");
const redis= require('redis');
const Setting = db.setting;
const siteSetting = db.siteSetting;
const Op = db.Sequelize.Op;
const walletHistory=db.walletHistory;

exports.settings= async (req,res)=>{


   var settings = await Setting.findAll();
     res.status(200).json({
      data:settings,
      message:'success'
     });
  };

  exports.siteSettings= async (req,res)=>{


    var settings = await siteSetting.findAll();
      res.status(200).json({
       data:settings,
       message:'success'
      });
   };

   exports.winners= async(req,res)=>{

    var winners = await walletHistory.findAll({limit: 5,where:{type:'game',credit_debit:'credit'},order: [
      ['amount', 'DESC']
  ]});
      res.status(200).json({
       data:winners,
       message:'success'
      });
   };

 