var express = require('express');
var router = express.Router();
var patientModel=require('../models/patient');

router.get('/:id', function(req, res){
    patientModel.get(req.params.id,function (result) {
        res.send(result);
    });
});

module.exports = router;
