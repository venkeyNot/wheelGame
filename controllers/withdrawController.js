const db = require("../models");
const withdrawRequest=db.withdrawRequest;
const User = db.user;
const Op = db.Sequelize.Op;
const TODAY_START = new Date().setHours(0, 0, 0, 0);
const NOW = new Date();
const Setting = db.setting;

exports.withdrawRequests= (req,res,next) => {
var user_id= req.userData.userId;
var search = req.body.search;
  try{


    withdrawRequest.findAll({
        where:{user_id:user_id},
        order: [ [ 'createdAt', 'DESC' ]],
    }).then(withdrawRequests=>{

        res.status(200).json({
            success:1,
            data:withdrawRequests,
        });

    });


  }catch (err){

    next(err);
  }

};


exports.request= (req,res,next) => {
    var user_id= req.userData.userId;
      try{
        User.findByPk(user_id).then(async userData=>{

          var todayWithdrawls= await withdrawRequest.findAll({  where: { user_id:user_id,
            createdAt: { 
        [Op.gt]: TODAY_START,
        [Op.lt]: NOW
      }}});
      var setting = await Setting.findOne({where:{slug:'max_withdrawls_per_day'}});
      if(todayWithdrawls.length<setting.option){



      
            var bankDetails= {

                bankAccountNumber:userData.bankAccountNumber,
                bankAccountName:userData.bankAccountName,
                bankIFSC:userData.bankIFSC,
                bankName:userData.bankName,
                bankAddress:userData.bankAddress,
                UPI:userData.UPI
            };

           // var newWallet = parseInt(userData.earnings)-parseInt(amount);
           var newWallet =0;
            await User.update({earnings:newWallet},{where:{id:user_id}});
            await withdrawRequest.create({
              user_id:user_id,amount:userData.earnings,bankDetails:JSON.stringify(bankDetails),comment:'credit',status:'pending'
            });

            res.status(200).json({

              message:"money "+amount+" credited successfully",
              success:1
            });

          }else{

            res.status(200).json({

              message:"Maximum withdrwal limited reached today",
              success:0
            });


          }

        });
       
      }catch (err){
    
        next(err);
      }
    
    };
    
