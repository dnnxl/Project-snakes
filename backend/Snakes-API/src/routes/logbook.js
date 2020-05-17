const express = require('express');
const router = express.Router();
const mysqlConnection = require('../database');

//GET: Obtener lista de bitácoras.
router.get('/SnakesApi/LogBook/GetList', (req,res)=>{
    mysqlConnection.query('SELECT * FROM logbook', (err,rows,fields)=>{
        if(!err){
            res.json(rows);
        }else{
            console.log(err);
        }
    })
});

//GET: Obtener una bitácora dado su id.
router.get('/SnakesApi/LogBook/Get/:idLogBook', (req,res)=>{
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
router.post('/SnakesApi/LogBook/Create',(req,res)=>{
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
router.put('/SnakesApi/LogBook/Edit/:idLogBook',(req,res)=>{
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
router.delete('/SnakesApi/LogBook/Delete/:idLogBook',(req,res)=>{
    const{idLogBook} = req.params;
    mysqlConnection.query('DELETE FROM logBook where idLogBook = ?', [idLogBook], (err,rows,fields)=>{
        if(!err){
            res.json({status: 'LogBook deleted.'});
        }else{
            console.log(err);
        }
    });
});

module.exports = router;