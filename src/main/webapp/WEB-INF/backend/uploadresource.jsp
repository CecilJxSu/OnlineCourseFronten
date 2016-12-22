<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="renderer" content="webkit">
    <title>resource</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/backend/css/bootstrap/bootstrap.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/backend/css/course/course.css">
</head>
<body>
<%--内容--%>
<div class="content">

    <!-- 上传资源 -->
    <div class="page-header">
        <h1 class="title">上传资源</h1>
    </div>
    <!-- 上传资源end -->

    <!-- 课程、章、节 -->
    <div>

        <div class="panel-body" style="padding-bottom:30px;">

            <div role="tabpanel">

                <!-- Nav tabs -->
                <ul class="nav nav-tabs tabcolor5-bg" role="tablist">
                    <li role="presentation" class="active">
                        <a href="#home10" aria-controls="home10" role="tab" data-toggle="tab" aria-expanded="true" class="active">上传视频</a>
                    </li>
                    <li role="presentation" class="">
                        <a href="#profile10" aria-controls="profile10" role="tab" data-toggle="tab" class="" aria-expanded="false">上传其他</a>
                    </li>
                </ul>


                <div class="tab-content">
                    <%--课程--%>
                    <div role="tabpanel" class="tab-pane active" id="home10">
                        <div class="container-padding">
                            <from action="" method="post">
                                <input type="text" name="course"/>
                                <input type="button" value="提交">
                            </from>
                        </div>
                        <!-- End Content -->
                    </div>
                    <%--课程end--%>
                    <%--章--%>
                    <div role="tabpanel" class="tab-pane" id="profile10">
                        <div class="container-padding">
                            <from action="" method="post">
                                <select>
                                    <option value ="course1">course1</option>
                                    <option value ="course2">course2</option>
                                    <option value="course3">course3</option>
                                    <option value="course4">course4</option>
                                </select>
                                <input type="text" name="chapter"/>
                                <input type="button" value="提交">
                            </from>
                        </div>
                    </div>
                    <%--章end--%>
                </div>


            </div>

        </div>

    </div>
    <!-- 课程、章、节 -->
</div>
<%--内容--%>

<!--加载js-->
<script src="${pageContext.request.contextPath}/static/backend/js/jquery-1.11.2.min.js"></script>
<script src="${pageContext.request.contextPath}/static/backend/js/bootstrap/bootstrap.min.js"></script>
</body>
</html>
