/**
 * 注册时，检查并提交
 */
function checkAndSubmit() {
    $('#signup-btn').html('<img style="height: 50px;" src="/OnlineCourseFronten/static/staticWEB/img/box.gif">');
    $("#signup-btn").attr("disabled","disabled");
    var username = $('#username').val();
    var password = $('#password').val();
    var repassword = $('#repassword').val();
    if (!isLegal(username,6,16)){
        $('#username').next('p').html('登录用户名不合法');
        $('#signup-btn').html('注册');
        $("#signup-btn").removeAttr("disabled");
        return false;
    } else {
        $('#username').next('p').html('');
    }
    if (!isLegal(password,8,20)){
        $('#password').next('p').html('密码不合法');
        $('#signup-btn').html('注册');
        $("#signup-btn").removeAttr("disabled");
        return false;
    } else {
        $('#password').next('p').html('');
    }
    if (password!=repassword){
        $('#repassword').next('p').html('密码 确认密码不一致');
        $('#signup-btn').html('注册');
        $("#signup-btn").removeAttr("disabled");
        return false;
    } else {
        $('#repassword').next('p').html('');
    }

    $.ajax({
        url:'/OnlineCourseFronten/register/register',//路径
        type:'post',
        cache:false,
        dataType:'json',
        data:{
            username    :   username,
            password    :   md5(password).toUpperCase()
        },
        success:function (data) {
            if (data.msg == "errName"){
                $('#username').next('p').html('该登录用户名已注册');
                $('#signup-btn').html('注册');
                $("#signup-btn").removeAttr("disabled");
                return false;
            } else if (data.msg == "success"){
                alert("注册成功!");
                $('#signup-btn').html('注册');
                $("#signup-btn").removeAttr("disabled");
                $('.xa-showSignin').trigger('click');
                return false;
            } else {
                alert("注册失败!");
                $('#signup-btn').html('注册');
                $("#signup-btn").removeAttr("disabled");
                return false;
            }
        },
        error:function (e) {
            alert("注册失败!");
            $('#signup-btn').html('注册');
            $("#signup-btn").removeAttr("disabled");
            return false;
        }
    });
}

/**
 * 验证文本由数字、26个英文字母或者下划线组成
 * @param text 文本
 * @param min 最小长度
 * @param max 最大长度
 */
function isLegal(text,min,max){
    var reg=/^[a-zA-Z0-9_]+$/;
    if(reg.test(text) && text.length<=max && text.length>=min){
        return true;
    }else{
        return false;
    }
}

/**
 * 登录
 */
function signin() {
    $('#signin-btn').html('<img style="height: 50px;" src="/OnlineCourseFronten/static/staticWEB/img/box.gif">');
    $("#signin-btn").attr("disabled","disabled");
    var username = $('#signin-username').val();
    var password = $('#signin-password').val();
    if (!isLegal(username,6,16)){
        $('#signin-username').next('p').html('登录用户名不合法');
        $('#signin-btn').html('登录');
        $("#signin-btn").removeAttr("disabled");
        return false;
    } else {
        $('#signin-username').next('p').html('');
    }
    if (!isLegal(password,8,20)){
        $('#signin-password').next('p').html('密码不合法');
        $('#signin-btn').html('登录');
        $("#signin-btn").removeAttr("disabled");
        return false;
    } else {
        $('#signin-password').next('p').html('');
    }

    $.ajax({
        url:'/OnlineCourseFronten/login',//路径
        type:'post',
        cache:false,
        dataType:'json',
        data:{
            username    :   username,
            password    :   md5(password).toUpperCase()
        },
        success:function (data) {
            if (data.msg=="success"){
                window.location.reload();//刷新当前页面

            } else {
                $('#signin-globle-error').html(data.msg);
                $('#signin-btn').html('登录');
                $("#signin-btn").removeAttr("disabled");
            }
        },
        error:function (e) {
            $('#signin-globle-error').html("登录失败");
            $('#signin-btn').html('登录');
            $("#signin-btn").removeAttr("disabled");
        }
    });
}