const db = require("../models");
const redis= require('redis');
const User = db.user;
const connect =require('../config/redisConnect')
const Op = db.Sequelize.Op;

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
