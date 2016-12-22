<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="renderer" content="webkit">
    <title>soursemanage</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/backend/css/bootstrap/bootstrap.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/backend/css/course/course.css">
</head>
<body>
<%--内容--%>
<div class="content">
    <%--资源管理--%>
    <div class="page-header">
        <h1 class="title">资源管理</h1>
    </div>
    <%--资源管理end--%>
    <%--管理内容--%>
    <div class="soursepanel panel-default col-md-12" >
        <from action="" method="post">
            <select>
                <option value ="course1">course1</option>
                <option value ="course2">course2</option>
                <option value="course3">course3</option>
                <option value="course4">course4</option>
            </select>
            <select>
                <option value ="chapter1">chapter1</option>
                <option value ="chapter2">chapter2</option>
                <option value="chapter3">chapter3</option>
                <option value="chapter4">chapter4</option>
            </select>
            <input type="text" name="section"/>
            <input type="button" value="提交">
        </from>
    </div>
    <%--管理内容end--%>
</div>
<%--内容--%>
</body>
</html>
