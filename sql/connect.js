var mysql = require('mysql');

var con = mysql.createConnection({
  host: "localhost",
  user: "root",
  password: "MySQLloop123"
});

con.connect(function(err) {
  if (err) throw err;
  console.log("Connected!");
  
  con.query("SHOW DATABASES", function (err, result) {
    if (err) throw err;
    console.log(result)
});
});
