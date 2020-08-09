const mysql = require('mysql');

var db_config = {
    host: 'localhost',
    user: 'root',
    password: '',
    database: 'test_user'
  };

module.exports = function() {
    mysql.createConnection(db_config).connect(function(err) {              // The server is either down
        if(err) {                                     // or restarting (takes a while sometimes).
          console.log('error when connecting to db:', err);
          setTimeout(handleDisconnect, 2000); // We introduce a delay before attempting to reconnect,
        }                                     // to avoid a hot loop, and to allow our node script to
      });
}