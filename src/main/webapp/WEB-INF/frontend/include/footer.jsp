<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="renderer" content="webkit">
    <link href="${pageContext.request.contextPath}/static/public/css/learn/common.css" rel="stylesheet"/>
    <link href="${pageContext.request.contextPath}/static/public/css/learn/layer.css" rel="stylesheet"/>
    <title>footer</title>
</head>
<body>
<!--footer-->
<div id="footer">
    <div class="waper">
        <div class="footerwaper clearfix">
            <div class="followus r">
                <a class="followus-weixin" href="javascript:;" target="_blank" title="微信">
                    <div class="flw-weixin-box"></div>
                </a>
                <a class="followus-weibo" href="http://weibo.com/u/3306361973" target="_blank" title="新浪微博"></a>
                <a class="followus-qzone" href="http://user.qzone.qq.com/1059809142/" target="_blank" title="QQ空间"></a>
            </div>
            <div class="footer_intro l">
                <div class="footer_link">
                    <ul>
                        <li><a href="http://www.imooc.com/" target="_blank">网站首页</a></li>
                        <li><a href="/about/cooperate" target="_blank" title="企业合作">企业合作</a></li>
                        <li><a href="/about/job" target="_blank">人才招聘</a></li>
                        <li><a href="/about/contact" target="_blank">联系我们</a></li>
                        <li><a href="/about/recruit" target="_blank">讲师招募</a></li>
                        <li><a href="/about/faq" target="_blank">常见问题</a></li>
                        <li><a href="/user/feedback" target="_blank">意见反馈</a></li>
                        <li><a href="http://daxue.imooc.com/" target="_blank">慕课大学</a></li>
                        <li><a href="/about/friendly" target="_blank">友情链接</a></li>
                        <!--  <li><a href="/corp/index" target="_blank">合作专区</a></li>
                         <li><a href="/about/us" target="_blank">关于我们</a></li> -->
                    </ul>
                </div>
                <p>Copyright © 2016 imooc.com All Rights Reserved | 京ICP备 13046642号-2</p>
            </div>
        </div>
    </div>
</div>
<!--footer：结束-->
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
<!--加载js-->
<script src="${pageContext.request.contextPath}/static/public/js/jquery-1.11.2.min.js"></script>
<script type="text/javascript">

    function c() {
        h = $(window).height(), t = $(document).scrollTop(), t >= 768 ? ($("#backTop").show(), $("#js-elevator-weixin").removeClass("no-goto")) : ($("#backTop").hide(), $("#js-elevator-weixin").addClass("no-goto"))
    }
    $(function () {
        $("#backTop").click(function () {
            $("html,body").animate({scrollTop: 0}, 200)
        }), $(window).scroll(function () {
            c()
        })
    })

</script>
</body>
</html>
