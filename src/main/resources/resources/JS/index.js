//注册弹出
function register(){
    $('#move-reg').css({"display":"none"});
    $('#move-log').css({"display":"block"});

    $('#login-button').css({"display":"none"});
    $('#regis-button').css({"display":"block"});

    $('#s-title').text('账号注册');
    $('#password').after("<div class='s-password-check in' id='password-check'><input type='password' placeholder='密码确认'></div>");
    $('#password-check').after("<div class='email-check in'><input type='text' name='e-check' id='e-check' placeholder = '邮箱验证码'><div class='cen' id='cen'><input class='e-check-button' id='e-check-button' type = 'button' onclick='emailTodoku()' value='发送验证码'></div></div>");
    $('#s-no-password').css({"display":"none"});
    $('#s-account').after("<div class='s-email in' id='s-email'><input type='text' placeholder='邮箱'></div>");
    $('#slider').css({"display":"none"})
}
var c = 60;
var t;
//发送邮箱验证码
function emailTodoku(){
    $("#e-check-button").css({"background-color":"#e8e8e8","color":"#7a7a7a"});
    
    reEmailTime();
}
function reEmailTime(){
    
    $('#e-check-button').val(c+'s');
    c-=1;
    if(c>=0){
        t=setTimeout("reEmailTime()",1000);
        $("#e-check-button:hover").css({"pointer-events": "none"});
        $("#cen").css({"cursor":"not-allowed"})
    }
    else{
        $('#e-check-button').val('重新发送')
        $("#cen").css({"cursor":"pointer"})
        $("#e-check-button").css({"pointer-events": "auto","background-color":"#449efc","color":"#fff"})
        c = 6;
    }
}
//回到登录
function reLogin(){
    location.reload();
}