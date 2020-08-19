var express=require('express');
var router = express.Router();
var userModel=require('../models/chat');
var patientModel=require('../models/patient');
var sessionModel=require('../models/session');
var prescriptionModel=require('../models/prescription');
var chatModel=require('../models/chat');

router.get('/',function (req,res){
    if(req.session.user_id!=null) {
        // chatModel.getAll(function (results) {
        //     res.render('chat/index', {user_id: req.session.username,result:results});
        // });
        res.render('chat/index', {user_id: req.session.username});
    }
    else{
        res.redirect("/login");
    }
});
router.post('/insert',function (req,res){
    var chat=req.body;
    chatModel.insert(chat,function (status){
        if(status){
            res.status(201).send(chat);
        }
    });

});


router.get('/session/:p_id',function (req,res){
    var p_id=req.params.p_id;
    patientModel.getByPID(p_id,function (result){
        userModel.get(result.user_id, function (results){
            var data={
                user_id:req.session.username,
                p_id:results.username,
                d_id:req.session.user_id,
                patient_id:p_id,
                path:null
            }
            sessionModel.insert(data,function (status){
                res.render('chat/chatSession',data);
            });

        });
    });
});

router.get('/session/prescribe/:p_id',function (req,res){
    var p_id=req.params.p_id;
    res.render('chat/prescription',{patient_id: p_id});
});

router.post('/session/prescribe/:p_id',function (req,res){
    console.log(req.body);
    var prescription=req.body;
    prescription.d_id=req.session.docId;
    prescriptionModel.insert(prescription,function (status){
        res.redirect('/chat/session/prescribe/'+prescription.p_id);
    });
});


module.exports=router;
