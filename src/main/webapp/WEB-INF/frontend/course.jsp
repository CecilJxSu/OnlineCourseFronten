<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="renderer" content="webkit">
    <link href="${pageContext.request.contextPath}/static/public/css/index/common.css" rel="stylesheet"/>
    <link href="${pageContext.request.contextPath}/static/public/css/index/moco.min.css" rel="stylesheet"/>
    <title>header</title>
</head>
<body>

<%--课程内容--%>
<div class="main">
    <!--查询方向-->
    <div class="wrap ">
        <div class="top">
            <div class="course-content">
                <div class="course-nav-box">
                    <div class="course-nav-row clearfix">
                        <span class="hd l">方向：</span>
                        <div class="bd">
                            <ul class="">
                                <li class="course-nav-item ">
                                    <a href="javascript:;">全部</a>
                                </li>
                                <li class="course-nav-item
                                     on">
                                    <a href="javascript:;" data-ct="fe">前端开发</a>
                                </li>
                                <li class="course-nav-item
                                    ">
                                    <a href="javascript:;" data-ct="be">后端开发</a>
                                </li>
                            </ul>
                        </div>
                    </div>
                    <div class="course-nav-row clearfix">
                        <span class="hd l">分类：</span>
                        <div class="bd">
                            <ul class="">
                                <li class="course-nav-item on">
                                    <a href="javascript:;">全部</a>
                                </li>
                                <li class="course-nav-item ">
                                    <a href="javascript:;" data-id="7" data-ct="fe">HTML/CSS</a>
                                </li>
                                <li class="course-nav-item ">
                                    <a href="javascript:;" data-id="44" data-ct="fe">JavaScript</a>
                                </li>
                                <li class="course-nav-item ">
                                    <a href="javascript:;" data-id="221" data-ct="fe">Html5</a>
                                </li>
                                <li class="course-nav-item ">
                                    <a href="javascript:;" data-id="1262" data-ct="fe">CSS3</a>
                                </li>
                            </ul>
                        </div>
                    </div>
                    <div class="course-nav-row clearfix border_bottom_none">
                        <span class="hd l">类型：</span>
                        <div class="bd">
                            <ul class="">

                                <li class="course-nav-item on">
                                    <a href="javascript:;">全部</a>
                                </li>
                                <li class="course-nav-item ">
                                    <a href="javascript:;">基础</a>
                                </li>
                                <li class="course-nav-item ">
                                    <a href="javascript:;">案例</a>
                                </li>
                            </ul>
                        </div>
                    </div>
                </div>

            </div>
        </div>
    </div>
    <!--查询方向end-->
    <!--显示最新最热-->
    <div class="container">
        <!--最新最热标签-->
        <div class="course-tool-bar clearfix">
            <div class="tool-left l">
                <a href="javascript:;" class="sort-item">最新</a>
                <a href="javascript:;" class="sort-item active">最热</a>
            </div>
            <div class="l">
            <span class="tool-item" style="display: none;">
                <a class="follow-learn tool-chk" href="javascript:void(0);">跟我学</a>
            </span>
            </div>
            <div class="tool-right r">
             <span class="tool-item total-num">
                  共<b>193</b>个课程
             </span>
                <span class="tool-item tool-pager">
                <span class="pager-num">
                    <b class="pager-cur">2</b>/<em class="pager-total">8</em>
                </span>
                <a href="/course/list?c=fe&amp;page=1" class="pager-action pager-prev "><i class="icon-left2"></i></a>
                <a href="/course/list?c=fe&amp;page=3" class="pager-action pager-next"><i class="icon-right2"></i></a>
            </span>
            </div>

        </div>
        <!--最新最热标签end-->
        <!--展示课程-->
        <div class="course-list">
            <div class="moco-course-list">
                <ul class="clearfix">

                    <div class="moco-course-wrap">
                        <a onclick="_hmt.push(['_trackEvent', '课程列表页', 'click', '列表首行数据'])" href="/learn/262" target="_self">
                            <div class="moco-course-box">
                                <img alt="玩转Bootstrap（JS插件篇）" src="${pageContext.request.contextPath}/static/staticWEB/img/home/5704ae5d00013c9a06000338-240-135.jpg" height="124" width="100%">
                                <div class="moco-course-intro">
                                    <h3>
                                        <i>中</i>
                                        玩转Bootstrap（JS插件篇）
                                    </h3>
                                    <p>教你如何使用Bootstrap中的JS插件。</p>
                                </div>
                                <div class="moco-course-bottom"><span class="l"> 77435人在学</span></div>
                            </div>
                        </a>
                    </div>

                    <div class="moco-course-wrap">
                        <a onclick="_hmt.push(['_trackEvent', '课程列表页', 'click', '列表首行数据'])" href="/learn/262" target="_self">
                            <div class="moco-course-box">
                                <img alt="玩转Bootstrap（JS插件篇）" src="${pageContext.request.contextPath}/static/staticWEB/img/home/5704ae5d00013c9a06000338-240-135.jpg" height="124" width="100%">
                                <div class="moco-course-intro">
                                    <h3>
                                        <i>中</i>
                                        玩转Bootstrap（JS插件篇）
                                    </h3>
                                    <p>教你如何使用Bootstrap中的JS插件。</p>
                                </div>
                                <div class="moco-course-bottom"><span class="l"> 77435人在学</span></div>
                            </div>
                        </a>
                    </div>

                    <div class="moco-course-wrap">
                        <a onclick="_hmt.push(['_trackEvent', '课程列表页', 'click', '列表首行数据'])" href="/learn/262" target="_self">
                            <div class="moco-course-box">
                                <img alt="玩转Bootstrap（JS插件篇）" src="${pageContext.request.contextPath}/static/staticWEB/img/home/5704ae5d00013c9a06000338-240-135.jpg" height="124" width="100%">
                                <div class="moco-course-intro">
                                    <h3>
                                        <i>中</i>
                                        玩转Bootstrap（JS插件篇）
                                    </h3>
                                    <p>教你如何使用Bootstrap中的JS插件。</p>
                                </div>
                                <div class="moco-course-bottom"><span class="l"> 77435人在学</span></div>
                            </div>
                        </a>
                    </div>

                    <div class="moco-course-wrap">
                        <a onclick="_hmt.push(['_trackEvent', '课程列表页', 'click', '列表首行数据'])" href="/learn/262" target="_self">
                            <div class="moco-course-box">
                                <img alt="玩转Bootstrap（JS插件篇）" src="${pageContext.request.contextPath}/static/staticWEB/img/home/5704ae5d00013c9a06000338-240-135.jpg" height="124" width="100%">
                                <div class="moco-course-intro">
                                    <h3>
                                        <i>中</i>
                                        玩转Bootstrap（JS插件篇）
                                    </h3>
                                    <p>教你如何使用Bootstrap中的JS插件。</p>
                                </div>
                                <div class="moco-course-bottom"><span class="l"> 77435人在学</span></div>
                            </div>
                        </a>
                    </div>

                    <div class="moco-course-wrap">
                        <a onclick="_hmt.push(['_trackEvent', '课程列表页', 'click', '列表首行数据'])" href="/learn/262" target="_self">
                            <div class="moco-course-box">
                                <img alt="玩转Bootstrap（JS插件篇）" src="${pageContext.request.contextPath}/static/staticWEB/img/home/5704ae5d00013c9a06000338-240-135.jpg" height="124" width="100%">
                                <div class="moco-course-intro">
                                    <h3>
                                        <i>中</i>
                                        玩转Bootstrap（JS插件篇）
                                    </h3>
                                    <p>教你如何使用Bootstrap中的JS插件。</p>
                                </div>
                                <div class="moco-course-bottom"><span class="l"> 77435人在学</span></div>
                            </div>
                        </a>
                    </div>

                    <div class="moco-course-wrap">
                        <a onclick="_hmt.push(['_trackEvent', '课程列表页', 'click', '列表首行数据'])" href="/learn/262" target="_self">
                            <div class="moco-course-box">
                                <img alt="玩转Bootstrap（JS插件篇）" src="${pageContext.request.contextPath}/static/staticWEB/img/home/5704ae5d00013c9a06000338-240-135.jpg" height="124" width="100%">
                                <div class="moco-course-intro">
                                    <h3>
                                        <i>中</i>
                                        玩转Bootstrap（JS插件篇）
                                    </h3>
                                    <p>教你如何使用Bootstrap中的JS插件。</p>
                                </div>
                                <div class="moco-course-bottom"><span class="l"> 77435人在学</span></div>
                            </div>
                        </a>
                    </div>

                </ul>
            </div>
            <!--页数-->
            <div class="page">
                <a href="/course/list?c=fe&amp;page=1">首页</a>
                <a href="/course/list?c=fe&amp;page=1">上一页</a><a
                    class="text-page-tag" href="/course/list?c=fe&amp;page=1">1</a>
                <a href="javascript:void(0)"class="active text-page-tag">2</a>
                <a class="text-page-tag" href="/course/list?c=fe&amp;page=3">3</a>
                <a class="text-page-tag"href="/course/list?c=fe&amp;page=4">4</a>
                <a class="text-page-tag" href="/course/list?c=fe&amp;page=5">5</a>
                <a class="text-page-tag" href="/course/list?c=fe&amp;page=6">6</a>
                <a class="text-page-tag" href="/course/list?c=fe&amp;page=7">7</a>
                <a href="/course/list?c=fe&amp;page=3">下一页</a>
                <a href="/course/list?c=fe&amp;page=8">尾页</a></div>
            <!--页数end-->
        </div>
        <!--展示课程end-->
    </div>
    <!--显示最新最热end-->
</div>
<%--课程内容end--%>

<!--加载js-->
<script src="${pageContext.request.contextPath}/static/public/js/jquery-1.11.2.min.js"></script>
<script type="text/javascript">
    /*$(function () {
        /!*"code" == OP_CONFIG.page && $("#J_GotoTop").hide(), a(), c(), $('[action-type="my_menu"],#nav_list').on("mouseenter", function () {
         $('[action-type="my_menu"]').addClass("hover"), $("#nav_list").show()
         }),*!/
        $('[action-type="my_menu"],#nav_list').on("mouseleave", function () {
            $('[action-type="my_menu"]').removeClass("hover"), $("#nav_list").hide()
        }), $("#set_btn").click(function () {
            /!*回调数据*!/
            location.href = "/space/course"
        }), $("#js-signin-btn").on("click", function (e) {
            /!*链接路径*!/
            e.preventDefault(), require.async("../../logic/login/login-regist", function (a) {
                a.init()
            })
        }), $("#js-signup-btn").on("click", function (e) {
            /!*链接路径*!/
            e.preventDefault(), require.async("../../logic/login/login-regist", function (a) {
                a.signup()
            })
        }), $("#nav-item a:eq(0)").click(function () {
            b.remove("lange_id"), b.remove("pos_id"), b.remove("tab_id"), b.remove("is_easy"), b.remove("sort")
        }), $("#backTop").click(function () {
            $("html,body").animate({scrollTop: 0}, 200)
        }), $(window).scroll(function () {
            c()
        }), $(document).on("keydown", function (e) {
            13 == e.keyCode && e.ctrlKey && ($(document).trigger("submit.imooc"), e.preventDefault())
        })
    })*/
</script>
</body>
</html>
