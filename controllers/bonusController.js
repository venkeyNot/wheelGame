const db = require("../models");
const withdrawRequest=db.withdrawRequest;
const userDailyBonus=db.userDailyBonus;
const gamePosition = db.gamePosition;
const TaskBonus=db.taskBonus;
const User = db.user;
const Op = db.Sequelize.Op;
const walletHistory=db.walletHistory;
process.env.TZ = "Asia/Kolkata";
const NOW = new Date();
const moment = require('moment');
const start = moment().format('YYYY-MM-DD 00:00:01');
const end = moment().format('YYYY-MM-DD 23:59:59');
const today = moment().format('YYYY-MM-DD');
const user = require("../models/user");
const Setting = db.setting;

// exports.createDailyBonus= async(req,res,next) => {


//   for(i=0;i<=7;i++){

//     var daily = NOW.setDate(NOW.getDate() +1);
//     var user_id=3;

//     var check= await userDailyBonus.count({where:{user_id:user_id,day:daily}});
//     console.log(check);
//     if(check<1){
//     await userDailyBonus.create({user_id:user_id,day:daily,amount:2,status:'pending'});

//     }

//   }


// };


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
      var newDailyBonus= await userDailyBonus.findByPk(bonus_id);

      if(newDailyBonus.status='pending'){
      await User.update({wallet:newWallet},{where:{id:user_id}});
      await walletHistory.create({
        user_id:user_id,amount:dailyBonus.amount,balance:newBalance,credit_debit:'credit',type:'bonus',wallet_type:'earnings'
      });
    }

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


        if(i<day+1){
       await userDailyBonus.create({user_id:user_id,day:i,week:week,amount:amount,status:'expired'});

      }else{

        await userDailyBonus.create({user_id:user_id,day:i,week:week,amount:amount,status:'pending'});
      }

    }

    var dailyBonus= await userDailyBonus.findAll({where:{week:week,user_id:user_id}});

      res.status(200).json({
  
        message:week,
        success:1,
        day:day+1,
        data:dailyBonus

      });
    }else{
    // var day =req.body.day;
      try{

        for(i=1;i<=7;i++){


          if(i<day+1){
         await userDailyBonus.update({status:'expired'},{where:{week:week,day:i,status:'pending'}});
  
        }else{
  
          await userDailyBonus.update({status:'pending'},{where:{week:week,day:i,status:'pending'}});
        }
      }
      var dailyBonus= await userDailyBonus.findAll({where:{week:week,user_id:user_id}});

      res.status(200).json({
  
        message:week,
        success:1,
        day:day+1,
        data:dailyBonus,
        

      });

    }catch(err){

    }
  }

  };


  exports.getTaskBonus= async(req,res,next) => {
    var user_id= req.userData.userId;
    var user=await User.findByPk(user_id);
    var playedGames = await gamePosition.count({  where: { 
      user_id:user_id,
      date:today,
      }});;

      await TaskBonus.destroy({
        where: {
          claimed_date: {[Op.ne]: today},
        }
    });
/// start 30 games
    var check30=await TaskBonus.findOne({where:{user_id:user_id,total_plays:30,claimed_date:today}});
    if(!check30){

      if(playedGames>=30){

      await TaskBonus.create({user_id:user_id,total_plays:30,status:'claim',bonus:3,claimed_date:today});

      }else{

        await TaskBonus.create({user_id:user_id,total_plays:30,status:'pending',bonus:3,claimed_date:today});
      }
    }else{

      if(playedGames>=30 && check30.status!='claimed'){

        await TaskBonus.update({user_id:user_id,status:'claim',total_plays:30},{where:{id:check30.id}});
  
        }else if(check30.status!='claimed'){
  
          await TaskBonus.update({user_id:user_id,status:'pending',total_plays:30},{where:{id:check30.id}});
        }

    }
//end 30 games
  

/// start 100 games
var check100=await TaskBonus.findOne({where:{user_id:user_id,total_plays:100,claimed_date:today}});
if(!check100){

  if(playedGames>=100){

  await TaskBonus.create({user_id:user_id,total_plays:100,status:'claim',bonus:6,claimed_date:today});

  }else{

    await TaskBonus.create({user_id:user_id,total_plays:100,status:'pending',bonus:6,claimed_date:today});
  }
}else{

  if(playedGames>=100 && check100.status!='claimed'){

    await TaskBonus.update({user_id:user_id,status:'claim',total_plays:100},{where:{id:check100.id}});

    }else if(check100.status!='claimed'){

      await TaskBonus.update({user_id:user_id,status:'pending',total_plays:100},{where:{id:check100.id}});
    }

}
//end 100 games




/// start 300 games
var check300=await TaskBonus.findOne({where:{user_id:user_id,total_plays:300,claimed_date:today}});
if(!check300){

  if(playedGames>=300){

  await TaskBonus.create({user_id:user_id,total_plays:300,status:'claim',bonus:16,claimed_date:today});

  }else{

    await TaskBonus.create({user_id:user_id,total_plays:300,status:'pending',bonus:16,claimed_date:today});
  }
}else{

  if(playedGames>=300 && check300.status!='claimed'){

    await TaskBonus.update({user_id:user_id,status:'claim',total_plays:300},{where:{id:check300.id}});

    }else if(check300.status!='claimed'){

      await TaskBonus.update({user_id:user_id,status:'pending',total_plays:300},{where:{id:check300.id}});
    }

}
//end 300 games




/// start 1000 games
var check1000=await TaskBonus.findOne({where:{user_id:user_id,total_plays:1000,claimed_date:today}});
if(!check1000){

  if(playedGames>=1000){

  await TaskBonus.create({user_id:user_id,total_plays:1000,status:'claim',bonus:30,claimed_date:today});

  }else{

    await TaskBonus.create({user_id:user_id,total_plays:1000,status:'pending',bonus:30,claimed_date:today});
  }
}else{

  if(playedGames>=1000 && check1000.status!='claimed'){

    await TaskBonus.update({user_id:user_id,status:'claim',total_plays:1000},{where:{id:check1000.id}});

    }else if(check1000.status!='claimed'){

      await TaskBonus.update({user_id:user_id,status:'pending',total_plays:1000},{where:{id:check1000.id}});
    }

}
//end 1000 games








     var taskBonus= await TaskBonus.findAll({where:{user_id:user_id}});

      res.status(200).json({
  
        message:'week',
        success:1,
        data:taskBonus,
        playedGames:playedGames

      });
    

 

  };



  exports.claimTaskBonus= async(req,res,next) => {
    var user_id= req.userData.userId;
    var bonus_id =req.body.bonus_id;
      try{
      var dailyBonus= await TaskBonus.findByPk(bonus_id);

      if(dailyBonus.status='claim'){

      await TaskBonus.update({status:'claimed'},{where:{id:bonus_id}});

      var customer = await User.findByPk(user_id);
      var newWallet= customer.wallet+dailyBonus.bonus;
      var newBalance = customer.earnings+newWallet;
      var newDailyBonus= await TaskBonus.findByPk(bonus_id);

      if(newDailyBonus.status='claim'){
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
  
        message:'Not Available',
        success:1,
        data:dailyBonus

      });

    }

   
    }else{

      res.status(200).json({
  
        message:'Not Available',
        success:1,
        data:dailyBonus

      });

    }

    }catch(err){

    }


  };
 