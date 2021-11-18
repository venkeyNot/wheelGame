const db = require("../models");
const User = db.user;
const Setting = db.setting;
const gamePosition= db.gamePosition;
const withdrawRequest=db.withdrawRequest;
const Op = db.Sequelize.Op;
const bcrypt= require('bcrypt');

const moment = require('moment');
const start = moment().format('YYYY-MM-DD 00:00:01');
const end = moment().format('YYYY-MM-DD 23:59:59');
exports.test= async(req,res)=>{


  var total=[99,79,223];
  var i = total.reduce((iMax, x, i, arr) => x > arr[iMax] ? i : iMax, 0);
  res.status(200).json({
    success:1,
    data:i,
    NOW:end

});

//   var allGameWinners= await gamePosition.findAll({where:{game_play_id:9,option:3}});

//   for(let gameWinner of allGameWinners){

//     console.log(gameWinner.id);
//   }
//   res.status(200).json({
//     success:1,
//     data:allGameWinners,
//     NOW:end

// });

  };
