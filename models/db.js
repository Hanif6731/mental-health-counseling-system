var mysql=require('mysql');



function getConnection(callback){
    var con=mysql.createConnection({
        host	: 'localhost',
        user	: 'root',
        password: '',
        database: 'test'
    });
    con.connect(function(err) {
        if (err) {
            console.error('error connecting: ' + err.stack);
            return;
        }
        callback(con);
        console.log('connected as id ' + con.threadId);
    });
}


module.exports={
    getResults:function (sql, callback){
        getConnection(function (con){
            con.query(sql, function(error, results){
                callback(results);
            });
            con.end(function(err){
                console.log('connection end...');
            });
        });

    }
}

