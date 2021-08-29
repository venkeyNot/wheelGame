const db = require("../models");
const walletHistory=db.walletHistory;
const User = db.user;
const Op = db.Sequelize.Op;


exports.history= (req,res,next) => {
var user_id= req.userData.userId;
var search = req.body.search;
  try{

    if(search=='deposit'){
    walletHistory.findAll({
        where:{user_id:user_id},
        order: [ [ 'createdAt', 'DESC' ]],
    }).then(history=>{
        res.status(200).json({
            success:1,
            data:history,
        });

    });

   }else if(search=='game'){
    walletHistory.findAll({
        where:{user_id:user_id},
        order: [ [ 'createdAt', 'DESC' ]],
    }).then(history=>{

        res.status(200).json({
            success:1,
            data:history,
        });

    });
}else{
    walletHistory.findAll({
        where:{user_id:user_id},
        order: [ [ 'createdAt', 'DESC' ]],
    }).then(history=>{

        res.status(200).json({
            success:1,
            data:history,
        });

    });

}
  }catch (err){

    next(err);
  }

};


exports.recharge= (req,res,next) => {
    var user_id= req.userData.userId;
    var amount = req.body.amount;
      try{
        User.findByPk(user_id).then(async userData=>{

            var newWallet = parseInt(userData.wallet)+parseInt(amount);
            
            await User.update({wallet:newWallet},{where:{id:user_id}});
            await walletHistory.create({
              user_id:user_id,game_id:1,amount:amount,balance:newWallet,credit_debit:'credit',type:'deposit'
            });

            res.status(200).json({

              message:"money "+amount+" credited successfully",
              success:1
            });

        });
       
      }catch (err){
    
        next(err);
      }
    
    };
    
