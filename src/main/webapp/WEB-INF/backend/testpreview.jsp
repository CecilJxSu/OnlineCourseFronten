<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="renderer" content="webkit">
    <title>testpreview</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/backend/css/bootstrap/bootstrap.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/backend/css/course/course.css">
</head>
<body>

<%--顶部--%>
<div class="clearfix" style="text-align: -webkit-center;">
<h1 style="color: rgba(255, 140, 0, 0.75);" >小测预览页面</h1>
</div>
<%--顶部end--%>
<%--内容--%>
<div class="content">
    <form action="" method="">
    <%--小测显示内容--%>
    <div class="test">
        <p>1.选择题</p>
    </div>
    <%--小测显示内容end--%>
    <div class="col-sm-12" style="padding-top:20px;">
        <a id="test_btn-success" href="javascript:void (0);" class="btn btn-success" style="margin-left: 48%;">提交</a>
    </div>
    </form>
</div>
<%--内容--%>

<!--加载js-->
<script src="${pageContext.request.contextPath}/static/backend/js/jquery-1.11.2.min.js"></script>
<script src="${pageContext.request.contextPath}/static/backend/js/bootstrap/bootstrap.min.js"></script>
</body>
</html>
