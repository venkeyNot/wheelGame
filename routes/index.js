var express = require('express');
var router = express.Router();
var registerController = require('../controllers/registerController');
/* GET home page. */
router.get('/',registerController.create);
router.post('/register',registerController.create);
router.post('/verifyMobile',registerController.verifyMobile);
module.exports = router;
