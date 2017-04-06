<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="renderer" content="webkit">
    <link href="${pageContext.request.contextPath}/static/public/css/createcomment/base.css" rel="stylesheet"/>
    <title>savecomment</title>
</head>
<body>
<%--头部--%>
<jsp:include page="include/header.jsp"></jsp:include>
<%--头部end--%>
<%--内容--%>
<div id="main" style="padding-top: 20px;">
    <div class="bbs clearfix">
        <div class="sucesspage">
            <c:if test="${create=='createsuccess'}">
                <h2>话题发布成功</h2>
                <div class="sendques">
                    <span></span>
                    <h3>您的话题已经提交成功!</h3>
                    <p></p>
                    <p><a href="${pageContext.request.contextPath}/chat/show" class="btn btn-green">返回话题</a></p>
                    <p></p>
                    <p>
                        <a href="javascript:void(0);" class="myques">查看我的话题</a>
                    </p>
                    <p></p>
                </div>
            </c:if>
            <c:if test="${create=='createfail'}">
                <h2>话题发布失败</h2>
                <div class="savefail">
                    <span></span>
                    <h3>您的话题提交失败!</h3>
                    <p>
                    <p></p>
                    <p>
                        <a href="javascript:void(0); " class="btn btn-green">返回创建话题页面</a></p>
                        <%--<a href="javascript:void(0);" class="myques">查看我的话题</a>--%>
                    </p>
                    <p></p>
                </div>
            </c:if>

        </div>
    </div>
</div>
<%--内容--%>
<%--尾部--%>
<jsp:include page="include/footer.jsp"></jsp:include>
<%--尾部end--%>
</body>
</body>
</html>
