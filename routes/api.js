var express = require('express');
var router = express.Router();
var multer = require('multer');
var upload= multer({ dest: 'public/images/' });
var userController = require('../controllers/user');
var profileController = require('../controllers/profile');
var authController = require('../controllers/auth');
var gameController = require('../controllers/game');
var playGameController = require('../controllers/playGame');
var walletController = require('../controllers/walletController');
var userAuth = require('../middleware/userAuth');
var walletBalance = require('../middleware/walletBalance');
var withdrawController = require('../controllers/withdrawController');
var redisController = require('../controllers/redisController');
var testController = require('../controllers/testController');
var settingController = require('../controllers/settingController');
var bonusController = require('../controllers/bonusController');
/* GET home page. */
router.post('/register',userController.create);
router.post('/users',userController.findAll);
router.post('/verify',userController.verifyMobile);

router.post('/login',authController.login);
router.post('/forgot/reset',authController.resetPassword);
router.post('/forgot/change',authController.changePassword);

router.get('/profile',userAuth, profileController.profile);
router.post('/profile/bank',userAuth, profileController.updateBank);
router.post('/profile/update',userAuth, profileController.updateProfile);
router.post('/profile/changePassword',userAuth, profileController.changePassword);


router.post('/wallet/history',userAuth, walletController.history);
// router.post('/wallet/recharge',userAuth, walletController.recharge);
router.get('/wallet/gulkanToWallet',userAuth, walletController.transferGulkan);

router.get('/fetchGame', playGameController.fetchGame);
router.get('/colors', playGameController.colors);
router.post('/play',[userAuth,walletBalance], playGameController.play);


router.get('/game', gameController.games);
router.post('/result', gameController.result);

router.post('/test', testController.test);
// router.get('/create', redisController.create);
// router.get('/connect', redisController.connect);
// router.get('/pusher', redisController.pusher);
router.get('/withdraws',userAuth, withdrawController.withdrawRequests);
router.post('/withdraw/request',userAuth, withdrawController.request);
router.post('/deposit/request',userAuth, walletController.depositRequest);
router.get('/setting', settingController.settings);
router.get('/siteSetting', settingController.siteSettings);
router.get('/createDailyBonus', bonusController.createDailyBonus);
router.post('/claimBonus',userAuth, bonusController.claimBonus);
router.get('/dailyBonus', userAuth, bonusController.dailyBonus);
router.post('/upload/profile_pic', upload.single('profile_pic'), function (req, res, next) {
    let extArray = req.file.mimetype.split("/");
    let extension = extArray[extArray.length - 1];
    var file=req.file.filename+'.'+extension;
    res.status(200).send({
        message: "Profile Picture Uploaded Successfully",
        image:file,
        success:1
      });
  });

  router.post('/upload', upload.single('image'), function (req, res, next) {
    let extArray = req.file.mimetype.split("/");
    let extension = extArray[extArray.length - 1];
    var file=req.file.filename+'.'+extension;
    res.status(200).send({
        message: "Profile Picture Uploaded Successfully",
        image:file,
        success:1
      });
  });
module.exports = router;