<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="renderer" content="webkit">
    <link href="${pageContext.request.contextPath}/static/public/css/index/index.css" rel="stylesheet"/>
    <link href="${pageContext.request.contextPath}/static/public/css/index/moco.min.css" rel="stylesheet"/>
    <title>footer</title>
</head>
<body>
<!--底部-->
<div class="footer bg-white idx-minwidth">
    <div class="container">
        <div class="footer-wrap idx-width">
            <div class="footer-sns">
                <a href="javascript:;" class="footer-sns-weibo hide-text" target="_blank" title="新浪微博">
                    新浪微博
                </a>
                <a href="javascript:void(0);" class="footer-sns-weixin" target="_blank" title="微信">
                    <i class="footer-sns-weixin-expand"></i>
                </a>
                <a href="javascript:;" class="footer-sns-qqweibo hide-text" target="_blank" title="腾讯微博">
                    腾讯微博
                </a>
                <a href="javascript:;" class="footer-sns-qzone hide-text" target="_blank" title="QQ空间">
                    QQ空间
                </a>
            </div>

            <div class="footer-link">
                <!-- <a href="/about/us" target="_blank" title="关于我们">关于我们</a> -->
                <a href="javascript:;" target="_blank" title="企业合作">企业合作</a>
                <a href="javascript:;" target="_blank" title="人才招聘">人才招聘</a>
                <a href="javascript:;" target="_blank" title="联系我们">联系我们</a>
                <a href="javascript:;" target="_blank" title="讲师招募">讲师招募</a>
                <a href="javascript:;" target="_blank" title="常见问题">常见问题</a>
                <a href="javascript:;" target="_blank" title="意见反馈">意见反馈</a>
                <a href="javascript:;" target="_blank">慕课大学</a>
                <a href="javascript:;" target="_blank" title="友情链接">友情链接</a>
            </div>

            <div class="footer-copyright">     <p>©&nbsp;2016&nbsp;canlnac.cn&nbsp;&nbsp;粤ICP备16017948号-1</p></div>

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
                <a href="javascript:void(0)" class="elevator-top no-goto" style="display: none;" title="返回顶部" id="backTop">
                    <i class="icon-up2"></i>
                </a>
            </div>
            <!--右边导航栏end-->
        </div>
    </div>

</div>
<!--底部end-->
<!--加载js-->
<script src="${pageContext.request.contextPath}/static/public/js/jquery-1.11.2.min.js"></script>
<script type="text/javascript">
    $(document).ready(function () {
        $("#backTop").click(function () {
            $("html,body").animate({scrollTop: 0}, 200)
        }), $(window).scroll(function () {
            h = $(window).height(), t = $(document).scrollTop(), t >= 200 ? ($("#backTop").show(), $("#js-elevator-weixin").removeClass("no-goto")) : ($("#backTop").hide(), $("#js-elevator-weixin").addClass("no-goto"))
        })
    })
</script>
</body>
</html>
