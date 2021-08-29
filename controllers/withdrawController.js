const db = require("../models");
const withdrawRequest=db.withdrawRequest;
const User = db.user;
const Op = db.Sequelize.Op;


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
    var amount = req.body.amount;
      try{
        User.findByPk(user_id).then(async userData=>{

            var bankDetails= {

                bankAccountNumber:userData.bankAccountNumber,
                bankAccountName:userData.bankAccountName,
                bankIFSC:userData.bankIFSC,
                bankName:userData.bankName,
                bankAddress:userData.bankAddress,
                UPI:userData.UPI
            };

            var newWallet = parseInt(userData.earnings)-parseInt(amount);
            
            await User.update({earnings:newWallet},{where:{id:user_id}});
            await withdrawRequest.create({
              user_id:user_id,amount:amount,bankDetails:JSON.stringify(bankDetails),comment:'credit',status:'pending'
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
    
