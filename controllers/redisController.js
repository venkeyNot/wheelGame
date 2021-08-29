const db = require("../models");
const redis= require('redis');
const User = db.user;
const connect =require('../config/redisConnect')
const Op = db.Sequelize.Op;

exports.connect= async(req,res)=>{
   
    connect.createConnection().then(client => {

     res.status(200).json({

        name:'hello'
     });
    });

  };
