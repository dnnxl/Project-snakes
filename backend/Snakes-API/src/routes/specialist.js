const express = require('express');
const router = express.Router();
const mysqlConnection = require('../database');

//GET: Obtener lista de especialistas.
router.get('/SnakesApi/Specialist/GetList', (req,res)=>{
    mysqlConnection.query('SELECT * FROM specialist', (err,rows,fields)=>{
        if(!err){
            res.json(rows);
        }else{
            console.log(err);
        }
    })
});

//GET: Obtener un objeto especialistas dado su id.
router.get('/SnakesApi/Specialist/Get/:NbSpecialist', (req,res)=>{
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
router.post('/SnakesApi/Specialist/Create',(req,res)=>{
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
router.put('/SnakesApi/Specialist/Edit/:NbSpecialist',(req,res)=>{
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
router.delete('/SnakesApi/Specialist/Delete/:NbSpecialist',(req,res)=>{
    const{NbSpecialist} = req.params;
    mysqlConnection.query('DELETE FROM specialist where NbSpecialist = ?', [NbSpecialist], (err,rows,fields)=>{
        if(!err){
            res.json({status: 'Specialist deleted.'});
        }else{
            console.log(err);
        }
    });
});

module.exports = router;
