const Pusher = require("pusher");



module.exports = ()=>{
const pusher = new Pusher({
   appId: "1263492",
   key: "ee1c78c99a222d043d29",
   secret: "a51ea7cbe572d7946ac0",
   cluster: "ap2",
   useTLS: true
 });

}