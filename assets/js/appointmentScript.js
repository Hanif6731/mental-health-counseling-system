$(document).ready(function () {
    // $('.accept').click(function (){
    //     var id=$(this).val();
    // });
    // $('.reject').click(function (){
    //     var id=$(this).val();
    // });

    $(".viewProfile").click(function () {
        var id=$(this).val();
        //alert(id);
        loadData(id);
    });

    function loadData(id){
        $.get('/patient/'+id,function (data,status) {
            console.log(data);
            var html="";
            html+="<div class='row'>" +
                "<div class='col-6 col-md-2 offset-md-2'>Name</div>" +
                "<div class='col-6 col-md-6'>: "+data.name+"</div>" +
                "</div>"+
                "<div class='row'>" +
                "<div class='col-6 col-md-2 offset-md-2'>Email</div>" +
                "<div class='col-6 col-md-6'>: "+data.email+"</div>" +
                "</div>"+
                "<div class='row'>" +
                "<div class='col-6 col-md-2 offset-md-2'>Phone</div>" +
                "<div class='col-6 col-md-6'>: "+data.phone+"</div>" +
                "</div>"+
                "<div class='row'>" +
                "<div class='col-6 col-md-2 offset-md-2'>Gender</div>" +
                "<div class='col-6 col-md-6'>: "+data.gender+"</div>" +
                "</div>"+
                "<div class='row'>" +
                "<div class='col-6 col-md-2 offset-md-2'>BG</div>" +
                "<div class='col-6 col-md-6'>: "+data.bloodtype+"</div>" +
                "</div>";
            $("#profileContent").html(html);
            $("#profileModal").modal('show');
        });
    }
});
