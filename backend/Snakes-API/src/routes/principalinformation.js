const express = require('express');
const router = express.Router();
const mysqlConnection = require('../database');

//GET: 
router.get('/SnakesApi/PrincipalInformation/GetList', (req,res)=>{
    mysqlConnection.query('SELECT * FROM principalInformation', (err,rows,fields)=>{
        if(!err){
            res.json(rows);
        }else{
            console.log(err);
        }
    })
});

//GET: 
router.get('/SnakesApi/PrincipalInformation/Get/:id', (req,res)=>{
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
router.post('/SnakesApi/PrincipalInformation/Create',(req,res)=>{
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
router.put('/SnakesApi/PrincipalInformation/Edit/:id',(req,res)=>{
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
router.delete('/SnakesApi/PrincipalInformation/Delete/:id',(req,res)=>{
    const{id} = req.params;
    mysqlConnection.query('DELETE FROM principalInformation where idPrincipalInformation = ?', [id], (err,rows,fields)=>{
        if(!err){
            res.json({status: 'Information deleted.'});
        }else{
            console.log(err);
        }
    });
});
module.exports = router;