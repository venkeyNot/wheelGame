const db = require("../models");
const User = db.user;
const Setting = db.setting;
const walletHistory=db.walletHistory;
const withdrawRequest=db.withdrawRequest;
const Op = db.Sequelize.Op;
const bcrypt= require('bcrypt');
process.env.TZ = "Asia/Calcutta";
const moment = require('moment');
const TODAY_START =  moment().startOf('day');
const NOW = moment().endOf('day');

exports.test= async(req,res)=>{

  var todayWithdrawls= await withdrawRequest.count({  where: { user_id:3,
    createdAt:{ 
      [Op.gt]: TODAY_START,
      [Op.lt]: NOW
    },
    }});
  res.status(200).json({
    success:1,
   DATA:todayWithdrawls,
    START:TODAY_START,
    NOW:NOW

});

  };
