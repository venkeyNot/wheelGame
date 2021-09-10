const db = require("../models");
const gamePlays = db.gamePlay;
const User = db.user;
const Color = db.color;
const gamePosition = db.gamePosition;
const walletHistory=db.walletHistory;
const siteSetting = db.siteSetting;
const Op = db.Sequelize.Op;
const Pusher = require("pusher");

const pusher = new Pusher({
   appId: "1263492",
   key: "ee1c78c99a222d043d29",
   secret: "a51ea7cbe572d7946ac0",
   cluster: "ap2",
   useTLS: true
 });



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

exports.fetchGame= async (req,res) => {

  var siteSettings= await siteSetting.findByPk(1);

  console.log(siteSettings);
  try{
    gamePlays.findOne({
        order: [ [ 'createdAt', 'DESC' ]],
    }).then(async latestGame=>{

    // if(latestGame.status=='started'){
    var recentColors= await gamePlays.findAll({attributes:['result'],limit:15,order:[['id','DESC']],where:{result:{[Op.not]:null}}});
    var allColors= await Color.findAll();
    var colorTotal={};
    var gamePlayId= latestGame.id;
    console.log(gamePlayId);
    for(let oneColor of allColors){
   
      var colorPositions= await gamePosition.findAll({where:{game_play_id:gamePlayId,option:oneColor.id}});
      var oneColorPositions= await gamePosition.findAll({where:{game_play_id:gamePlayId,option:oneColor.id,amount:1}});
      // var sumOneColorPosition=0;
      // var sumTwoColorPosition=0;
      // var sumTenColorPosition=0;
      // var sumHundredPosition=0;
      // var sumFiveHundredColorPosition=0;
      // var sumOneKColorPosition=0;
      // var sumFiveKColorPosition=0;
      // for(oneColorPosition of oneColorPositions){
   
      //  sumOneColorPosition += oneColorPosition.amount*oneColorPosition.ntimes;
      // }
   
      var twoColorPositions= await gamePosition.findAll({where:{game_play_id:gamePlayId,option:oneColor.id,amount:2}});
      // for(twoColorPosition of twoColorPositions){
   
      //  sumTwoColorPosition += twoColorPosition.amount*twoColorPosition.ntimes;
      // }
   
      var tenColorPositions= await gamePosition.findAll({where:{game_play_id:gamePlayId,option:oneColor.id,amount:10}});
      // for(tenColorPosition of tenColorPositions){
   
      //  sumTenColorPosition += tenColorPosition.amount*tenColorPosition.ntimes;
      // }
   
      var hundredPositions= await gamePosition.findAll({where:{game_play_id:gamePlayId,option:oneColor.id,amount:100}});
      // for(hundredPosition of hundredPositions){
   
      //  sumHundredPosition += hundredPosition.amount*hundredPosition.ntimes;
      // }
       var fiveHundredColorPositions= await gamePosition.findAll({where:{game_play_id:gamePlayId,option:oneColor.id,amount:500}});
      // for(fiveHundredColorPosition of fiveHundredColorPositions){
   
      //  sumFiveHundredColorPosition += fiveHundredColorPosition.amount*fiveHundredColorPosition.ntimes;
      // }
      var oneKColorPositions= await gamePosition.findAll({where:{game_play_id:gamePlayId,option:oneColor.id,amount:1000}});
      // for(oneKColorPosition of oneKColorPositions){
   
      //  sumOneKColorPosition += oneKColorPosition.amount*oneKColorPosition.ntimes;
      // }
      var fiveKColorPositions= await gamePosition.findAll({where:{game_play_id:gamePlayId,option:oneColor.id,amount:5000}});
      // for(fiveKColorPosition of fiveKColorPositions){
   
      //  sumFiveKColorPosition += fiveKColorPosition.amount*fiveKColorPosition.ntimes;
      // }
   
      
      var colorAmount=0;
      console.log(colorPositions);
      for(let colorPosition of colorPositions){
   
         colorAmount +=  parseInt(colorPosition.amount);
      }
   
       colorTotal[oneColor.slug] = {
         '1':oneColorPositions.length,
         '2':twoColorPositions.length,
         '10':tenColorPositions.length,
         '100':hundredPositions.length,
         '500':fiveHundredColorPositions.length,
         '1k':oneKColorPositions.length,
         '5k':fiveKColorPositions.length,
         total:colorAmount
       };
   
    }
    var colors =[];
    var i=0;
    for(let recentColor of recentColors){
     var colorName= await Color.findByPk(recentColor.result);
     colors[i] = colorName.slug;
     i++;
    }
      

        res.status(200).json({
            success:1,
            game:latestGame,
            colors:colors,
            colorTotal:colorTotal
        });
      // }
      
      // else{

      //   res.status(200).json({
      //     success:1,
      //     game:'waiting for the New Game',
      //     time:5
      // });

      // }
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
      var gameServer= await gamePlays.findByPk(req.body.game_play_id);
      console.log(gameServer);
      if(gameServer.status=='started'){

      if(amount>=player.wallet){

        var newWallet= player.wallet - amount;
        var useEarning = player.earnings+(newWallet);
        var debitWallet= 0;
        var debitEarnings= useEarning;
        await User.update({wallet:debitWallet,earnings:debitEarnings},{where:{id:player.id}});
        await walletHistory.create({
          user_id:player.id,game_id:1,amount:-amount,balance:debitWallet,credit_debit:'debit',type:'game',wallet_type:'earnings'
        });

      }else{

        var debitWallet= player.wallet-amount;

        await User.update({wallet:debitWallet},{where:{id:player.id}});
        await walletHistory.create({
          user_id:player.id,game_id:1,amount:-amount,balance:debitWallet,credit_debit:'debit',type:'game',wallet_type:'wallet'
        });

      }

      var color = await Color.findByPk(req.body.option);
      console.log(color);
      const newPlay = {
        user_id:userId,
        game_id:1,
        game_play_id:req.body.game_play_id,
        option:req.body.option,
        ntimes:color.ntimes,
        amount:req.body.amount
      };
      gamePosition.create(newPlay)
      .then(data => {

        pusher.trigger("game."+req.body.game_play_id+"", "play", {
          option: req.body.amount,
          color:color.slug,
          user_id:userId
        });
        res.status(200).send({
            message: "Game Placed Successfully",
            data: data,
            success:1
          });
      });

    }else{

      res.status(200).send({
        message: "Game is  Not running",
        success:0,
      });
    }
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


