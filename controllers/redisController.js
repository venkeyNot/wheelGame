const db = require("../models");
const redis= require('redis');
const User = db.user;
const connect =require('../config/redisConnect')
const Op = db.Sequelize.Op;
const Pusher = require("pusher");

const pusher = new Pusher({
   appId: "1263492",
   key: "ee1c78c99a222d043d29",
   secret: "a51ea7cbe572d7946ac0",
   cluster: "ap2",
   useTLS: true
 });

exports.create= async(req,res)=>{


   var client = redis.createClient();
   client.publish('notification', '{\”message\”:\”Hello world from Asgardian!\”}', function(){
     // process.exit(0);
     client.set("foo","hello");
     });
     res.status(200).json({

      message:'success'
     });
  };
 

exports.connect= async(req,res)=>{
   var client = redis.createClient();
   client.on('message', function (channel, message) {
      console.log('Message: ' + message + ' on channel: ' + channel + ' is arrive!');
     });
     client.subscribe('notification');

     res.status(200).json({

      message:'success'
     });
 
  };
  exports.pusher= async(req,res)=>{

   pusher.trigger("game", "play", {
      message: "hello world"
    });

    res.status(200).json({

      message:'success'
     });
  };
