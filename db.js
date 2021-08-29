var mysql = require('mysql')
var connection = mysql.createConnection({
  host: 'localhost',
  user: 'root',
  password: 'swathi',
  database: 'Wheel'
})

connection.connect((err) => {
    if (err) throw err;
    console.log('Connected to the MySql DB');
});