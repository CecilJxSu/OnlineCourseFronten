<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="renderer" content="webkit">
    <link href="${pageContext.request.contextPath}/static/public/css/notices/notices.css" rel="stylesheet"/>
    <link href="${pageContext.request.contextPath}/static/public/css/topic/common.css" rel="stylesheet"/>
    <title>notices</title>
</head>
<body>
<%--头部--%>
<jsp:include page="include/header.jsp"></jsp:include>
<%--头部end--%>
<!--内容-->
<div id="main">
    <div id="notices" class="noticesPage">
        <ul class="n-tab clearfix">
            <li class="active">
                <a id="not_new" href="">通知<span class="not-num">(2)</span></a>
            </li>
            <%--<li>
                <a id="msg_new" href="/u/1361691/messages" class="">私信<span class="msg-num">(1)</span></a>
            </li>--%>
        </ul>

        <div class="content">
            <%--空白--%>
            <div class="title-bar"></div>
            <%--空白--%>
            <%--<div id="Prompt-layer" class="Prompt-layer">
                <div class="clearfix Prompt-succ-layer Prompt-error-layer">
                    <i class="Prompt-layer-icon succicon"></i>
                    <span class="Prompt-layer-text"></span>
                </div>
            </div>--%>
            <%--通知内容--%>
            <div class="notice-list">
                <%--未看过--%>
                <div note-id="633468" class="notice">
                    <div class="notice-box clearfix">
                        <p class="notice-type ">猿问</p>
                        <div class="notice-show-box">
                            <p class="notice-con ">
                                你的提问<a target="_blank" href="">求学习js数组目录！</a>有新回答
                            </p>
                            <h5 class="notice-date">2016-12-26 16:40:04</h5>
                        </div>
                        <div class="del-box clearfix">
                            <a href="javascript:void(0)" class="del-notice" title="删除此通知">
                                <i class="icon icon-del"></i>
                            </a>
                        </div>
                    </div>
                </div>
                <%--未看过end--%>
                <%--已看过--%>
                <div note-id="606200" class="notice">
                    <div class="notice-box clearfix">
                        <p class="notice-type  already-read ">猿问</p>
                        <div class="notice-show-box">
                            <p class="notice-con pass ">
                                你的提问<a target="_blank" href="">现在学java前景好吗？</a>有新回答
                            </p>
                            <h5 class="notice-date">2016-12-13 17:01:38</h5>
                        </div>
                        <div class="del-box clearfix">
                            <a href="javascript:void(0)" class="del-notice" title="删除此通知">
                                <i class="icon icon-del"></i>
                            </a>
                        </div>
                    </div>
                </div>
                <%--已看过end--%>
            </div>
            <%--通知内容--%>
            <%--分页--%>
            <div class="qa-comment-page">
                <div class="page"><span class="disabled_page">首页</span>
                    <span class="disabled_page">上一页</span>
                    <a href="javascript:void(0)" class="active text-page-tag">1</a>
                    <a class="text-page-tag" href="/u/1361691/courses?page=2">2</a>
                    <a href="/u/1361691/courses?page=2">下一页</a>
                    <a href="/u/1361691/courses?page=2">尾页</a>
                </div>
            </div>
            <%--分页end--%>
        </div>

    </div>

</div>
<!--内容end-->
<%--尾部--%>
<jsp:include page="include/footer.jsp"></jsp:include>
<%--尾部end--%>
<!--加载js-->
<script src="${pageContext.request.contextPath}/static/public/js/jquery-1.11.2.min.js"></script>
<script type="text/javascript">
</script>
</body>
</html>
