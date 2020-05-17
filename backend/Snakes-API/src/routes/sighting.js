const express = require('express');
const router = express.Router();
const mysqlConnection = require('../database');

//GET: 
router.get('/SnakesApi/Sighting/GetList', (req,res)=>{
    mysqlConnection.query('SELECT * FROM sighting', (err,rows,fields)=>{
        if(!err){
            res.json(rows);
        }else{
            console.log(err);
        }
    })
});

//GET: 
router.get('/SnakesApi/Sighting/Get/:id', (req,res)=>{
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
router.post('/SnakesApi/Sighting/Create',(req,res)=>{
    const{UserName,UserContact,DTSighting, XCoordinate, YCoordinate, TxtComent, ImageId,infoId} = req.body;
    const query = 'CALL sightingAddOrEdit(?, ?,?,?,?,?,?,?,?);';
    mysqlConnection.query(query,[0,UserName,UserContact,DTSighting, XCoordinate, YCoordinate, TxtComent, ImageId,infoId],(err,rows,fields)=>{
        if(!err){
            res.json({Status:'Sighting was saved.'});
        }else{
            console.log(err);
        }
    });
});

//PUT:
router.put('/SnakesApi/Sighting/Edit/:id',(req,res)=>{
    const{UserName,UserContact,DTSighting, XCoordinate, YCoordinate, TxtComent, ImageId,infoId} = req.body;
    const {id} =  req.params;
    const query = 'CALL sightingAddOrEdit(?, ?,?,?,?,?,?,?,?);';
    mysqlConnection.query(query,[id,UserName,UserContact,DTSighting, XCoordinate, YCoordinate, TxtComent, ImageId,infoId],(err,rows,fields)=>{
        if(!err){
            res.json({Status:'Sighting was updated.'});
        }else{
            console.log(err);
        }
    });
});

//DELETE: 
router.delete('/SnakesApi/Sighting/Delete/:id',(req,res)=>{
    const{id} = req.params;
    mysqlConnection.query('DELETE FROM sighting where NbSighting = ?', [id], (err,rows,fields)=>{
        if(!err){
            res.json({status: 'Sighting was deleted.'});
        }else{
            console.log(err);
        }
    });
});
module.exports = router;