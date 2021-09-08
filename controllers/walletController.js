const db = require("../models");
const walletHistory=db.walletHistory;
const Setting = db.setting;
const User = db.user;
const Op = db.Sequelize.Op;


exports.history= (req,res,next) => {
var user_id= req.userData.userId;
var search = req.body.search;
  try{

    if(search=='deposit'){
    walletHistory.findAll({
        where:{user_id:user_id,type:'deposit'},
        order: [ [ 'createdAt', 'DESC' ]],
    }).then(history=>{
        res.status(200).json({
            success:1,
            data:history,
        });

    });

   }else if(search=='game'){
    walletHistory.findAll({
        where:{user_id:user_id,type:'game'},
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
        User.findByPk(user_id).then(async userProfile=>{
       //   var setting = await Setting.findOne({where:{slug:'gulkan_points_percent'}});
            var newWallet = parseInt(userProfile.wallet)+parseInt(amount);
          //  var gulkanPoints= (setting.option/100)*amount;
          
            // var newGulkanPoints = parseInt(userProfile.gulkan_points)+parseInt(gulkanPoints);
            // console.log(newGulkanPoints);
            await User.update({wallet:newWallet},{where:{id:user_id}});
            await walletHistory.create({
              user_id:user_id,game_id:1,amount:amount,balance:newWallet,credit_debit:'credit',type:'deposit',wallet_type:'wallet'
            });
            // await walletHistory.create({
            //   user_id:user_id,game_id:1,amount:gulkanPoints,balance:newGulkanPoints,credit_debit:'credit',type:'bonus',wallet_type:'gulkan_points'
            // });

            res.status(200).json({

              message:"money "+amount+" credited successfully",
              success:1
            });

        });
       
      }catch (err){
    
        next(err);
      }
    
    };
    

    exports.transferGulkan= (req,res,next) => {
      var user_id= req.userData.userId;
        try{
          User.findByPk(user_id).then(async userProfile=>{
            if(userProfile.gulkan_points>=500){
            var setting = await Setting.findOne({where:{slug:'gulkan_redeem_percent'}});
              var gulkanPoints= (setting.option/100)*userProfile.gulkan_points;
            
              var newGulkanPoints =0;
              var newWallet = parseInt(userProfile.wallet)+parseInt(gulkanPoints);
              console.log(newGulkanPoints);
              await User.update({wallet:newWallet,gulkan_points:newGulkanPoints},{where:{id:user_id}});
              await walletHistory.create({
                user_id:user_id,game_id:1,amount:gulkanPoints,balance:newGulkanPoints,credit_debit:'debit',type:'deposit',wallet_type:'gulkan_points'
              });
              await walletHistory.create({
                user_id:user_id,game_id:1,amount:gulkanPoints,balance:newWallet,credit_debit:'credit',type:'deposit',wallet_type:'wallet'
              });
         
  
              res.status(200).json({
  
                message:"money "+gulkanPoints+" transferred successfully",
                success:1
              });

            }else{

               res.status(200).json({
  
                message:"required Atleast  500 Gulkan Points",
              success:0
              });

            }
  
          });
         
        }catch (err){
      
          next(err);
        }
      
      };
      
      exports.Bakrecharge= (req,res,next) => {
        var user_id= req.userData.userId;
        var amount = req.body.amount;
          try{
            User.findByPk(user_id).then(async userProfile=>{
              var setting = await Setting.findOne({where:{slug:'gulkan_points_percent'}});
                var newWallet = parseInt(userProfile.wallet)+parseInt(amount);
                var gulkanPoints= (setting.option/100)*amount;
              
                var newGulkanPoints = parseInt(userProfile.gulkan_points)+parseInt(gulkanPoints);
                console.log(newGulkanPoints);
                await User.update({wallet:newWallet,gulkan_points:newGulkanPoints},{where:{id:user_id}});
                await walletHistory.create({
                  user_id:user_id,game_id:1,amount:amount,balance:newWallet,credit_debit:'credit',type:'deposit',wallet_type:'wallet'
                });
                await walletHistory.create({
                  user_id:user_id,game_id:1,amount:gulkanPoints,balance:newGulkanPoints,credit_debit:'credit',type:'bonus',wallet_type:'gulkan_points'
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