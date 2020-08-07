var express=require('express');
var router = express.Router();
var db=require('../models/db');

router.get('/',function (req,res){
    res.render('registration/index');
});

router.get('/doctor',function (req,res){
    res.render('registration/doctor');
});



module.exports=router;
