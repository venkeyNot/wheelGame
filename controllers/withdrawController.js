const db = require("../models");
process.env.TZ = "Asia/Calcutta";
const withdrawRequest=db.withdrawRequest;
const User = db.user;
const Op = db.Sequelize.Op;
const moment = require('moment');
// const TODAY_START =  moment().startOf('day');;
// const NOW = moment().endOf('day');
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
            START:TODAY_START,
            NOW:NOW

        });

    });


  }catch (err){

    next(err);
  }

};


exports.request= (req,res,next) => {
    var user_id= req.userData.userId;
    var amount =req.body.amount;
  
      try{
        User.findByPk(user_id).then(async userData=>{
       
          var todayWithdrawls= await withdrawRequest.count({  where: { user_id:user_id,
            createdAt:{ 
              [Op.gt]: TODAY_START,
              [Op.lt]: NOW
            },
            }});
      var setting = await Setting.findOne({where:{slug:'max_withdrawls_per_day'}});
      var freeWithdrwal = await Setting.findOne({where:{slug:'free_withdrawls_per_day'}});
      var withdrwalFee = await Setting.findOne({where:{slug:'withdrawl_fee'}});

      console.log(todayWithdrawls);
      if(todayWithdrawls<setting.option){

        var fee=2;
        if(todayWithdrawls>=freeWithdrwal.option){

          var fee= (amount/100)*withdrwalFee.option;
        }

            var bankDetails= {

                bankAccountNumber:userData.bankAccountNumber,
                bankAccountName:userData.bankAccountName,
                bankIFSC:userData.bankIFSC,
                bankName:userData.bankName,
                bankAddress:userData.bankAddress,
                UPI:userData.UPI
            };

           // var newWallet = parseInt(userData.earnings)-parseInt(amount);
            console.log(amount);
           if(amount<=userData.earnings){

            var newWallet =userData.earnings-amount;
            await User.update({earnings:newWallet},{where:{id:user_id}});
            var date= moment().format('YYYY-MM-DD');
            await withdrawRequest.create({
              user_id:user_id,amount:amount,fee:fee,bankDetails:JSON.stringify(bankDetails),date:date,comment:'credit',status:'pending'
            });

            res.status(200).json({

              message:"Amount "+amount+" Withdraw requested successfully",
              success:1,
             
            });
          }else{


            res.status(200).json({
  
              message:"Insufficient Balance",
              success:0
            });
  
          }
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
    
 