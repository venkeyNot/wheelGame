const db = require("../models");
const gamePlay = db.gamePlays;
const gamePosition = db.gamePosition;
const Color = db.color;
const walletHistory=db.walletHistory;
const User = db.user;
const Op = db.Sequelize.Op;
const Setting = db.setting;
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
                      var setting = await Setting.findOne({where:{slug:'gulkan_points_percent'}});
                      var winAmount= gameWinner.amount;
                      console.log(winAmount);
                      var nTimes =  gameWinner.ntimes;
                      var totalWinAmount = (winAmount*nTimes);
                      var newEarnings= winner.earnings+totalWinAmount;
                      var gulkanPoints= (setting.option/100)*totalWinAmount;
                      var newGulkanPoints = parseInt(winner.gulkan_points)+parseInt(gulkanPoints);

                      await User.update({earnings:newEarnings,gulkan_points:newGulkanPoints},{where:{id:gameWinner.user_id}});
                      await walletHistory.create({
                        user_id:winner.id,game_id:fetchPlay.id,amount:totalWinAmount,balance:newEarnings,credit_debit:'credit',type:'game'
                      });
                      await walletHistory.create({
                        user_id:winner.id,game_id:1,amount:gulkanPoints,balance:newGulkanPoints,credit_debit:'credit',type:'bonus',wallet_type:'gulkan_points'
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
 var recentColors= await gamePlay.findAll({attributes:['result'],limit:15,order:[['id','DESC']],where:{result:{[Op.not]:null}}});
 var allColors= await Color.findAll();
 var colorTotal={};
 for(let oneColor of allColors){

   var colorPositions= await gamePosition.findAll({where:{game_play_id:gamePlayId,option:oneColor.id}});
   var oneColorPositions= await gamePosition.findAll({where:{game_play_id:gamePlayId,option:oneColor.id,amount:1}});
   var sumOneColorPosition=0;
   var sumTwoColorPosition=0;
   var sumTenColorPosition=0;
   var sumHundredPosition=0;
   var sumFiveHundredColorPosition=0;
   var sumOneKColorPosition=0;
   var sumFiveKColorPosition=0;
   for(oneColorPosition of oneColorPositions){

    sumOneColorPosition += oneColorPosition.amount*oneColorPosition.ntimes;
   }

   var twoColorPositions= await gamePosition.findAll({where:{game_play_id:gamePlayId,option:oneColor.id,amount:2}});
   for(twoColorPosition of twoColorPositions){

    sumTwoColorPosition += twoColorPosition.amount*twoColorPosition.ntimes;
   }

   var tenColorPositions= await gamePosition.findAll({where:{game_play_id:gamePlayId,option:oneColor.id,amount:10}});
   for(tenColorPosition of tenColorPositions){

    sumTenColorPosition += tenColorPosition.amount*tenColorPosition.ntimes;
   }

   var hundredPositions= await gamePosition.findAll({where:{game_play_id:gamePlayId,option:oneColor.id,amount:100}});
   for(hundredPosition of hundredPositions){

    sumHundredPosition += hundredPosition.amount*hundredPosition.ntimes;
   }
   var fiveHundredColorPositions= await gamePosition.findAll({where:{game_play_id:gamePlayId,option:oneColor.id,amount:500}});
   for(fiveHundredColorPosition of fiveHundredColorPositions){

    sumFiveHundredColorPosition += fiveHundredColorPosition.amount*fiveHundredColorPosition.ntimes;
   }
   var oneKColorPositions= await gamePosition.findAll({where:{game_play_id:gamePlayId,option:oneColor.id,amount:1000}});
   for(oneKColorPosition of oneKColorPositions){

    sumOneKColorPosition += oneKColorPosition.amount*oneKColorPosition.ntimes;
   }
   var fiveKColorPositions= await gamePosition.findAll({where:{game_play_id:gamePlayId,option:oneColor.id,amount:5000}});
   for(fiveKColorPosition of fiveKColorPositions){

    sumFiveKColorPosition += fiveKColorPosition.amount*fiveKColorPosition.ntimes;
   }

   
   var colorAmount=0;
   console.log(colorPositions);
   for(let colorPosition of colorPositions){

      colorAmount +=  parseInt(colorPosition.amount)*parseInt(colorPosition.ntimes);
   }

    colorTotal[oneColor.slug] = {
      '1':sumOneColorPosition,
      '2':sumTwoColorPosition,
      '10':sumTenColorPosition,
      '100':sumHundredPosition,
      '500':sumFiveHundredColorPosition,
      '1k':sumOneKColorPosition,
      '5k':sumFiveKColorPosition,
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

   
    result:parseInt(result),
    game:gamePlayings,
    colors:colors,
    colorTotal:colorTotal
});


};