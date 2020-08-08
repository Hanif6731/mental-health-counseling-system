var express=require('express');
var router = express.Router();
var docModel=require('../models/doctor');

router.get('/',function (req,res){
    if(req.session.user_id!=null){
        docModel.get(req.session.user_id, function (result){
            console.log(result);
            req.session.docId=result[0].d_id;
            console.log(req.session.docId);
            result[0].username=req.session.username;
            res.render('doctor/index',result[0]);
        });
    }
    else {
        res.redirect('/login');
    }
});

router.post('/', function (req,res){
    res.send("Under construction");
});

router.get('/settings',function (req,res){
    if(req.session.username!=null){
        docModel.get(req.session.user_id,function (result){
            var doctor=result[0];
            doctor.username=req.session.username;
            doctor.password=req.session.password;
            console.log(doctor);

            res.render('doctor/settings',doctor);
        })
    }
    else {
        res.redirect('/login');
    }
});

router.post('/upload', function(req, res) {
    if (!req.files || Object.keys(req.files).length === 0) {
        return res.status(400).send('No files were uploaded.');
    }

    // The name of the input field (i.e. "sampleFile") is used to retrieve the uploaded file
    let propic = req.files.propic;
    var doctor={
        user_id:req.session.docId,
        propic:propic.name

    };
    console.log(req.files.propic.name);
    // Use the mv() method to place the file somewhere on your server

    docModel.updateProPic(doctor,function (status) {
        if(status){
            propic.mv('assets/img/'+propic.name, function(err) {
                if (err)
                    console.log(err.stack);

                res.redirect('/doctor');
            });
        }
        else {
            res.redirect('/doctor/settings');
        }
    });


});


module.exports=router;
