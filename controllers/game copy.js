const db = require("../models");
process.env.TZ = "Asia/Kolkata";
const gamePlay = db.gamePlays;
const gamePosition = db.gamePosition;
const Color = db.color;
const walletHistory=db.walletHistory;
const User = db.user;
const Setting = db.setting;
const siteSetting = db.siteSetting;
const adminEarning= db.adminEarning;
const Op = db.Sequelize.Op;
const moment = require('moment');
const today = moment().format('YYYY-MM-DD');
const Pusher = require("pusher");

const pusher = new Pusher({
   appId: "1263492",
   key: "ee1c78c99a222d043d29",
   secret: "a51ea7cbe572d7946ac0",
   cluster: "ap2",
   useTLS: true
 });

exports.games= async (req,res) => {


    try {

      var getGame = await  gamePlay.findOne({
        order: [ [ 'createdAt', 'DESC' ]],
    });

     

    if(getGame.status=='started' || getGame.status=='result'){


      await gamePlay.update({status:'stopped',refund_status:'pending'},{where:{id:getGame.id}});

    }

      clearInterval(gameServerTime);
      clearInterval(reduceResultTime);
      clearInterval(reduceTime);
    }catch (err) {
      
}


   var gameServerTime = setInterval(game,60000);
   var siteSettings= await siteSetting.findByPk(1);

     async function game(){

      var runningGames =  await  gamePlay.count({where:{status:['started','result']}});
    console.log("runningGames");
    console.log(runningGames);

    if(runningGames>1){

      try{
        await gamePlay.update({status:'stopped',refund_status:'pending'},{where:{status:['started','result']}});
      clearInterval(gameServerTime);
      clearInterval(reduceResultTime);
      clearInterval(reduceTime);
      }catch(err){


      }
      

    }
    if(siteSettings.gameServerStatus=='stop'){

      clearInterval(gameServerTime);
    }




      var data= {game_id:1,time:60,time_left:40};

        
      await gamePlay.create(data).then(gameData=>{
       
   
      gameId=gameData.id;
   

      var reduceTime= setInterval(reduce,1000);

       async function reduce(){

         var  fetchPlay= await gamePlay.findByPk(gameId);

              var time = (fetchPlay.time_left-1);
              var playData = {time_left:time,status:'started'};
             await  gamePlay.update(playData,{where:{id:fetchPlay.id}}).then(async updatedGamePlay=>{

               var againUpdatedGamePlay=await gamePlay.findByPk(fetchPlay.id);
                   console.log(againUpdatedGamePlay.time_left);
                  //Virtual Coin bot Players
                //   try{
                //    if(againUpdatedGamePlay.time_left>1){

                //      var botColors= ['white','blue','red'];
                //      var botAmount= ['1','10','100','1','10','100','1','10','100','1','10','100','1','10','100','1','10','100','1','10','100','1000','5000'];
                //      var colorRandom= Math.floor(Math.random()*botColors.length);
                //      var amountRandom= Math.floor(Math.random()*botAmount.length);
                //      var resultColor=botColors[colorRandom];
                //      var resultAmount=botAmount[amountRandom];
                //     pusher.trigger("game."+gameId+"", "play", {
                //       option: resultAmount,
                //       color:resultColor,
                //       user_id:0
                //     });
                //    }
                //   }catch (err) {
                //     // handle the error safely
                //     console.log(err)
                // }
                  if(againUpdatedGamePlay.time_left<1){

                    gamePlay.update({result_time:20,status:'result'},{where:{id:fetchPlay.id}});

                    // var allGamePositions= await gamePosition.findAll();
                    var oneGameColorAmount =[];
                    var oneGameColorPlacedAmount=[];
                    oneGameColorAmount[0] =0;
                    oneGameColorPlacedAmount[0] =0;
                    oneGameColorAmount[6] =0;
                    oneGameColorPlacedAmount[6] =0;
                    oneGameColorAmount[4] =0;
                    oneGameColorPlacedAmount[4] =0;
                    oneGameColorAmount[5] =0;
                    oneGameColorPlacedAmount[5] =0;
                    
                    var colors =await Color.findAll({where:{status:'show'}});
         

                    for(let color of colors){
                      console.log('color id');
                      console.log(color.id);
                      oneGameColorAmount[color.id]=0;
                      oneGameColorPlacedAmount[color.id]=0;

                      console.log('oneGameColorPlacedAmount');
                      console.log(oneGameColorPlacedAmount);
                      var allGamePositions= await gamePosition.findAll({where:{game_play_id:fetchPlay.id,option:color.id}});

                      console.log('allGamePositions');
                      console.log(allGamePositions);
            
                      for(let gamePosition of allGamePositions){
                        var optionAmount= gamePosition.amount;
                        var nTimes =  gamePosition.ntimes;

                        oneGameColorPlacedAmount[color.id] += (optionAmount);
                        oneGameColorAmount[color.id] += (optionAmount*nTimes);
                       //oneGameColorAmount.push(optionAmount*nTimes)
                      }
                  
                    }
                    var totalPlacedAmount=0;
                    console.log('oneGameColorPlacedAmount');
                    console.log(oneGameColorPlacedAmount.length);
                  //  if(oneGameColorPlacedAmount.length>1){
                    
                    for(let placedAmount of oneGameColorPlacedAmount){

                      totalPlacedAmount += placedAmount;
                      console.log('placed Amount');
                      console.log(placedAmount);
                    
                    }
               //   }
                    var selectedColors = [];
                    
                    for(i=1;i<=6;i++){

                      if(i==1 || i==2 || i==3){

                      if(totalPlacedAmount>oneGameColorAmount[i]){
                        selectedColors.push(i);
                      }

                    }
                    }
                 
                    // for(colorAmount of oneGameColorAmount){

                    
                    // }

                    if(selectedColors.length==0){

                      selectedColors=[1,2,3];

                    }
                    console.log("selectedColors");
                    console.log(selectedColors.length);
                    // console.log(oneGameColorAmount);
                    // console.log(oneGameColorPlacedAmount);
                   // var rand = (selectedColors.length-1);
                    // console.log('rand');
                    // console.log(rand);
                    // var randomColor= Math.floor(Math.random()*rand);
                    var randomColor= randomResult(0, selectedColors.length-1);
                    var result = selectedColors[randomColor];
                    //  var result =selectedColors.indexOf(selectedColors[randomColor]);
                     
                   //  var result = randomResult(1, selectedColors.length);
                      function randomResult(min, max) {
                        return Math.floor(Math.random() * (max - min + 1)) + min;

                      }
                    //     return (num === resultLarge) ? randomResult(min, max) : num;
                    // }
                    console.log("randomColor");
                    console.log(randomColor);
                    console.log("result");
                     console.log(result);
                   // console.log(resultLarge);
                    // var allColors= ['30','60','90','120','150','180','210','240','270','300','330','360'];
                    // var random= Math.floor(Math.random()*allColors.length);

                    // var result=allColors[random];
                   await gamePlay.update({result:result},{where:{id:fetchPlay.id}});

                    var allGameWinners= await gamePosition.findAll({where:{game_play_id:fetchPlay.id,option:result,status:'pending'}});
                    console.log("Game Winners");
                    // console.log(allGameWinners).length;
                    
                    for(let gameWinner of allGameWinners){
                      var winner =await User.findByPk(gameWinner.user_id);
                      var setting = await Setting.findOne({where:{slug:'gulkan_points_percent'}});
                      var winAmount= gameWinner.amount;
                      // console.log(winAmount);
                      var nTimes =  gameWinner.ntimes;
                      var totalWinAmount = (winAmount*nTimes);
                      var newEarnings= winner.earnings+totalWinAmount;
                      var newBalance = winner.wallet+newEarnings;
                      var gulkanPoints= (setting.option/100)*totalWinAmount;
                      var newGulkanPoints = parseFloat(winner.gulkan_points)+parseFloat(gulkanPoints);

                      await User.update({earnings:newEarnings,gulkan_points:newGulkanPoints},{where:{id:gameWinner.user_id}});

                      var checkPosition= await gamePosition.findByPk(gameWinner.id);
                      if(checkPosition.status!='cleared'){
                      await walletHistory.create({
                        user_id:winner.id,game_id:fetchPlay.id,amount:totalWinAmount,balance:newBalance,credit_debit:'credit',type:'game',wallet_type:'earnings',comment:result
                      });
                      await walletHistory.create({
                        user_id:winner.id,game_id:fetchPlay.id,amount:gulkanPoints,balance:(newBalance+gulkanPoints),credit_debit:'credit',type:'bonus',wallet_type:'gulkan_points',comment:result
                      });
                      await gamePosition.update({
                        status:'cleared'
                      },{where:{id:gameWinner.id}});
                    }
                     //oneGameColorAmount.push(optionAmount*nTimes)
                    }


            // var date= moment().format('YYYY-MM-DD');
                    // var todayEarnings= await adminEarning.findAndCountAll({  where: { 
  
                    //   date:today,
                    //   }});
                              

                                  
                    var winGameColorAmount= oneGameColorAmount[result];
                    var adminProfit= totalPlacedAmount-winGameColorAmount;
                    var totalAdminProfit = siteSettings.admin_profit + adminProfit;
                    // console.log("placedamount");
                    // console.log(totalPlacedAmount);

                    // console.log("wincolor");
                    // console.log(winGameColorAmount);

                    // console.log("Admin Profit");
                    // console.log(date);


                    // console.log("Today Earnings");
                    // console.log(todayEarnings.count);

                  // if(todayEarnings.count<1){

                  //   await  adminEarning.create({date:date,amount:adminProfit,day:1})

                  // }else{
                  

                    // var adminEarningId= todayEarnings.rows[0].id;
                    // var fetchEarning= await adminEarning.findByPk(adminEarningId);
                    // var newAdminEarnings= fetchEarning.amount + adminProfit;
                    // await adminEarning.update({amount:newAdminEarnings},{where:{id:adminEarningId}});



                  // }


                          //      var resultCheck =await gamePlay.findByPk(gameId);
                  var reduceResultTime=setInterval(resultTime,1000);
                  var gameId=fetchPlay.id;
                    async function resultTime(){
                      var resultGamePlay =await gamePlay.findByPk(gameId);
                      var clearResultTime = (resultGamePlay.result_time-1);

                      await gamePlay.update({result_time:clearResultTime},{where:{id:gameId}});
                      var resultCheck =await gamePlay.findByPk(gameId);
                      if(resultCheck.result_time<1){
                        console.log("result_time");
                        console.log(resultCheck.result_time);
                        await gamePlay.update({status:'closed',admin_profit:adminProfit,comment:'result'+result+'random'+randomColor+''},{where:{id:gameId}});
                       // await siteSetting.update({admin_profit:totalAdminProfit},{where:{id:1}});
                        delete gameId,resultGamePlay,time,clearResultTime,result,fetchPlay;
                        clearInterval(reduceResultTime);
             
                        if(siteSettings.gameServerStatus=='stop'){

                          clearInterval(gameServerTime);
                        }


                      }

                    }
                    clearInterval(reduceTime);
                    delete gameId,time,playData;
                  }
              
              }
              );


        }
      });
    }

    
    res.status(200).json({
      message:'Game Server Started Successfully',
      success:0,

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
 var allColors= await Color.findAll({where:{status:'show'}});
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