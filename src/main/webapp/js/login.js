$(document).ready(function(){
    $.ajaxSetup({
        async : false //取消异步
    });


    $("#login_button").click(function () {
        var result=$.ajax({
            url:"login/teacherLogin.do",
            async:true,
            data:$("#login_form").serialize(),
            type:"post",
            success:function(dataFromServer){
                if(dataFromServer == 'false'){
                    $("#error_message").show();
                }else{
                    window.location.href="login/teacherDispatcher.do";
                }


            }
        });

    });
    //学生登陆
    $("#studentLogin_button").click(function () {
        alert("asdfasdfsdaf");
        var result=$.ajax({
            url:"login/studentLogin.do",
            async:true,
            data:$("#login_form").serialize(),
            type:"post",
            success:function(dataFromServer){
                if(dataFromServer == 'false'){
                    $("#error_message").show();
                }else{
                    window.location.href="login/studentDispatcher.do";
                }


            }
        });

    });

});

