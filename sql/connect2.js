var mysql = require('mysql');

var con = mysql.createConnection({
  host: "localhost",
  user: "root",
  password: "MySQLloop123"
});

var helo = "SELECT * FROM Station";

exports.helo = helo;
