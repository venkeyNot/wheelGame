const db = require("../models");
const withdrawRequest=db.withdrawRequest;
const userDailyBonus=db.userDailyBonus;
const User = db.user;
const Op = db.Sequelize.Op;
const walletHistory=db.walletHistory;
process.env.TZ = "Asia/Calcutta";
// const TODAY_START = new Date().setHours(0, 0, 0, 0);
const NOW = new Date();
const moment = require('moment');
const user = require("../models/user");
const Setting = db.setting;

exports.createDailyBonus= async(req,res,next) => {


  for(i=1;i<=7;i++){

    var daily = NOW.setDate(NOW.getDate() +1);
    var user_id=3;

    var check= await userDailyBonus.count({where:{user_id:user_id,day:daily}});
    console.log(check);
    if(check<1){
    await userDailyBonus.create({user_id:user_id,day:daily,amount:2,status:'pending'});

    }

  }


};


exports.claimBonus= async(req,res,next) => {
    var user_id= req.userData.userId;
    var bonus_id =req.body.bonus_id;
      try{
      var dailyBonus= await userDailyBonus.findByPk(bonus_id);
console.log(bonus_id);
      if(dailyBonus.status='pending'){

      await userDailyBonus.update({status:'claimed'},{where:{id:bonus_id}});

      var customer = await User.findByPk(user_id);
      var newWallet= customer.wallet+dailyBonus.amount;
      var newBalance = customer.earnings+newWallet;

      await User.update({wallet:newWallet},{where:{id:user_id}});
      await walletHistory.create({
        user_id:user_id,amount:dailyBonus.amount,balance:newBalance,credit_debit:'credit',type:'bonus',wallet_type:'earnings'
      });


      res.status(200).json({
  
        message:'Claimed Successfully',
        success:1,

      });
    }else{

      res.status(200).json({
  
        message:'Already Claimed',
        success:1,
        data:dailyBonus

      });

    }

    }catch(err){

    }


  };
 

  exports.dailyBonus= async(req,res,next) => {
    var user_id= req.userData.userId;
    var week = moment().week();
    var day = moment().weekday();
    var dailyBonus= await userDailyBonus.count({where:{user_id:user_id,week:week}});
    var amount=2;
    if(dailyBonus<1){

      for(i=1;i<=7;i++){


        if(i<day){
       await userDailyBonus.create({user_id:user_id,day:i,week:week,amount:amount,status:'expired'});

      }else{

        await userDailyBonus.create({user_id:user_id,day:i,week:week,amount:amount,status:'pending'});
      }

    }

    var dailyBonus= await userDailyBonus.findAll({where:{week:week,user_id:user_id}});

      res.status(200).json({
  
        message:week,
        success:1,
        data:dailyBonus

      });
    }else{
    // var day =req.body.day;
      try{

        for(i=1;i<=7;i++){


          if(i<day){
         await userDailyBonus.update({status:'expired'},{where:{week:week,day:i,status:'pending'}});
  
        }else{
  
          await userDailyBonus.update({status:'pending'},{where:{week:week,day:i,status:'pending'}});
        }
      }
      var dailyBonus= await userDailyBonus.findAll({where:{week:week,user_id:user_id}});

      res.status(200).json({
  
        message:week,
        success:1,
        day:day,
        data:dailyBonus,
        

      });

    }catch(err){

    }
  }

  };