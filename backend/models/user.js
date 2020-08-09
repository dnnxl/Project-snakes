const Sequelize = require('sequelize');
const Joi = require('joi');

const userModel = (sequelize, Sequelize) => {
    const User = sequelize.define('user', {
        name:{
            type: Sequelize.string
        },
        mail:{
            type: Sequelize.string
        },
        password:{
            type: Sequelize.string
        },
        rol: {
            type: Sequelize.string 
        },
        username: {
            type: Sequelize.string
        }
    })
    return User
}

function validateUser(user) {
    const schema = Joi.object({
      name: Joi.string().min(1).max(50).required(),
      mail: Joi.string().min(5).max(255).required().email(),
      password: Joi.string().min(6).max(255).required(),
      rol: Joi.string().min(1).max(255).required(),
      username: Joi.string().min(3).max(255).required()
    });
    return schema.validate(user);
}

exports.User = userModel
exports.validate = validateUser;