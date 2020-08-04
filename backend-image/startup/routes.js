const express = require('express');
const images = require('../routes/images');
const fileUpload = require('express-fileupload')

module.exports = function(app) {
    app.use(express.json());
    app.use(fileUpload())
    app.use('/api/images', images);
  }