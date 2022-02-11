"user strict";
var request = "";

var mysql = require("mysql2");
var connection = mysql.createConnection({
  host: process.env.DataBaseHost,
  user: process.env.DataBaseUserName,
  database: process.env.DataBaseName,
  port: process.env.DataBasePort,
});

export default connection.promise();
