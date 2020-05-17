const express = require('express');
const router = express.Router();
const mysqlConnection = require('../database');

//GET: 
router.get('/SnakesApi/SightingByAnswer/GetList', (req,res)=>{
    mysqlConnection.query('SELECT * FROM sightingbyanswer', (err,rows,fields)=>{
        if(!err){
            res.json(rows);
        }else{
            console.log(err);
        }
    })
});

//GET: 
router.get('/SnakesApi/SightingByAnswer/Get/:id', (req,res)=>{
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
router.post('/SnakesApi/SightingByAnswer/Create',(req,res)=>{
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
router.put('/SnakesApi/SightingByAnswer/Edit/:id',(req,res)=>{
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
router.delete('/SnakesApi/SightingByAnswer/Delete/:id',(req,res)=>{
    const{id} = req.params;
    mysqlConnection.query('DELETE FROM sightingbyanswer where idSightingByAnswer = ?', [id], (err,rows,fields)=>{
        if(!err){
            res.json({status: 'Sighting by answer was deleted.'});
        }else{
            console.log(err);
        }
    });
});

module.exports = router;