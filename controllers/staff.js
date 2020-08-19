var express=require('express');
var router = express.Router();
var userModel=require('../models/user');
var adminModel=require('../models/admin');
var staffModel=require('../models/staff');

router.get('/', function(req, res){
    if(req.session.status=='admin') {
        res.render('admin/staff/staff');
    }
    else{
        staffModel.get(req.session.user_id,function (result){
            console.log(result.name);
            if(result.length>0){
                res.render('staff/welcome',result[0]);
            }
            else{
                res.render('staff/addInfo');
            }
        })
    }
});

router.post('/',function (req,res)
{
    console.log(req.body);
    var staff  = req.body;
    staff.user_id=req.session.user_id;
    staffModel.insert(staff,function (status) {
        if(status){
            res.redirect('/staff');
        }else {
            res.redirect('/staff');
        }
    });
});
router.get('/userList',function (req,res)
{
    res.render('staff/userList');
})

module.exports=router;
