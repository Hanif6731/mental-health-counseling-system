var express 	= require('express');
var exSession 	= require('express-session');
var bodyParser 	= require('body-parser');
var doctor  = require('./controllers/doctor');
var registration= require('./controllers/registration');
var login = require('./controllers/login');
var logout =require('./controllers/logout');
var appointment=require('./controllers/appointment');
var chat = require('./controllers/chat');
var coockieParser=require('cookie-parser');
var fileUpload=require('express-fileupload');
var app 		= express();


var http=require('http').createServer(app);
var io=require('socket.io')(app.listen(3000,function (){
    console.log("Server running on port 3000");
}));


//config
app.set('view engine', 'ejs');




//middleware
app.use(fileUpload());
app.use(bodyParser.urlencoded({extended: false}));
app.use(exSession({secret: 'my secret value', saveUninitialized: true, resave: false}));
app.use(coockieParser());

app.use('/assets', express.static('assets'));
app.use('/bootstrap/css', express.static('node_modules/bootstrap/dist/css'));
app.use('/bootstrap/js', express.static('node_modules/bootstrap/dist/js'));
app.use('/jquery', express.static('node_modules/jquery/dist'));
app.use('/popper',express.static('node_modules/popper.js/dist'));
app.use('/img',express.static('assets/img'));
app.use('/files',express.static('assets/files'));
app.use('/css',express.static('assets/css'));
app.use('/js',express.static('assets/js'));
app.use('/socket',express.static('node_modules/socket.io-client/dist'));

/*app.get('/admin/user/:abc/:name', function(req, res){
	res.send(req.params.abc+" | "+req.params.name);
});*/

//app.use('/login',login);
//app.use('/admin',admin);
//app.use('/doctor',doctor);
//app.use('/patient',patient);

app.use('/logout',logout);
app.use('/registration',registration);
app.use('/login',login);
app.use('/doctor',doctor);
app.use('/appointment',appointment);
app.use('/chat',chat);

app.get('/', function(req, res){
    res.redirect('/login');
});


io.sockets.on('connection',function (socket){
    socket.emit('message',{message:'welcome!!',username:'Server'});
    socket.on('send',function (data){
        io.sockets.emit('message',data);
    });
});
