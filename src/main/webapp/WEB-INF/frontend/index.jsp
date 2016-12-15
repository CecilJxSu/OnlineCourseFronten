<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="renderer" content="webkit">
    <link href="${pageContext.request.contextPath}/static/public/css/index/index.css" rel="stylesheet"/>
    <link href="${pageContext.request.contextPath}/static/public/css/index/moco.min.css" rel="stylesheet"/>
    <title>课程学习网</title>
</head>
<body>
<!--header-->
<%--<div id="header">
    <div class="page-container" id="nav">
        <div class="logo" id="logo">
            <a href="javascript:;" target="_self" class="hide-text">课程学习网</a>
        </div>
        <button type="button" class="navbar-toggle visible-xs-block js-show-menu">
            <i class="icon-menu"></i>
        </button>
        <ul class="nav-item">
            <li class="set-btn visible-xs-block">
                <a href="${pageContext.request.contextPath}/login/page" target="_self">登录</a>
                <a href="javascript:void (0)" target="_self">注册</a>
            </li>
            <li>
                <a href="javascript:void (0)" class="nav-item-index">首页</a>
            </li>
            <li>
                <a href="javascript:void (0)" target="_self">课程</a>
            </li>
            <li>
                <a href="javascript:void (0)" target="_self">话题</a>
            </li>

        </ul>
        <div class="login-area" >
            <!--未登录权限-->
            <ul class="header-unlogin clearfix">
                <li class="header-app">
                    <a href="javascript:;">
                        <span class="icon-appdownload"></span>
                    </a>
                    <div class="QR-download">
                        <p id="app-text">课程学习网APP下载</p>
                        <p id="app-type">iPhone / Android / iPad</p>
                        <img src="${pageContext.request.contextPath}/static/staticWEB/img/index/QR-code.jpg">
                    </div>
                </li>
                <li class="header-signin">
                    <a href="#" id="js-signin-btn">登录</a>
                </li>
                <li class="header-signup">
                    <a href="#" id="js-signup-btn">注册</a>
                </li>
            </ul>
            <!--未登录权限end-->
            <!--登录权限-->
            &lt;%&ndash;<ul class="clearfix logined">
                <li class="header-app">
                    <a href="javascript:;">
                        <span class="icon-appdownload"></span>
                    </a>
                    <div class="QR-download">
                        <p id="app-text">课程学习网APP下载</p>
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
            </ul>&ndash;%&gt;
            <!--登录权限end-->
        </div>
        <!--查询-->
        <div class="search-warp clearfix" style="min-width: 32px; height: 60px;">
            <div class="pa searchTags">
                &lt;%&ndash;<a href="javascript:;" target="_blank">安卓框架</a>&ndash;%&gt;
                &lt;%&ndash;<a href="javascript:;" target="_blank">响应式</a>&ndash;%&gt;
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
</div>--%>
<jsp:include page="index/Indexheader.jsp"></jsp:include>
<!--header结束-->
<div class="bk"></div>
<!--banner图-->
<div class="g-banner pr">
    <%--<div class="menuwrap"></div>--%>
    <!--隐藏域-->
    <%--<div class="submenu a hide" style="display: none;">--%>
    <%--<div class="innerBox" style="background-image: url(${pageContext.request.contextPath}/static/staticWEB/img/home/fe.png); background-size: 100%;">--%>
    <%--<div class="subinnerBox">--%>
    <%--<div class="title">分类目录</div>--%>
    <%--<span class="bold mr10">基础：</span>--%>
    <%--<a target="_blank" href="javascript:void(0)">HTML/CSS</a>--%>
    <%--<span class="ml10 mr10">/</span>--%>
    <%--<a target="_blank" href="javascript:void(0)">JavaScript</a>--%>
    <%--<span class="ml10 mr10">/</span>--%>
    <%--<div class="title recommend">推荐</div>--%>
    <%--<span class="w625 h32">--%>
    <%--<a target="_blank" onclick="_hmt.push(['_trackEvent', '首页', 'click', '一屏前端推荐位'])" data-track="syqd-1-1" data-ast="qianduantj_1_230">课程 | Web app---Rails10日谈</a>--%>
    <%--<a target="_blank" onclick="_hmt.push(['_trackEvent', '首页', 'click', '一屏前端推荐位'])" data-track="syqd-1-2" data-ast="qianduantj_1_233">课程 | 十天精通CSS3</a>--%>
    <%--</span>--%>
    <%--</div>--%>
    <%--</div>--%>
    <%--</div>--%>
    <%--<div class="submenu b hide" style="display: none;">--%>
    <%--<div class="innerBox " style="background-image: url(${pageContext.request.contextPath}/static/staticWEB/img/home/be.png); background-size: 100%;">--%>
    <%--<div class="subinnerBox">--%>
    <%--<div class="title">分类目录</div>--%>
    <%--<a target="_blank" href="javascript:void(0)">PHP</a>--%>
    <%--<span class="ml10 mr10">/</span>--%>
    <%--<a target="_blank" href="javascript:void(0)">Java</a>--%>
    <%--<div class="title recommend">推荐</div>--%>
    <%--<p class="w625 h32">--%>
    <%--<a target="_blank" onclick="_hmt.push(['_trackEvent', '首页', 'click', '一屏后端推荐位'])" href="javascript:void(0)" data-track="syhd-1-1" data-ast="houduantj_1_155">课程 | 揭秘PHP模糊查询技术</a>--%>
    <%--</p>--%>
    <%--<p class="w625 h32">--%>
    <%--<a target="_blank" onclick="_hmt.push(['_trackEvent', '首页', 'click', '一屏后端推荐位'])" href="javascript:void(0)" data-track="syhd-1-2" data-ast="houduantj_1_317">课程 | python进阶</a>--%>
    <%--</p>--%>
    <%--</div>--%>
    <%--</div>--%>
    <%--</div>--%>
    <!--隐藏域end-->
    <!--banner图左边菜单-->
    <%--<div class="menuContent">--%>
    <%--<div class="item" data-id="a">--%>
    <%--<a href="javascript:void (0)" target="_blank">--%>
    <%--<span class="group">前端开发</span>--%>
    <%--<i class="icon-right2"></i>--%>
    <%--</a>--%>
    <%--</div>--%>
    <%--<div class="item" data-id="b">--%>
    <%--<a href="javascript:void (0)" target="_blank">--%>
    <%--<span class="group">后端开发</span>--%>
    <%--<i class="icon-right2"></i>--%>
    <%--</a>--%>
    <%--</div>--%>
    <%--</div>--%>
    <!--banner图左边菜单end-->
    <!--banner图实现-->
    <div class="g-banner-content">
        <a target="_blank" onclick="_hmt.push(['_trackEvent', '首页', 'click', '一屏幻灯推荐位'])" href="javascript:void (0)" data-track="banner-1-1" data-ast="bigbanner1_1_74" class="click-help">
            <div class="banner-slide" style="background-image: url(${pageContext.request.contextPath}/static/staticWEB/img/home/582d7beb0001d5af12000460.jpg); display: none;">
                <div class="inner">
                </div>
            </div>
        </a>
        <a target="_blank" onclick="_hmt.push(['_trackEvent', '首页', 'click', '一屏幻灯推荐位'])" href="javascript:void (0)" data-track="banner-1-2" data-ast="bigbanner1_1_50" class="click-help">
            <div class="banner-slide" style="background-image: url(${pageContext.request.contextPath}/static/staticWEB/img/home/582ae43e00012c2712000460.jpg); display: none;">
                <div class="inner">                                                          </div>
            </div>
        </a>
        <a target="_blank" onclick="_hmt.push(['_trackEvent', '首页', 'click', '一屏幻灯推荐位'])" href="javascript:void (0)" data-track="banner-1-3" data-ast="bigbanner1_1_74" class="click-help">
            <div class="banner-slide" style="background-image: url(${pageContext.request.contextPath}/static/staticWEB/img/home/582ae40d000196a412000460.jpg); display: none;">
                <div class="inner">                                                          </div>
            </div>
        </a>
    </div>
    <!--点击banner图轮播-->
    <div class="banner-dots">
    </div>
    <a href="javascript:;" class="banner-anchor prev">上一张</a>
    <a href="javascript:;" class="banner-anchor next">下一张</a>
    <div class="cb"></div>
</div>
<!--banner图--end>
<!--实战推荐-->
<div class="outwrap-recomend">
    <div class="contentwrap">
        <div class="recomend">
            最热推荐
            <a class="fr" style="height: 16px;" href="/OnlineCourseFronten/course/show" target="_blank">
                <span class="more">更多<i class="icon-right2"></i></span>
            </a>
        </div>
        <div id="hot-list" class="recomendContent clearfix moco-course-list">
        </div>
    </div>

</div>
<!--实战推荐end-->
<!--实战推荐-->
<div class="outwrap-course">
    <div class="contentwrap">
        <div class="recomend">
            最新推荐
            <a class="fr" style="height: 16px;" href="/OnlineCourseFronten/course/show" target="_blank">
                <span class="more">更多<i class="icon-right2"></i></span>
            </a>
        </div>
        <div id="new-list" class="recomendContent clearfix moco-course-list">
        </div>
    </div>

</div>
<!--实战推荐end-->
<%--<!--第二种div样式-->--%>
<%--<div class="outwrap-content">--%>
    <%--<div class="contentwrap allshadow web pt28 clearfix">--%>
        <%--<div class="classify clearfix">--%>
            <%--<p class="title">"Web"<br>"前端工程师"</p>--%>
            <%--<a data-track="syweb-1-1" onclick="_hmt.push(['_trackEvent', '首页', 'click', '三屏前端路径推荐位'])" href="javascript:;" class="career-path" target="_blank">--%>
                <%--职业路径--%>
                <%--<i class="icon-right2 path-triangle"></i>--%>
            <%--</a>--%>
            <%--<div class="raise-weapon">--%>
                <%--<a data-track="syweb-1-2" onclick="_hmt.push(['_trackEvent', '首页', 'click', '三屏前端路径推荐位'])" target="_blank" href="javascript:;" class="item">--%>
                    <%--Web前端工程师成长第一阶段(基础篇)--%>
                <%--</a>--%>
                <%--<a data-track="syweb-1-3" onclick="_hmt.push(['_trackEvent', '首页', 'click', '三屏前端路径推荐位'])" target="_blank" href="javascript:;" class="item">--%>
                    <%--前端经典案例集萃之“图片、信息展示”--%>
                <%--</a>--%>
                <%--<a data-track="syweb-1-4" onclick="_hmt.push(['_trackEvent', '首页', 'click', '三屏前端路径推荐位'])" target="_blank" href="javascript:;" class="item">--%>
                    <%--高德开发者必由之路——JS API篇--%>
                <%--</a>--%>
            <%--</div>--%>
        <%--</div>--%>
        <%--<a data-track="syweb-2-1" onclick="_hmt.push(['_trackEvent', '首页', 'click', '三屏前端人工推荐位'])" target="_blank" href="javascript:;" data-ast="webtuijian_1_515">--%>
            <%--<div class="longer" style="background-image: url('${pageContext.request.contextPath}/static/staticWEB/img/home/5833b3c40001d99104680172.jpg')">--%>
                <%--<p>6小时用 jQuery 实现小应用</p>--%>
            <%--</div>--%>
        <%--</a>--%>
        <%--<div class="heigher">--%>
            <%--<div class="moco-course-wrap">--%>
                <%--<a data-track="syweb-3-1" onclick="_hmt.push(['_trackEvent', '首页', 'click', '三屏前端自动推荐位'])" target="_blank" href="javascript:;" data-ast="webtuijian_1_71">--%>
                    <%--<div class="moco-course-box">--%>
                        <%--<img src="${pageContext.request.contextPath}/static/staticWEB/img/home/57466ccf0001d9cf06000338-228-128.jpg" height="124" width="100%">--%>
                        <%--<div class="moco-course-intro">--%>
                            <%--<h3> <i>初</i>帝堵抢车位动画制作</h3>--%>
                            <%--<p> 带领大家做一个抢车动画效果。</p>--%>
                        <%--</div>--%>
                        <%--<div class="moco-course-bottom"><span class="l"> 26000 人在学</span></div>--%>
                    <%--</div>--%>
                <%--</a>--%>

                <%--<div class="list">--%>
                    <%--<a data-track="syweb-3-4" onclick="_hmt.push(['_trackEvent', '首页', 'click', '三屏前端自动推荐位'])" target="_blank" href="javascript:;">--%>
                        <%--<p class="w180andH30">HTML5存储</p>--%>
                    <%--</a>--%>
                    <%--<a data-track="syweb-3-5" onclick="_hmt.push(['_trackEvent', '首页', 'click', '三屏前端自动推荐位'])" target="_blank" href="javascript:;">--%>
                        <%--<p class="w180andH30">炫丽的倒计时效果Canvas绘图与动画基础</p>--%>
                    <%--</a>--%>
                    <%--<a data-track="syweb-3-6" onclick="_hmt.push(['_trackEvent', '首页', 'click', '三屏前端自动推荐位'])" target="_blank" href="javascript:;">--%>
                        <%--<p class="w180andH30">JS+CSS3实现“粽情端午&amp;quot;</p>--%>
                    <%--</a>--%>
                    <%--<a data-track="syweb-3-7" onclick="_hmt.push(['_trackEvent', '首页', 'click', '三屏前端自动推荐位'])" target="_blank" href="javascript:;">--%>
                        <%--<p class="w180andH30">AngularJS表单验证</p>--%>
                    <%--</a>--%>
                    <%--<a data-track="syweb-3-8" onclick="_hmt.push(['_trackEvent', '首页', 'click', '三屏前端自动推荐位'])" target="_blank" href="javascript:;">--%>
                        <%--<p class="w180andH30">Canvas玩儿转红包照片</p>--%>
                    <%--</a>--%>
                <%--</div>--%>
            <%--</div>--%>
        <%--</div>--%>

        <%--<div class="moco-course-wrap">--%>
            <%--<a data-track="syweb-3-2" onclick="_hmt.push(['_trackEvent', '首页', 'click', '三屏前端自动推荐位'])" target="_blank" href="javascript:;" data-ast="webtuijian_1_80">--%>
                <%--<div class="moco-course-box">--%>
                    <%--<img src="${pageContext.request.contextPath}/static/staticWEB/img/home/534f8aec00016cec06000338-228-128.jpg" height="124" width="100%">--%>
                    <%--<div class="moco-course-intro">--%>
                        <%--<h3> <i>中</i> 用JavaScript实现图片缓慢缩放效果</h3>--%>
                        <%--<p> 使用JavaScript技术实现图片缓慢缩放</p>--%>
                    <%--</div>--%>
                    <%--<div class="moco-course-bottom"><span class="l"> 22137 人在学</span></div>--%>
                <%--</div>--%>
            <%--</a>--%>
        <%--</div>--%>

        <%--<a data-track="syweb-2-2" onclick="_hmt.push(['_trackEvent', '首页', 'click', '三屏前端人工推荐位'])" target="_blank" href="javascript:;" data-ast="webtuijian_1_519">--%>
            <%--<div class="longer" style="background-image: url('${pageContext.request.contextPath}/static/staticWEB/img/home/5833b4510001f91904680172.jpg')">--%>
                <%--<p>jQuery源码探索之旅</p>--%>
            <%--</div>--%>
        <%--</a>--%>

        <%--<div class="moco-course-wrap">--%>
            <%--<a data-track="syweb-3-3" onclick="_hmt.push(['_trackEvent', '首页', 'click', '三屏前端自动推荐位'])" target="_blank" href="javascript:;" data-ast="webtuijian_1_459">--%>
                <%--<div class="moco-course-box">--%>
                    <%--<img src="${pageContext.request.contextPath}/static/staticWEB/img/home/5704aa6e000158f106000338-228-128.jpg" height="124" width="100%">--%>
                    <%--<div class="moco-course-intro">--%>
                        <%--<h3> <i>中</i> JS插件开发之LightBox图片画廊(下)</h3>--%>
                        <%--<p> 插件开发，前端知识综合演练！</p>--%>
                    <%--</div>--%>
                    <%--<div class="moco-course-bottom">--%>
                        <%--<span class="l"> 11702 人在学</span>--%>
                    <%--</div>--%>
                <%--</div>--%>
            <%--</a>--%>
        <%--</div>--%>
    <%--</div>--%>
<%--</div>--%>
<%--<!--第二种div样式end-->--%>
<!--底部-->
<%--<div class="footer bg-white idx-minwidth">
    <div class="container">
        <div class="footer-wrap idx-width">
            &lt;%&ndash;<div class="footer-sns">&ndash;%&gt;
            &lt;%&ndash;<a href="javascript:;" class="footer-sns-weibo hide-text" target="_blank" title="新浪微博">&ndash;%&gt;
            &lt;%&ndash;新浪微博&ndash;%&gt;
            &lt;%&ndash;</a>&ndash;%&gt;
            &lt;%&ndash;<a href="javascript:void(0);" class="footer-sns-weixin" target="_blank" title="微信">&ndash;%&gt;
            &lt;%&ndash;<i class="footer-sns-weixin-expand"></i>&ndash;%&gt;
            &lt;%&ndash;</a>&ndash;%&gt;
            &lt;%&ndash;<a href="javascript:;" class="footer-sns-qqweibo hide-text" target="_blank" title="腾讯微博">&ndash;%&gt;
            &lt;%&ndash;腾讯微博&ndash;%&gt;
            &lt;%&ndash;</a>&ndash;%&gt;
            &lt;%&ndash;<a href="javascript:;" class="footer-sns-qzone hide-text" target="_blank" title="QQ空间">&ndash;%&gt;
            &lt;%&ndash;QQ空间&ndash;%&gt;
            &lt;%&ndash;</a>&ndash;%&gt;
            &lt;%&ndash;</div>&ndash;%&gt;

            <div class="footer-link">
                &lt;%&ndash;<!-- <a href="/about/us" target="_blank" title="关于我们">关于我们</a> -->&ndash;%&gt;
                &lt;%&ndash;<a href="javascript:;" target="_blank" title="企业合作">企业合作</a>&ndash;%&gt;
                &lt;%&ndash;<a href="javascript:;" target="_blank" title="人才招聘">人才招聘</a>&ndash;%&gt;
                &lt;%&ndash;<a href="javascript:;" target="_blank" title="联系我们">联系我们</a>&ndash;%&gt;
                &lt;%&ndash;<a href="javascript:;" target="_blank" title="讲师招募">讲师招募</a>&ndash;%&gt;
                &lt;%&ndash;<a href="javascript:;" target="_blank" title="常见问题">常见问题</a>&ndash;%&gt;
                &lt;%&ndash;<a href="javascript:;" target="_blank" title="意见反馈">意见反馈</a>&ndash;%&gt;
                &lt;%&ndash;<a href="javascript:;" target="_blank">慕课大学</a>&ndash;%&gt;
                &lt;%&ndash;<a href="javascript:;" target="_blank" title="友情链接">友情链接</a>&ndash;%&gt;
            </div>

            <div class="footer-copyright">
                <p>©&nbsp;2016&nbsp;canlnac.cn&nbsp;&nbsp;粤ICP备16017948号-1</p>
            </div>

            <!--右边导航栏-->
            <div id="J_GotoTop" class="elevator">
                <a href="javascript:void(0)" title="编辑器">
                    <i id="moco-code-all" class="icon-edit"></i>
                </a>
                <a href="javascript:void(0)" class="elevator-msg" title="意见反馈">
                    <i class="icon-feedback"></i>
                </a>
                <a href="javascript:" class="elevator-app" title="app下载">
                    <i class="icon-appdownload"></i>
                    <div class="elevator-app-box"></div>
                </a>
                <a href="javascript:" class="elevator-weixin" id="js-elevator-weixin" title="官方微信">
                    <i class="icon-wxgzh"></i>
                    <div class="elevator-weixin-box"></div>
                </a>
                <a href="javascript:void(0)" class="elevator-top no-goto" style="" title="返回顶部" id="backTop">
                    <i class="icon-up2"></i>
                </a>
            </div>
            <!--右边导航栏end-->
        </div>
    </div>

</div>--%>
<jsp:include page="index/Indexfooter.jsp"></jsp:include>
<!--底部end-->
<!--加载js-->
<script src="${pageContext.request.contextPath}/static/public/js/jquery-1.11.2.min.js"></script>
<script src="${pageContext.request.contextPath}/static/public/js/index/index.js"></script>
<!--<script src="js/sea.js"></script>-->
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

    $(function () {
        $.ajax({
            url:'/OnlineCourseFronten/index/user/hot-new',//路径
            type:'post',
            cache:false,
            dataType:'json',
            data:{

            },
            success:function (data) {
                var hotHtml = '';
                $.each( data.hotList, function(index, content)
                {
                    hotHtml += '<div class="moco-course-wrap">';
                    hotHtml += '<a href="/OnlineCourseFronten/learn/show?id='+content.id+'" target="_blank">';
                    hotHtml += '<div class="moco-course-box">';
                    hotHtml += '<img src="${pageContext.request.contextPath}/static/staticWEB/img/home/580d752500019ca805400300-360-202.jpg" height="124" width="100%">';
                    hotHtml += '<div class="moco-course-intro">';
                    hotHtml += '<h3>'+content.name+'</h3>';
                    hotHtml += '<p>'+content.introduction+'</p>';
                    hotHtml += '</div>';
                    hotHtml += '<div class="moco-course-bottom">';
                    hotHtml += '<span class="l">综合:'+content.complex+'</span>';
                    hotHtml += '<span class="r">'+content.numOfPeople+'人在学</span>';
                    hotHtml += '</div></div></a></div>';
                });
                $('#hot-list').html(hotHtml);
                var newHtml = '';
                $.each( data.newList, function(index, content)
                {
                    newHtml += '<div class="moco-course-wrap">';
                    newHtml += '<a href="/OnlineCourseFronten/learn/show?id='+content.id+'" target="_blank">';
                    newHtml += '<div class="moco-course-box">';
                    newHtml += '<img src="${pageContext.request.contextPath}/static/staticWEB/img/home/580d752500019ca805400300-360-202.jpg" height="124" width="100%">';
                    newHtml += '<div class="moco-course-intro">';
                    newHtml += '<h3>'+content.name+'</h3>';
                    newHtml += '<p>'+content.introduction+'</p>';
                    newHtml += '</div>';
                    newHtml += '<div class="moco-course-bottom">';
                    newHtml += '<span class="l">综合:'+content.complex+'</span>';
                    newHtml += '<span class="r">'+content.numOfPeople+'人在学</span>';
                    newHtml += '</div></div></a></div>';
                });
                $('#new-list').html(newHtml);
            },
            error:function (e) {

            }
        });
    });
</script>
</body>
</html>
