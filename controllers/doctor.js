var express=require('express');
var router = express.Router();
var db=require('../models/db');

router.get('/',function (req,res){
    res.send("under construction");
});

router.post('/', function (req,res){
    res.send("Under construction");
});



module.exports=router;
