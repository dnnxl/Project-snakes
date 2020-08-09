const express = require('express');
const router = express.Router();

router.post('/upload',(req,res) => {
    let EDFile = req.files.file
    EDFile.mv(`./public/files/${EDFile.name}`,err => {
        if(err) return res.status(500).send({ message : err })
        return res.status(200).send({ message : 'File upload' })
    })
})

module.exports = router;