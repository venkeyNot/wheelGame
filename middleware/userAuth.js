const jwt = require('jsonwebtoken');
require('dotenv').config();
module.exports= (req,res,next)=>{
    try{

        const decoded = jwt.verify(req.headers.token,process.env.JWT_KEY);
        req.userData=decoded;
        next();

    }catch(err){

        res.status(200).json({

            message:"AUTH Failed"
        });
    }
    





};