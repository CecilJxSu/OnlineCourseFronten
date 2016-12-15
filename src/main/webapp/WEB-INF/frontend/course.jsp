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
<%--头部--%>
<jsp:include page="include/header.jsp"></jsp:include>
<%--头部end--%>
<%--课程内容--%>
<div class="main">
    <!--显示最新最热-->
    <div class="container">
        <!--最新最热标签-->
        <div class="course-tool-bar clearfix">
            <div class="tool-left l">
                <a href="javascript:;" class="sort-item active" name="hot">最热</a>|
                <a href="javascript:;" class="sort-item" name="new">最新</a>
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
                </ul>
            </div>
            <!--页数-->
            <div class="page">
            </div>
            <!--页数end-->
        </div>
        <!--展示课程end-->
    </div>
    <!--显示最新最热end-->
</div>
<%--课程内容end--%>
<%--尾部--%>
<jsp:include page="include/footer.jsp"></jsp:include>
<%--尾部end--%>
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
<script src="${pageContext.request.contextPath}/static/public/js/course/course.js"></script>
</body>
</html>
