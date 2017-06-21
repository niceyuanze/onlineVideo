$(document).ready(function(){


    // window.location.href="navigation.html";


    $.ajaxSetup({
        async : false //取消异步
    });


    $("#login_button").click(function () {
        alert("123123123");
        var name = $("#username").val();
        var password = $("#password").val();
        alert(name);
        alert(password);
        $.post("/login/staff","loginname="+name+"&password="+password,function(result){
            alert(result['data']['role'].homePage);
            window.location.href=result['data']['role'].homePage;
        });
        // var result=$.ajax({
        //     url:"login/teacherLogin.do",
        //     async:true,
        //     data:$("#login_form").serialize(),
        //     type:"post",
        //     success:function(dataFromServer){
        //         if(dataFromServer == 'false'){
        //             $("#error_message").show();
        //         }else{
        //             window.location.href="login/teacherDispatcher.do";
        //         }
        //
        //
        //     }
        // });

    });


});

