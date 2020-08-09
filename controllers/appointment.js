var express=require('express');
var router = express.Router();
var appointmentModel=require('../models/appointment');


router.get('/', function (req, res){
if(req.session.user_id!=null){
    appointmentModel.getForDoc(req.session.docId,function (results){
        var data={
            reuslts:results
        };
        res.render('doctor/appointment',data);
    });
}
else {
    res.redirect('/login');
}
});




module.exports=router;
