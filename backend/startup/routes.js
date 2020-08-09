const express = require('express');
const images = require('../routes/images');
const users = require('../routes/users');
const fileUpload = require('express-fileupload')

module.exports = function(app) {
    app.use(express.json());
    app.use(fileUpload())
    app.use('/api/images', images);
    app.use('/api/users', users);
  }