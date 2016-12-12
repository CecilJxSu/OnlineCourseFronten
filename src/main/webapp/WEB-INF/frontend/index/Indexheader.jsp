<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="renderer" content="webkit">
    <link href="${pageContext.request.contextPath}/static/public/css/index/pologinless.css" rel="stylesheet"/>
    <link href="${pageContext.request.contextPath}/static/public/css/index/index.css" rel="stylesheet"/>
    <link href="${pageContext.request.contextPath}/static/public/css/index/moco.min.css" rel="stylesheet"/>
    <title>header</title>
</head>
<body id="index">
<!--header-->
<div id="header">
    <div class="page-container" id="nav">
        <div class="logo" id="logo">
            <a href="javascript:;" target="_self" class="hide-text">慕课网</a>
        </div>
        <button type="button" class="navbar-toggle visible-xs-block js-show-menu">
            <i class="icon-menu"></i>
        </button>
        <ul class="nav-item">
            <li class="set-btn visible-xs-block">
                <a href="javascript:void (0)" target="_self">登录</a>
                <a href="javascript:void (0)" target="_self">注册</a>
            </li>
            <li>
                <a href="javascript:void (0)" class="nav-item-index">首页</a>
            </li>
            <li>
                <a href="javascript:void (0)" target="_self">实战</a>
            </li>
            <li>
                <a href="javascript:void (0)" target="_self">路径</a>
            </li>
            <li>
                <a href="javascript:void (0)" target="_self">猿问</a>
            </li>
            <li>
                <a href="javascript:void (0)" target="_self">手记</a>
            </li>
        </ul>
        <div class="login-area" >
            <ul class="header-unlogin clearfix">
                <li class="header-app">
                    <a href="javascript:;">
                        <span class="icon-appdownload"></span>
                    </a>
                    <div class="QR-download">
                        <p id="app-text">慕课网APP下载</p>
                        <p id="app-type">iPhone / Android / iPad</p>
                        <img src="${pageContext.request.contextPath}/static/staticWEB/img/index/QR-code.jpg">
                    </div>
                </li>
                <li class="header-signin">
                    <a href="#" id="js-signin-btn" onclick="ShowDiv('signin','fade')">登录</a>
                </li>
                <li class="header-signup">
                    <a href="#" id="js-signup-btn" onclick="ShowDiv('signup','fade')">注册</a>
                </li>
            </ul>
            <!--登录权限-->
            <%--<ul class="clearfix logined">
                <li class="header-app">
                    <a href="javascript:;">
                        <span class="icon-appdownload"></span>
                    </a>
                    <div class="QR-download">
                        <p id="app-text">慕课网APP下载</p>
                        <p id="app-type">iPhone / Android / iPad</p>
                        <img src="/html/static/img/index/QR-code.jpg">
                    </div>
                </li>
                <!--玲-->
                <li class="remind_warp">
                    <!-- <i class="msg_remind"></i> -->
                    <a target="_blank" href="#">
                        <i class="icon-notifi"></i>
                        <span class="msg_icon" style="display: none;"></span>
                    </a>
                </li>
                <!--玲end-->
                <!--消息-->
                <li class="my_message">
                    <i class="msg_remind" style="display: none;"></i>
                    <a href="#" title="我的消息" target="_blank">
                        <!-- <span class="msg_icon" style="display: none;"></span> -->
                        <i class="icon-mail"></i>
                        <span style="display: none;">我的消息</span>
                    </a>
                </li>
                <!--消息end-->
                <!--用户-->
                <li class="set_btn user-card-box">
                    <a id="header-avator" class="user-card-item js-header-avator" action-type="my_menu" href="#" target="_self">
                        <img width="40" height="40" src="/html/static/img/home/552133900001743101800180-100-100.jpg">
                        <i class="myspace_remind" style="display: none;"></i>
                        <span style="display: none;">动态提醒</span>
                    </a>
                    <div class="g-user-card">
                        <div class="card-inner">
                            <div class="card-top">
                                <a href="#"><img src="/html/static/img/home/552133900001743101800180-100-100.jpg" alt="哈米的小宇宙" class="l"></a>
                                <a href="#"><span class="name text-ellipsis">哈米的小宇宙</span></a>
                                <p class="meta">
                                    <a href="#">经验<b id="js-user-mp">5565</b></a>
                                    <a href="#">积分<b id="js-user-credit">1</b></a></p>
                                <a href="#" class="setup linkToMall">积分商城</a>
                            </div><div class="card-history">
                                    <span class="history-item">
                                        <span class="tit text-ellipsis">HTML+CSS基础课程</span>
                                        <span class="media-name text-ellipsis">1-1 代码初体验，制作我的第一个网页</span>
                                        <i class="icon-clock"></i>
                                        <a href="#" class="continue">继续</a>
                                    </span>
                        </div>
                            <div class="card-sets clearfix">
                                <a href="#" target="_blank" class="l mr30">个人设置</a>
                                <a href="#" class="r">退出</a>
                            </div>
                        </div>
                        <i class="card-arr"></i>
                    </div>
                </li>
                <!--用户end-->
            </ul>--%>
            <!--登录权限end-->
        </div>
        <!--查询-->
        <div class="search-warp clearfix" style="min-width: 32px; height: 60px;">
            <div class="pa searchTags">
                <a href="javascript:;" target="_blank">安卓框架</a>
                <a href="javascript:;" target="_blank">响应式</a>
            </div>

            <div class="search-area" data-search="top-banner">
                <input class="search-input " data-suggest-trigger="suggest-trigger" type="text" autocomplete="off">
                <input type="hidden" class="btn_search" data-search-btn="search-btn">
                <ul class="search-area-result" data-suggest-result="suggest-result">
                </ul>
            </div>
            <div class="showhide-search" data-show="no"><i class="icon-search"></i></div>
        </div>
        <!--查询end-->
    </div>
</div>
<!--header结束-->
<!--登陆与注册-->
<!--登陆-->
<div id="signin" class="hidecss rl-modal in" aria-hidden="flase">
    <div class="rl-modal-header">
        <h1>
            <span name="signin"  class="active-title">登录</span>
            <span name="signup" class="xa-showSignup">注册</span>
        </h1>
        <button type="button" class="rl-close" data-dismiss="modal" hidefocus="true" aria-hidden="true"
                onclick="CloseDiv('signin', 'fade')"></button>
    </div>
    <div class="rl-modal-body js-loginWrap">
        <div class="clearfix">
            <div class="l-left-wrap l">
                <form id="signup-form" autocomplete="off">
                    <p class="rlf-tip-globle color-red" id="signin-globle-error"></p>
                    <div class="rlf-group pr">
                        <input type="text" value="" maxlength="37" name="email" data-validate="require-mobile-phone"
                               autocomplete="off"
                               class="xa-emailOrPhone ipt ipt-email js-own-name" placeholder="请输入登录邮箱/手机号">
                        <p class="rlf-tip-wrap errorHint color-red" data-error-hint="请输入正确的邮箱或手机号"></p></div>
                    <div class="rlf-group  pr">
                        <input type="password" name="password" data-validate="require-password"
                               class="ipt ipt-pwd js-loginPassword js-pass-pwd"
                               placeholder="6-16位密码，区分大小写，不能用空格" maxlength="16" autocomplete="off">
                        <p class="rlf-tip-wrap errorHint color-red " data-error-hint="请输入6-16位密码，区分大小写，不能使用空格！"></p>
                    </div>
                    <div class="rlf-group rlf-appendix form-control  clearfix">
                        <label for="auto-signin" class="rlf-autoin l" hidefocus="true">
                            <input type="checkbox" checked="checked" class="auto-cbx" id="auto-signin">下次自动登录</label> <a
                            href="#" class="rlf-forget r" target="_blank" hidefocus="true">忘记密码 </a>
                    </div>
                    <div class="rlf-group clearfix">
                        <input type="button" value="登录" hidefocus="true" class="btn-red btn-full xa-login dengluzhucecss" style="width: 300px;
    height: 50px;line-height: 50px;font-size: 16px;"></div>
                </form>
            </div>
        </div>
    </div>
</div>
<!--登陆end-->
<!--注册-->
<div id="signup" class="hidecss rl-modal  in" aria-hidden="false">
    <div class="rl-modal-header">
        <button type="button" class="rl-close" data-dismiss="modal" aria-hidden="true" onclick="CloseDiv('signup', 'fade')"></button>
        <h1>
            <span  name="signin" class="xa-showSignin">登录</span>
            <span  name="signup" class="active-title" >注册</span>
        </h1>
    </div>
    <div class="rl-modal-body js-modal-body js-registerWrap">
        <form id="signup-form pr" action="">
            <p class="rlf-tip-globle color-red rlf-g-tip" id="signup-globle-error"></p>
            <div class="rlf-group  pr">
                <input type="text" maxlength="37" value="" name="username" id="username"
                       data-callback="checkusername" data-validate="require-mobile-phone"
                       autocomplete="off" class="xa-emailOrPhone ipt ipt-email "
                       placeholder="请输入登录用户名">
                <p class="rlf-tip-wrap errorHint color-red" data-error-hint="该登录用户名已被注册"></p>
            </div>
            <div class="rlf-group  pr">
                <input type="text" maxlength="37" value="" name="password" id="password"
                       data-callback="checkusername" data-validate="require-mobile-phone"
                       autocomplete="off" class="xa-emailOrPhone ipt ipt-email "
                       placeholder="请输入密码">
                <p class="rlf-tip-wrap errorHint color-red" data-error-hint="请输入正确的密码"></p>
            </div>
            <div class="rlf-group  pr">
                <input type="text" maxlength="37" value="" name="repassword" id="repassword"
                       data-callback="checkusername" data-validate="require-mobile-phone"
                       autocomplete="off" class="xa-emailOrPhone ipt ipt-email "
                       placeholder="请输入确认密码">
                <p class="rlf-tip-wrap errorHint color-red" data-error-hint="请输入正确的确认密码"></p>
            </div>
            <div class="rlf-group clearfix form-control ">
                <input type="text" name="verify"class="ipt ipt-verify js-emailverify l"data-validate="require-string"
                       data-callback="checkverity" maxlength="4" data-minlength="4" placeholder="请输入验证码"> <a
                    href="javascript:void(0)" hidefocus="true" class="verify-img-wrap js-verify-refresh">
                <img class="verify-img" src="${pageContext.request.contextPath}/static/staticWEB/img/verifycode.png"></a>
                <a href="javascript:void(0)" hidefocus="true"class="icon-refresh js-verify-refresh" style="line-height: 1.2;
    display: inline-block;"></a>
                <p class="rlf-tip-wrap errorHint color-red" data-error-hint="验证码错误"></p>
            </div>
            <div class="rlf-group clearfix">
                <a href="javascript:void(0)" id="signup-btn" hidefocus="true" class="btn-red btn-full btn r " style="width: 300px;
    height: 50px;line-height: 50px;font-size: 16px;" onclick="checkAndSubmit()"> 注册 </a>
            </div>
        </form>
    </div>
</div>
<!--注册-->
<div id="fade" class="hidecss modal-backdrop  in"></div>
<!--登陆与注册-->
<!--加载js-->
<script src="${pageContext.request.contextPath}/static/public/js/jquery-1.11.2.min.js"></script>
<script type="text/javascript">
    $(function () {
        /*var a = $('[data-search="top-banner"]'), c = new v(a), h = $(".search-area"), g = $(".showhide-search"), b = $(".search-input"), k = function () {
         g.attr("data-show", "yes"), h.show(1, function () {
         h.removeClass("min")
         })
         };*/
        b = $(".search-input"),h = $(".search-area"),g = $(".showhide-search"),k = function () {
            g.attr("data-show", "yes"), h.show(1, function () {
                h.removeClass("min")
            })
        };
        $("#nav").on("click", ".search-input", function () {
            $(".searchTags").hide()
        }), $("#nav").on("blur", ".search-input", function (a) {
            0 == $(a.currentTarget).val().length && $(".searchTags").show()
        }), $("#nav").on("click", ".showhide-search", function (a) {
            $(".searchTags").hide();
            var h = $(this).attr("data-show");
            /*查询结果*/
            return "no" == h ? (k(), b.focus()) : "" == b.val() ? y() : c.search(b.val()), a.stopPropagation(), !1
            /*查询结果end*/
        }), $("#nav").on("click", ".search-area", function (a) {
            return a.stopPropagation(), !1
        }), $(document).on("click", function () {
            "" == b.val() && y()
        });
        var y = function () {
        }
    })

    //弹出隐藏层
    function ShowDiv(show_div, bg_div) {
        document.getElementById(show_div).style.display = 'block';
        document.getElementById(bg_div).style.display = 'block'
    }
    ;
    //关闭弹出层
    function CloseDiv(show_div, bg_div) {
        document.getElementById(show_div).style.display = 'none';
        document.getElementById(bg_div).style.display = 'none';
    }
    ;

    /*注册和登陆转换*/
    $('.rl-modal-header span').on('click', function () {
        var name=$(this).attr('name');
        if(name=='signin'){
            var  parent=$('.rl-modal-header').parent();
            if(parent!='signin'){
                document.getElementById('signup').style.display = 'none';
                document.getElementById('signin').style.display = 'block';
            }
        }
        if(name=='signup'){
            var  parent=$('.rl-modal-header').parent();
            if(parent!='signup'){
                document.getElementById('signin').style.display = 'none';
                document.getElementById('signup').style.display = 'block';
            }
        }
    });


    /**
     * 注册输入框内容改变时触发
     */
    $("#signup input").change(function(){
        //checkAndSubmit();
    });

    function checkAndSubmit() {
        $('#signup-btn').html('<img style="height: 50px;" src="${pageContext.request.contextPath}/static/staticWEB/img/box.gif">');
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
                password    :   password
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
</script>
</body>
</html>
