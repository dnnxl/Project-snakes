const _ = require('lodash');
const express = require('express');
const router = express.Router();
const {User, validate} = require('../models/user');

router.get('/me', async (req, res) => {
    // Search in the database and return the user.
    //const user = await User.findById(req.user._id).select('-password');
    //res.send();
    res.send('User');
});

router.post('/', async (req, res) => {
    const { error } = validate(req.body); 
    if (error) return res.status(400).send(error.details[0].message);
  
    // Search in the dataab 
    //let user = await User.findOne({ email: req.body.email });
    //if (user) return res.status(400).send('User already registered.');
  
    //user = new User(_.pick(req.body, ['name', 'email', 'password']));
    //console.log(req.body);
    //await user.save();
    //res.send(req.body);
});

module.exports = router;