const express = require('express');
const router = express.Router();
const mysqlConnection = require('../database');

//GET: Obtener lista de imagenes.
router.get('/SnakesApi/Image/GetList', (req,res)=>{
    mysqlConnection.query('SELECT * FROM image', (err,rows,fields)=>{
        if(!err){
            res.json(rows);
        }else{
            console.log(err);
        }
    })
});

//GET: Obtener una imagen dado su id.
router.get('/SnakesApi/Image/Get/:NbImage', (req,res)=>{
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
router.post('/SnakesApi/Image/Create',(req,res)=>{
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
router.put('/SnakesApi/Image/Edit/:NbImage',(req,res)=>{
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
router.delete('/SnakesApi/Image/Delete/:NbImage',(req,res)=>{
    const{NbImage} = req.params;
    mysqlConnection.query('DELETE FROM image where NbImage = ?', [NbImage], (err,rows,fields)=>{
        if(!err){
            res.json({status: 'Image deleted.'});
        }else{
            console.log(err);
        }
    });
});

module.exports = router;