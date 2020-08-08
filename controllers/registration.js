var express=require('express');
var router = express.Router();
var db=require('../models/db');

router.get('/',function (req,res){
    res.render('registration/index');
});

router.get('/doctor',function (req,res){
    res.render('registration/doctor');
});
router.post('/doctor',function (req,res){
    res.send('yo.. sup!');
});



module.exports=router;
