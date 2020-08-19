var express     = require('express');
var feedbackModel = require('../models/feedback');
var router      = express.Router();

var forumModel=require('../models/forum');


router.get('/', function(req, res){
    
    feedbackModel.getAll(function(results){
        var data={results:results}
        if(req.session.status=='admin') {
            res.render('admin/feedback', data);
        }
        else {
            res.render('staff/feedback');
        }
    });
});

router.get('/post',function (req,res){
    forumModel.getAll(function (results){
        console.log(results);
        res.send(results);
    });
});

router.post('/post',function (req,res){
    if(req.body.post==''){
        res.redirect('/forum');
    }
    else {
        console.log(req.body);
        var post = {
            post: req.body.post,
            u_id: req.session.user_id
        }
        console.log(post);
        forumModel.insert(post, function (status) {
            res.redirect('/forum');
        });
    }
});

module.exports = router;
