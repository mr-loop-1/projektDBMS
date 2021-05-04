const mysql = require('mysql');

const connection = mysql.createPool({
    host: "localhost",
    user: "root",
    password: "MySQLloop123",
    database: "metro3"
    // here you can set connection limits and so on
});

module.exports = connection;
