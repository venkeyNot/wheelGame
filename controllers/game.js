const db = require("../models");
const gamePlay = db.gamePlays;
const gamePosition = db.gamePosition;
const Color = db.color;
const walletHistory=db.walletHistory;
const User = db.user;
const Op = db.Sequelize.Op;
exports.games= (req,res) => {


   var time = setInterval(game,60000);


    function game(){

      var data= {game_id:1,time:60,time_left:40};

      var gameId;
      gamePlay.create(data).then(gameData=>{

      gameId=gameData.id;
      });

      var reduceTime= setInterval(reduce,1000);

        function reduce(){

          gamePlay.findByPk(gameId).then(

            fetchPlay=>{

              var time = (fetchPlay.time_left-1);
              var playData = {time_left:time};
              gamePlay.update(playData,{where:{id:fetchPlay.id}}).then(updatedGamePlay=>{

                gamePlay.findByPk(gameId).then(async againUpdatedGamePlay=>{
                  console.log(againUpdatedGamePlay.time_left);
                  if(againUpdatedGamePlay.time_left<1){

                    gamePlay.update({result_time:20},{where:{id:fetchPlay.id}});

                    // var allGamePositions= await gamePosition.findAll();
                    var oneGameColorAmount =[];
                    oneGameColorAmount[0] =0;
                   var colors =await Color.findAll();
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
                      console.log(resultLarge);
                      var result = randomResult(1, 6);
                      function randomResult(min, max) {
                        var num = Math.floor(Math.random() * (max - min + 1)) + min;
                        return (num === resultLarge) ? randomResult(min, max) : num;
                    }
                    
                    console.log(result);
                    // var allColors= ['30','60','90','120','150','180','210','240','270','300','330','360'];
                    // var random= Math.floor(Math.random()*allColors.length);

                    // var result=allColors[random];
                    gamePlay.update({result:result},{where:{id:fetchPlay.id}});

                    var allGameWinners= await gamePosition.findAll({where:{game_play_id:fetchPlay.id,option:result}});

                    for(let gameWinner of allGameWinners){
                      var winner =await User.findByPk(gameWinner.user_id);
                      var winAmount= gameWinner.amount;
                      console.log(winAmount);
                      var nTimes =  gameWinner.ntimes;
                      var totalWinAmount = (winAmount*nTimes);
                      var newEarnings= winner.earnings+totalWinAmount;

                      await User.update({earnings:newEarnings},{where:{id:gameWinner.user_id}});
                      await walletHistory.create({
                        user_id:winner.id,game_id:fetchPlay.id,amount:totalWinAmount,balance:newEarnings,credit_debit:'credit',type:'game'
                      });
                     //oneGameColorAmount.push(optionAmount*nTimes)
                    }
                    var reduceResultTime=setInterval(resultTime,1000);

                    async function resultTime(){
                      var resultGamePlay =await gamePlay.findByPk(gameId);
                      var clearResultTime = (resultGamePlay.result_time-1);

                      await gamePlay.update({result_time:clearResultTime},{where:{id:gameId}});
                      var resultCheck =await gamePlay.findByPk(gameId);
                      if(resultCheck.result_time<1){
                        console.log(resultCheck.result_time);

                        delete gameId,resultGamePlay,time,clearResultTime;
                        clearInterval(reduceResultTime);
                      }

                    }
                    clearInterval(reduceTime);
                    delete gameId,time,playData;
                  }
                });


                // res.status(200).send({
                //   message: "Mobile Verified Successfully",
                //   success:1
                // });
              }
              );


            }

          );

        }
    }
// setInterval(function() {
//         console.log('Time left:');
//     },1000);


    res.status(200).json({
      time:10,
      game:1,

  });

};


exports.result= async(req,res)=>{

 var gamePlayId= req.body.game_play_id;
 var gamePlayings= await gamePlay.findByPk(gamePlayId);
 if(gamePlayings.result){

  var colorId = gamePlayings.result;

  var color= await Color.findByPk(colorId);
  var degree= JSON.parse(color.degrees);
  var result =degree[1];
 
 }else{

  var result ='';
 }

  res.status(200).json({

   
    result:parseInt(result),
    game:gamePlayings,
});


};