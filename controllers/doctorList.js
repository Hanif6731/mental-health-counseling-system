var express     = require('express');
var doctorListModel = require('../models/doctorList');
var router      = express.Router();


router.get('/', function(req, res){
    
    doctorListModel.getAll(function(results){
        var data={results:results}
        if(req.session.status=='admin') {
			res.render('admin/doctorList/doctorList', data);
		}
        else{
			res.render('staff/doctorList',data);
		}
    });
});

router.get('/delete/:id', function(req, res){
	
	doctorListModel.get(req.params.id, function(result){
		res.render('admin/doctorList/decline', {user: result});
	});
	
});

router.post('/delete/:id', function(req, res){

	doctorListModel.delete(req.body.id, function(status){
		if(status){
			res.redirect('/doctorList');
		}else{
			res.redirect('/doctorList');
		}
	});
});

module.exports = router;
