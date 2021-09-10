const db = require("../models");
const redis= require('redis');
const Setting = db.setting;
const siteSetting = db.siteSetting;
const Op = db.Sequelize.Op;

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
 