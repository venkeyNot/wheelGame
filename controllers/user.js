const db = require("../models");
const User = db.user;
const Setting = db.Setting;
const walletHistory=db.walletHistory;
const Op = db.Sequelize.Op;
const bcrypt= require('bcrypt');
// Create and Save a new Tutorial
exports.create = (req, res) => {
    if (!req.body.name ||  !req.body.mobile || !req.body.password  ) {
        res.status(400).send({
          message: "Fields required"
        });
      }

      var condition =  { mobile:req.body.mobile };
      var user = User.findAll({ where: condition }).then(userData=>{

      if(userData.length>0){

        res.status(500).json({
            message: "Number Already Exist",
            success:0
          });
      }else{

        bcrypt.hash(req.body.password,10,(err,hash)=>{

            if(err){

                res.status(500).json({
                    message: "failed",
                  });
            }else{

                const newUser = {
                    name:req.body.name,
                   // email:req.body.email,
                    mobile:req.body.mobile,
                    password: hash,
                    otp:Math.floor(Math.random() * (999999 - 100000) + 100000)
                  };
                  User.create(newUser)
                  .then(async data => {

                    var setting = await Setting.findOne({where:{slug:'registration_bonus'}});



                    res.status(200).send({
                        message: "OTP Sent to Your Mobile Number",
                        data: data,
                        success:1
                      });
                  });
            }

      });


      }


      });



  //  res.send(req.body.name);

};

// Retrieve all Tutorials from the database.
exports.findAll = (req, res) => {
    User.findAll()
    .then(data => {
      res.send(data);
    })
    .catch(err => {
      res.status(500).send({
        message:
          err.message || "Some error occurred while retrieving tutorials."
      });
    });
};

// Find a single Tutorial with an id
exports.findOne = (req, res) => {

};

// Update a Tutorial by the id in the request
exports.update = (req, res) => {
  
};

// Delete a Tutorial with the specified id in the request
exports.delete = (req, res) => {
  
};

// Delete all Tutorials from the database.
exports.deleteAll = (req, res) => {
  
};

// Find all published Tutorials
exports.findAllPublished = (req, res) => {
  
};


exports.verifyMobile = (req, res) => {
    const ids = req.body.id;
    const otp = req.body.otp;
    User.findByPk(ids)
    .then(data => {
      if(data.otp== otp){

        let values= {
            mobile_verified:"yes"
        };

        User.update(values,{where: {id:ids}}).then(num=>{

            res.status(200).send({
                message: "Mobile Verified Successfully",
                success:1
              });

        });

 
      }else{

        res.status(500).send({
            message: "Invalid OTP",
            success:0
          });
      }
    })
    .catch(err => {
      res.status(500).send({
        message: "Error retrieving Tutorial with id=" + id
      });
    });
};
