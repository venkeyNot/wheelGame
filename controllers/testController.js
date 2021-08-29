const db = require("../models");
const User = db.user;
const Setting = db.setting;
const walletHistory=db.walletHistory;
const Op = db.Sequelize.Op;
const bcrypt= require('bcrypt');

exports.test= async(req,res)=>{
    var setting = await Setting.findOne({where:{slug:'registration_bonus'}});
    
    console.log(setting);

  };
