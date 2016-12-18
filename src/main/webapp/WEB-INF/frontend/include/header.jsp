<%@page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
    String id = session.getAttribute("id")!=null?session.getAttribute("id").toString():null;
    String userName = session.getAttribute("userName")!=null?session.getAttribute("userName").toString():null;
    String userStatus = session.getAttribute("userStatus")!=null?session.getAttribute("userStatus").toString():null;
    String iconUrl = session.getAttribute("iconUrl")!=null?session.getAttribute("iconUrl").toString():null;
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="renderer" content="webkit">
    <link href="${pageContext.request.contextPath}/static/public/css/index/pologinless.css" rel="stylesheet"/>
    <link href="${pageContext.request.contextPath}/static/public/css/learn/common.css" rel="stylesheet"/>
    <link href="${pageContext.request.contextPath}/static/public/css/learn/layer.css" rel="stylesheet"/>
    <title>header</title>
</head>
<body>
<!--header-->
<div id="header">
    <div class="page-container" id="nav">
        <div id="logo" class="logo"><a href="/" target="_self" class="hide-text">课程学习网</a></div>


        <button type="button" class="navbar-toggle visible-xs-block js-show-menu">
            <i class="icon-menu"></i>
        </button>
        <ul class="nav-item">
            <li class="set-btn visible-xs-block">

                <a href="javascript:void (0)" target="_self">登录</a>
                <a href="javascript:void (0)" target="_self">注册</a>
            </li>
            <li>
                <a href="${pageContext.request.contextPath}/" class="nav-item-index">首页</a>
            </li>
            <li>
                <a href="${pageContext.request.contextPath}/course/show" target="_self">课程</a>
            </li>
            <li>
                <a href="${pageContext.request.contextPath}/chat/show" target="_self">话题</a>
            </li>
        </ul>
        <div id="login-area">
            <c:if test="${userName == null}">
                <!--权限未登陆-->
                <ul class="header-unlogin clearfix">
                    <li class="header-app">
                        <a href="/mobile/app">
                            <span class="icon-appdownload"></span>
                        </a>
                        <div class="QR-download">
                            <p id="app-text">课程学习网</p>
                            <p id="app-type">Android</p>
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
            </c:if>

            <c:if test="${userName != null}">
            <!--权限未登陆-->
            <!--权限登陆-->
            <ul class="clearfix logined">
                <li class="header-app">
                    <a href="/mobile/app">
                        <span class="icon-appdownload"></span>
                    </a>
                    <div class="QR-download">
                        <p id="app-text">课程学习网</p>
                        <p id="app-type">Android</p>
                        <img src="${pageContext.request.contextPath}/static/staticWEB/img/index/QR-code.jpg">
                    </div>
                </li>
                <!--铃铛-->
                <li class="remind_warp">
                    <!-- <i class="msg_remind"></i> -->
                    <a target="_blank" href="#">
                        <i class="icon-notifi"></i>
                        <span class="msg_icon" style="display: none;"></span>
                    </a>
                </li>
                <!--铃铛end-->
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
                    <a id="header-avator" class="user-card-item" action-type="my_menu" href="#" target="_self">
                        <c:if test="${iconUrl!=null}">
                            <img style="margin-top: 15px;" width="40" height="40" src="/OnlineCourseFronten/file/get?url=<c:out value='${iconUrl}'/>">
                        </c:if>
                        <c:if test="${iconUrl==null}">
                            <img style="margin-top: 15px;" width="40" height="40" src="/OnlineCourseFronten/static/staticWEB/img/default.png">
                        </c:if>
                        <i class="myspace_remind" style="display: none;"></i>
                        <span style="display: none;">动态提醒</span>
                    </a>
                    <div class="g-user-card">
                        <div class="card-inner">
                            <div class="card-top">
                                <a href="#">
                                    <c:if test="${iconUrl!=null}">
                                        <img src="/OnlineCourseFronten/file/get?url=<c:out value='${iconUrl}'/>" alt="<c:out value='${userName}'/>" class="l">
                                    </c:if>
                                    <c:if test="${iconUrl==null}">
                                        <img src="/OnlineCourseFronten/static/staticWEB/img/default.png" alt="<c:out value='${userName}'/>" class="l">
                                    </c:if>
                                </a>
                                <a href="#"><span class="name text-ellipsis"><c:out value="${userName}"/></span></a>
                                <p class="meta">
                                    <a href="#">关注<b id="js-user-mp">5565</b></a>
                                    <a href="#">粉丝<b id="js-user-credit">1</b></a></p>
                                <a href="#" class="setup linkToMall"></a>
                            </div><div class="card-history">
                                    <span class="history-item">
                                        <span class="tit text-ellipsis">HTML+CSS基础课程</span>
                                        <span class="media-name text-ellipsis">1-1 代码初体验，制作我的第一个网页</span>
                                        <i class="icon-clock"></i>
                                        <a href="#" class="continue">继续</a>
                                    </span>
                        </div>
                            <div class="card-sets clearfix">
                                <a href="/OnlineCourseFronten/user/profile/show" target="_blank" class="l mr30">个人设置</a>
                                <c:if test="${userStatus=='teacher'}">
                                    <a href="/OnlineCourseFronten/index/teacher" target="_blank" class="l mr30">进入教师页面</a>
                                </c:if>
                                <c:if test="${userStatus=='admin'}">
                                    <a href="/OnlineCourseFronten/index/admin" target="_blank" class="l mr30">进入管理员页面</a>
                                </c:if>
                                <a href="/OnlineCourseFronten/logout" class="r">退出</a>
                            </div>
                        </div>
                        <i class="card-arr"></i>
                    </div>
                </li>
                <!--用户end-->
            </ul>
            <!--权限登陆end-->
            </c:if>
        </div>
        <!--
<div class="app-down-area r">
    <a href="/mobile/app">
        <i class="header-app-icon"></i>慕课APP
    </a>
</div>
-->


        <div class="search-warp clearfix" style="min-width: 32px; height: 60px;">
            <div class="search-area" data-search="top-banner">
                <input class="search-input" data-suggest-trigger="suggest-trigger" type="text" autocomplete="off" value="<c:out value='${search}'/>" placeholder="搜索输入"/>
                <input type="hidden" class="btn_search" data-search-btn="search-btn">
                <ul class="search-area-result" data-suggest-result="suggest-result" style=""></ul>
            </div>
            <div class="showhide-search" data-show="no"><i class="icon-search"></i></div>
        </div>
    </div>
</div>
<!--header：结束-->

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
                        <input style="height: 40px;" type="text" value="" maxlength="37" name="signin-username" id="signin-username" data-validate="require-mobile-phone"
                               autocomplete="off" class="xa-emailOrPhone ipt ipt-email js-own-name" placeholder="请输入登录用户名">
                        <p class="rlf-tip-wrap errorHint color-red" data-error-hint="请输入正确的登录用户名"></p>
                    </div>
                    <div class="rlf-group pr">
                        <input style="height: 40px;" type="password" value="" maxlength="37" name="signin-password" id="signin-password" data-validate="require-mobile-phone"
                               autocomplete="off" class="xa-emailOrPhone ipt ipt-email js-own-name" placeholder="8-20位,字母、数字、下划线">
                        <p class="rlf-tip-wrap errorHint color-red" data-error-hint="请输入8-20位密码，字母、数字、下划线！"></p>
                    </div>
                    <div class="rlf-group rlf-appendix form-control  clearfix">
                        <label for="auto-signin" class="rlf-autoin l" hidefocus="true">
                            <input type="checkbox" checked="checked" class="auto-cbx" id="auto-signin">下次自动登录</label> <a
                            href="#" class="rlf-forget r" target="_blank" hidefocus="true">忘记密码 </a>
                    </div>
                    <div class="rlf-group clearfix">
                        <a href="javascript:void(0)" id="signin-btn" hidefocus="true" class="btn-red btn-full btn r " style="width: 300px;
    height: 50px;line-height: 50px;font-size: 16px;" onclick="signin()"> 登录 </a>
                    </div>
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
        <form id="signup-form pr">
            <p class="rlf-tip-globle color-red rlf-g-tip" id="signup-globle-error"></p>
            <div class="rlf-group  pr">
                <input style="height: 40px;"  type="text" maxlength="37" value="" name="username" id="username"
                       data-callback="checkusername" data-validate="require-mobile-phone"
                       autocomplete="off" class="xa-emailOrPhone ipt ipt-email "
                       placeholder="请输入登录用户名(用于登录)">
                <p class="rlf-tip-wrap errorHint color-red" data-error-hint="该登录用户名已被注册"></p>
            </div>
            <div class="rlf-group  pr">
                <input style="height: 40px;"  type="password" maxlength="37" value="" name="password" id="password"
                       data-callback="checkusername" data-validate="require-mobile-phone"
                       autocomplete="off" class="xa-emailOrPhone ipt ipt-email "
                       placeholder="8-20位,字母、数字、下划线">
                <p class="rlf-tip-wrap errorHint color-red" data-error-hint="请输入正确的密码"></p>
            </div>
            <div class="rlf-group  pr">
                <input style="height: 40px;"  type="password" maxlength="37" value="" name="repassword" id="repassword"
                       data-callback="checkusername" data-validate="require-mobile-phone"
                       autocomplete="off" class="xa-emailOrPhone ipt ipt-email "
                       placeholder="请输入确认密码">
                <p class="rlf-tip-wrap errorHint color-red" data-error-hint="请输入正确的确认密码"></p>
            </div>
            <div class="rlf-group clearfix form-control ">
                <input style="height: 40px;" type="text" name="verify"class="ipt ipt-verify js-emailverify l"data-validate="require-string"
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
    });


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

    $('.showhide-search').on('click',function () {
        location.href = "/OnlineCourseFronten/course/show?search="+$('.search-input').val();
    });
</script>
<script src="${pageContext.request.contextPath}/static/public/js/index/signin-signup.js"></script>
</body>
</html>