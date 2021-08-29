const db = require("../models");
const User = db.user;
const Op = db.Sequelize.Op;
module.exports= async (req,res,next)=>{
    try{

        var user= await User.findByPk(req.userData.userId);
      //  console.log(req.userData.id);
      var balance= user.wallet+user.earnings;
        if(balance>=req.body.amount){
        next();
        }
        else{

            res.status(401).json({

                message:"Insufficient Balance"
            });
        }
    }catch(err){

        res.status(401).json({

            message:"Insufficient Balance"
        });
    }
    





};