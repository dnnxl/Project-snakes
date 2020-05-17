const mysql = require('mysql');

const mysqlConnection = mysql.createConnection(
    {
        host: 'localhost',
        user: 'root',
        password: '5038Flyk',
        database: 'mydb',   
        insecureAuth : true     
    });

mysqlConnection.connect(function(err){
    if(err){
        console.log(err);
        return;
    }
    else{
        console.log('connected');
    }
});

module.exports = mysqlConnection;