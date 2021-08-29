const db = require("../models");
const gamePlays = db.gamePlays;
const User = db.user;
const Color = db.color;
const gamePosition = db.gamePosition;
const walletHistory=db.walletHistory;
const Op = db.Sequelize.Op;


exports.colors= (req,res) => {


  try{
    Color.findAll().then(colors=>{

    

        res.status(200).json({
            success:1,
            data:colors,
            message:'Colors fetched Successfully'
        });

    });
  }catch (err){

    next(err);
  }

};

exports.fetchGame= (req,res) => {


  try{
    gamePlays.findOne({
        order: [ [ 'createdAt', 'DESC' ]],
    }).then(async latestGame=>{
    var recentColors= await gamePlays.findAll({attributes:['result'],limit:15,order:[['id','DESC']],where:{result:{[Op.not]:null}}});
      console.log(latestGame);

        res.status(200).json({
            success:1,
            game:latestGame,
            colors:recentColors
        });

    });
  }catch (err){

    next(err);
  }

};


exports.play = async (req, res, next) => {

    var userId = req.userData.userId;
    var player =await User.findByPk(userId);
    var amount = req.body.amount;
    var balance= player.wallet+player.earnings;
    if(balance<amount){


      res.status(200).send({
        message: "Insufficient Amount",
        success:1
      });

    }else{

      if(amount>=player.wallet){

        var newWallet= player.wallet - amount;
        var useEarning = player.earnings+(newWallet);
        var debitWallet= 0;
        var debitEarnings= useEarning;
        await User.update({wallet:debitWallet,earnings:debitEarnings},{where:{id:player.id}});
        await walletHistory.create({
          user_id:player.id,game_id:1,amount:-amount,balance:debitWallet,credit_debit:'debit',type:'game'
        });

      }else{

        var debitWallet= player.wallet-amount;

        await User.update({wallet:debitWallet},{where:{id:player.id}});
        await walletHistory.create({
          user_id:player.id,game_id:1,amount:-amount,balance:debitWallet,credit_debit:'debit',type:'game'
        });

      }


      const newPlay = {
        user_id:userId,
        game_id:1,
        game_play_id:req.body.game_play_id,
        option:req.body.option,
        ntimes:req.body.ntimes,
        amount:req.body.amount
      };
      gamePosition.create(newPlay)
      .then(data => {

        res.status(200).send({
            message: "Game Placed Successfully",
            data: data,
            success:1
          });
      });
    }

};

exports.result= async(req,res)=>{

  
  var oneGameColorAmount =[];
   oneGameColorAmount[0] =0;
  var colors =await Color.findAll();
//   colors.forEach(async(color)=>{
//     var allGamePositions= await gamePosition.findAll({where:{game_play_id:1,option:color.id}});
//     allGamePositions.forEach((gamePosition)=>{
     
//      var optionAmount= gamePosition.amount;
//      var nTimes =  gamePosition.ntimes;
//     // oneGameColorAmount[color.id] = (optionAmount*nTimes);
//     positions.push(optionAmount*nTimes)

// //       oneGameColorAmount[color.id] += (optionAmount*nTimes);
// //       console.log(oneGameColorAmount[color.id]);
//      });
   
//     //  console.log(total);
//     oneGameColorAmount = positions;

//     console.log(oneGameColorAmount);

//   });
for(let color of colors){
  var allGamePositions= await gamePosition.findAll({where:{game_play_id:1,option:color.id}});
  for(let gamePosition of allGamePositions){
    var optionAmount= gamePosition.amount;
    var nTimes =  gamePosition.ntimes;
    oneGameColorAmount[color.id] = (optionAmount*nTimes);
   //oneGameColorAmount.push(optionAmount*nTimes)
  }
}

var resultLarge =oneGameColorAmount.indexOf(Math.max.apply(Math, oneGameColorAmount));
  //console.log(resultLarge);
  var result = randomResult(1, 6);
  function randomResult(min, max) {
    var num = Math.floor(Math.random() * (max - min + 1)) + min;
    return (num === resultLarge) ? randomResult(min, max) : num;
}

// console.log(result);



//   res.status(200).json({

//     color:parseInt(result),
//     result_time:data[0],
//     game:allGamePositions,
// });


};


