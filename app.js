var express 	= require('express');
var exSession 	= require('express-session');
var bodyParser 	= require('body-parser');
var patient=require('./controllers/patient');
var doctor  = require('./controllers/doctor');
var registration= require('./controllers/registration');
var login = require('./controllers/login');
var logout =require('./controllers/logout');
var appointment=require('./controllers/appointment');
var chat = require('./controllers/chat');
var forum =require('./controllers/forum');
var admin  = require('./controllers/admin');
var staff= require('./controllers/staff');
var addStaff= require('./controllers/addStaff');
var payment= require('./controllers/payment');
var availablePayment= require('./controllers/availablePayment');
var addSubPlan= require('./controllers/addSubPlan');
var doctorList= require('./controllers/doctorList');
var userList= require('./controllers/userList');
var staffList= require('./controllers/staffList');
var feedback =require('./controllers/feedback');

var coockieParser=require('cookie-parser');
var fileUpload=require('express-fileupload');
//var favicon=require('serve-favicon');
var app 		= express();


var io=require('socket.io')(app.listen(3000,function (){
    console.log("Server running on port 3000");
}));


//config
app.set('view engine', 'ejs');




//middleware
app.use(fileUpload());
app.use(bodyParser.urlencoded({extended: false}));
app.use(bodyParser.json());
app.use(exSession({secret: 'my secret value', saveUninitialized: true, resave: false}));
app.use(coockieParser());

app.use('/assets', express.static('assets'));
app.use('/bootstrap/css', express.static('node_modules/bootstrap/dist/css'));
app.use('/bootstrap/js', express.static('node_modules/bootstrap/dist/js'));
app.use('/jquery', express.static('node_modules/jquery/dist'));
app.use('/popper',express.static('node_modules/popper.js/dist'));
app.use('/fa',express.static('node_modules/@fortawesome/fontawesome-free/css'));
app.use('/fa/js',express.static('node_modules/@fortawesome/fontawesome-free/js'));
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

app.use('/patient',patient);
app.use('/logout',logout);
app.use('/registration',registration);
app.use('/login',login);
app.use('/doctor',doctor);
app.use('/appointment',appointment);
app.use('/chat',chat);
app.use('/forum',forum);

app.use('/staff',staff);
app.use('/addStaff',addStaff);
app.use('/payment',payment);
app.use('/availablePayment',availablePayment);
app.use('/addSubPlan',addSubPlan);
app.use('/doctorList',doctorList);
app.use('/userList',userList);
app.use('/staffList',staffList);
app.use('/feedback',feedback);
app.use('/admin',admin);

app.get('/', function(req, res){
    res.redirect('/login');
});


io.sockets.on('connection',function (socket){
    socket.emit('message',{message:'welcome!!',username:'Server'});
    socket.on('send',function (data){
        io.sockets.emit('message',data);
    });
});
