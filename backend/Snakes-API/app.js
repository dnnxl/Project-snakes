const express = require('express');
const mysql = require('mysql');

const bodyParser = require('body-parser');

const PORT = process.env.PORT || 3000;

const app = express();
app.set("port", process.env.PORT || 3000);
app.set("host", process.env.HOST || "localhost");
app.use(bodyParser.json());

// MySql
var db_config = {
    host: 'us-cdbr-east-06.cleardb.net',
    user: 'bc90940cc532c6',
    password: 'fa6f0214',
    database: 'heroku_8b33e07051788b0'
  };
  
var mysqlConnection;
  
function handleDisconnect() {
    mysqlConnection = mysql.createConnection(db_config); // Recreate the connection, since
                                                    // the old one cannot be reused.
  
    mysqlConnection.connect(function(err) {              // The server is either down
      if(err) {                                     // or restarting (takes a while sometimes).
        console.log('error when connecting to db:', err);
        setTimeout(handleDisconnect, 2000); // We introduce a delay before attempting to reconnect,
      }                                     // to avoid a hot loop, and to allow our node script to
    });                                     // process asynchronous requests in the meantime.
                                            // If you're also serving http, display a 503 error.
    mysqlConnection.on('error', function(err) {
      console.log('db error', err);
      if(err.code === 'PROTOCOL_CONNECTION_LOST') { // Connection to the MySQL server is usually
        handleDisconnect();                         // lost due to either server restart, or a
      } else {                                      // connnection idle timeout (the wait_timeout
        throw err;                                  // server variable configures this)
      }
    });
}



// Route
app.get('/', (req, res) => {
  res.send('¡Welcome to SNAKES-API!');
});

// Images
app.get('/SnakesApi/Image/GetList', (req,res)=>{
  mysqlConnection.query('SELECT * FROM image', (err,rows,fields)=>{
      if(!err){
          res.json(rows);
      }else{
          console.log(err);
      }
  })
});

//GET: Obtener una imagen dado su id.
app.get('/SnakesApi/Image/Get/:NbImage', (req,res)=>{
  const{NbImage} = req.params;
  mysqlConnection.query('SELECT * FROM image where NbImage = ?' ,[NbImage], (err,rows,fields)=>{
      if(!err){
          res.json(rows[0]);
      }else{
          console.log(err);
      }
  });
});

//POST: Insertar una nueva imagen.
app.post('/SnakesApi/Image/Create',(req,res)=>{
  const{SnakeType} = req.body;
  const query = 'CALL imageAddOrEdit(?, ?);';
  mysqlConnection.query(query,[0,SnakeType],(err,rows,fields)=>{
      if(!err){
          res.json({Status:'Image saved.'});
      }else{
          console.log(err);
      }
  });
});

//PUT: Modificar una imagen dado su id.
app.put('/SnakesApi/Image/Edit/:NbImage',(req,res)=>{
  const{SnakeType} = req.body;
  const {NbImage} =  req.params;
  const query = 'CALL imageAddOrEdit(?, ?);';
  mysqlConnection.query(query,[NbImage,SnakeType],(err,rows,fields)=>{
      if(!err){
          res.json({Status:'Image updated.'});
      }else{
          console.log(err);
      }
  });
});

//DELETE: Eliminar una imagen dado su id.
app.delete('/SnakesApi/Image/Delete/:NbImage',(req,res)=>{
  const{NbImage} = req.params;
  mysqlConnection.query('DELETE FROM image where NbImage = ?', [NbImage], (err,rows,fields)=>{
      if(!err){
          res.json({status: 'Image deleted.'});
      }else{
          console.log(err);
      }
  });
});

// LogBook
//GET: Obtener lista de bitácoras.
app.get('/SnakesApi/LogBook/GetList', (req,res)=>{
  mysqlConnection.query('SELECT * FROM logbook', (err,rows,fields)=>{
      if(!err){
          res.json(rows);
      }else{
          console.log(err);
      }
  })
});

//GET: Obtener una bitácora dado su id.
app.get('/SnakesApi/LogBook/Get/:idLogBook', (req,res)=>{
  const{idLogBook} = req.params;
  mysqlConnection.query('SELECT * FROM logbook where idLogBook = ?' ,[idLogBook], (err,rows,fields)=>{
      if(!err){
          res.json(rows[0]);
      }else{
          console.log(err);
      }
  });
});

//POST: Insertar una nueva bitácora.
app.post('/SnakesApi/LogBook/Create',(req,res)=>{
  const{vChange} = req.body;
  const query = 'CALL logBookAddOrEdit(?, ?);';
  mysqlConnection.query(query,[0,vChange],(err,rows,fields)=>{
      if(!err){
          res.json({Status:'LogBook saved.'});
      }else{
          console.log(err);
      }
  });
});

//PUT: Modificar una bitácora dado su id.
app.put('/SnakesApi/LogBook/Edit/:idLogBook',(req,res)=>{
  const{vChange} = req.body;
  const {idLogBook} =  req.params;
  const query = 'CALL logBookAddOrEdit(?, ?);';
  mysqlConnection.query(query,[idLogBook,vChange],(err,rows,fields)=>{
      if(!err){
          res.json({Status:'LogBook updated.'});
      }else{
          console.log(err);
      }
  });
});

//DELETE: Eliminar una bitácora dado su id.
app.delete('/SnakesApi/LogBook/Delete/:idLogBook',(req,res)=>{
  const{idLogBook} = req.params;
  mysqlConnection.query('DELETE FROM logBook where idLogBook = ?', [idLogBook], (err,rows,fields)=>{
      if(!err){
          res.json({status: 'LogBook deleted.'});
      }else{
          console.log(err);
      }
  });
});

// PrincipalInformation
//GET: 
app.get('/SnakesApi/PrincipalInformation/GetList', (req,res)=>{
  mysqlConnection.query('SELECT * FROM principalInformation', (err,rows,fields)=>{
      if(!err){
          res.json(rows);
      }else{
          console.log(err);
      }
  })
});

//GET: 
app.get('/SnakesApi/PrincipalInformation/Get/:id', (req,res)=>{
  const{id} = req.params;
  mysqlConnection.query('SELECT * FROM principalInformation where idPrincipalInformation = ?' ,[id], (err,rows,fields)=>{
      if(!err){
          res.json(rows[0]);
      }else{
          console.log(err);
      }
  });
});

//POST: 
app.post('/SnakesApi/PrincipalInformation/Create',(req,res)=>{
  const{DTSighting,XCoordinate, YCoordinate,AditionalInformation, Image} = req.body;
  const query = 'CALL principalInfoAddOrEdit(?, ?,?,?,?,?);';
  mysqlConnection.query(query,[0,DTSighting,XCoordinate, YCoordinate,AditionalInformation, Image],(err,rows,fields)=>{
      if(!err){
          res.json({Status:'Information saved.'});
      }else{
          console.log(err);
      }
  });
});

//PUT:
app.put('/SnakesApi/PrincipalInformation/Edit/:id',(req,res)=>{
  const{DTSighting,XCoordinate, YCoordinate,AditionalInformation, Image} = req.body;
  const {id} =  req.params;
  const query = 'CALL principalInfoAddOrEdit(?, ?,?,?,?,?);';
  mysqlConnection.query(query,[id,DTSighting,XCoordinate, YCoordinate,AditionalInformation, Image],(err,rows,fields)=>{
      if(!err){
          res.json({Status:'Information updated.'});
      }else{
          console.log(err);
      }
  });
});

//DELETE: 
app.delete('/SnakesApi/PrincipalInformation/Delete/:id',(req,res)=>{
  const{id} = req.params;
  mysqlConnection.query('DELETE FROM principalInformation where idPrincipalInformation = ?', [id], (err,rows,fields)=>{
      if(!err){
          res.json({status: 'Information deleted.'});
      }else{
          console.log(err);
      }
  });
});

// Sighting

//GET: 
app.get('/SnakesApi/Sighting/GetList', (req,res)=>{
  mysqlConnection.query('SELECT * FROM sighting', (err,rows,fields)=>{
      if(!err){
          res.json(rows);
      }else{
          console.log(err);
      }
  })
});

//GET: 
app.get('/SnakesApi/Sighting/Get/:id', (req,res)=>{
  const{id} = req.params;
  mysqlConnection.query('SELECT * FROM sighting where NbSighting = ?' ,[id], (err,rows,fields)=>{
      if(!err){
          res.json(rows[0]);
      }else{
          console.log(err);
      }
  });
});

//POST: 
app.post('/SnakesApi/Sighting/Create',(req,res)=>{
  const{UserName,UserContact, XCoordinate, YCoordinate, TxtComent, ImageId,infoId} = req.body;
  const query = 'CALL sightingAddOrEdit(?,?,?,?,?,?,?,?,?);';
  mysqlConnection.query(query,[0,UserName,UserContact,null, XCoordinate, YCoordinate, TxtComent, ImageId,infoId],(err,rows,fields)=>{
      if(!err){
          res.json({Status:'Sighting was saved.'});
      }else{
          console.log(err);
      }
  });
});

//PUT:
app.put('/SnakesApi/Sighting/Edit/:id',(req,res)=>{
  const{UserName,UserContact,DTSighting, XCoordinate, YCoordinate, TxtComent, ImageId,infoId} = req.body;
  const {id} =  req.params;
  const query = 'CALL sightingAddOrEdit(?,?,?,?,?,?,?,?,?);';
  mysqlConnection.query(query,[id,UserName,UserContact,DTSighting, XCoordinate, YCoordinate, TxtComent, ImageId,infoId],(err,rows,fields)=>{
      if(!err){
          res.json({Status:'Sighting was updated.'});
      }else{
          console.log(err);
      }
  });
});

//DELETE: 
app.delete('/SnakesApi/Sighting/Delete/:id',(req,res)=>{
  const{id} = req.params;
  mysqlConnection.query('DELETE FROM sighting where NbSighting = ?', [id], (err,rows,fields)=>{
      if(!err){
          res.json({status: 'Sighting was deleted.'});
      }else{
          console.log(err);
      }
  });
});

//SightingByAnswer

//GET: 
app.get('/SnakesApi/SightingByAnswer/GetList', (req,res)=>{
  mysqlConnection.query('SELECT * FROM sightingbyanswer', (err,rows,fields)=>{
      if(!err){
          res.json(rows);
      }else{
          console.log(err);
      }
  })
});

//GET: 
app.get('/SnakesApi/SightingByAnswer/Get/:id', (req,res)=>{
  const{id} = req.params;
  mysqlConnection.query('SELECT * FROM sightingbyanswer where idSightingByAnswer = ?' ,[id], (err,rows,fields)=>{
      if(!err){
          res.json(rows[0]);
      }else{
          console.log(err);
      }
  });
});

//POST: 
app.post('/SnakesApi/SightingByAnswer/Create',(req,res)=>{
  const{DTSighting,XCoordinate, YCoordinate,AditionalInformation, Image} = req.body;
  const query = 'CALL sightingbyAnswerAddOrEdit(?, ?,?,?);';
  mysqlConnection.query(query,[0,DTSighting,XCoordinate, YCoordinate,AditionalInformation, Image],(err,rows,fields)=>{
      if(!err){
          res.json({Status:'Sighting by answer was saved.'});
      }else{
          console.log(err);
      }
  });
});

//PUT:
app.put('/SnakesApi/SightingByAnswer/Edit/:id',(req,res)=>{
  const{DTSighting,XCoordinate, YCoordinate,AditionalInformation, Image} = req.body;
  const {id} =  req.params;
  const query = 'CALL sightingbyAnswerAddOrEdit(?, ?,?,?);';
  mysqlConnection.query(query,[id,DTSighting,XCoordinate, YCoordinate,AditionalInformation, Image],(err,rows,fields)=>{
      if(!err){
          res.json({Status:'Sighting by answer was updated.'});
      }else{
          console.log(err);
      }
  });
});

//DELETE: 
app.delete('/SnakesApi/SightingByAnswer/Delete/:id',(req,res)=>{
  const{id} = req.params;
  mysqlConnection.query('DELETE FROM sightingbyanswer where idSightingByAnswer = ?', [id], (err,rows,fields)=>{
      if(!err){
          res.json({status: 'Sighting by answer was deleted.'});
      }else{
          console.log(err);
      }
  });
});

//Specialist
//GET: Obtener lista de especialistas.
app.get('/SnakesApi/Specialist/GetList', (req,res)=>{
  mysqlConnection.query('SELECT * FROM specialist', (err,rows,fields)=>{
      if(!err){
          res.json(rows);
      }else{
          console.log(err);
      }
  })
});

//GET: Obtener un objeto especialistas dado su id.
app.get('/SnakesApi/Specialist/Get/:NbSpecialist', (req,res)=>{
  const{NbSpecialist} = req.params;
  mysqlConnection.query('SELECT * FROM specialist where NbSpecialist = ?' ,[NbSpecialist], (err,rows,fields)=>{
      if(!err){
          res.json(rows[0]);
      }else{
          console.log(err);
      }
  });
});

//POST: Insertar un nuevo especialista.
app.post('/SnakesApi/Specialist/Create',(req,res)=>{
  const{NameSpecialist, PasswordSpecialist,AuthorAnswer} = req.body;
  const query = 'CALL specialistAddOrEdit(?, ?,?,?);';
  mysqlConnection.query(query,[0,NameSpecialist, PasswordSpecialist,AuthorAnswer],(err,rows,fields)=>{
      if(!err){
          res.json({Status:'Specialist saved.'});
      }else{
          console.log(err);
      }
  });
});

//PUT: Modificar un especialista dado su id.
app.put('/SnakesApi/Specialist/Edit/:NbSpecialist',(req,res)=>{
  const{NameSpecialist, PasswordSpecialist,AuthorAnswer} = req.body;
  const {NbSpecialist} =  req.params;
  const query = 'CALL specialistAddOrEdit(?, ?,?,?);';
  mysqlConnection.query(query,[NbSpecialist,NameSpecialist, PasswordSpecialist,AuthorAnswer],(err,rows,fields)=>{
      if(!err){
          res.json({Status:'Specialist updated.'});
      }else{
          console.log(err);
      }
  });
});

//DELETE: Eliminar un especialista dado su id.
app.delete('/SnakesApi/Specialist/Delete/:NbSpecialist',(req,res)=>{
  const{NbSpecialist} = req.params;
  mysqlConnection.query('DELETE FROM specialist where NbSpecialist = ?', [NbSpecialist], (err,rows,fields)=>{
      if(!err){
          res.json({status: 'Specialist deleted.'});
      }else{
          console.log(err);
      }
  });
});

// Check connect
handleDisconnect();

app.listen(app.get("port"), function() {
    console.log(
     "%s server listening at http://%s:%s",
      process.env.NODE_ENV,
     app.get("host"),
     app.get("port")
    );
  });

//app.listen(PORT, () => console.log(`Server running on port ${PORT}`));
