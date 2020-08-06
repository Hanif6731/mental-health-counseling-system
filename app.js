var express 	= require('express');
var exSession 	= require('express-session');
var bodyParser 	= require('body-parser');
var coockieParser=require('cookie-parser');
var app 		= express();

//config
app.set('view engine', 'ejs');

app.use('/assets', express.static('assets'));
app.use('/bootstrap/css', express.static('node_modules/bootstrap/dist/css'));
app.use('/bootstrap/js', express.static('node_modules/bootstrap/dist/js'));
app.use('/jquery', express.static('node_modules/jquery/dist'));
app.use('/popper',express.static('node_modules/popper.js/dist'));
app.use('/img',express.static('assets/img'));
app.use('/files',express.static('assets/files'));
//app.use('/assets/img', express.static('assets'));


//middleware
app.use(bodyParser.urlencoded({extended: false}));
app.use(exSession({secret: 'my secret value', saveUninitialized: true, resave: false}));
app.use(coockieParser());

/*app.get('/admin/user/:abc/:name', function(req, res){
	res.send(req.params.abc+" | "+req.params.name);
});*/

app.get('/', function(req, res){
    res.send("this is index page!<br> <a href='/login'> login</a> ");
});

app.listen(3000, function(){
    console.log('express http server started at...3000');
});
