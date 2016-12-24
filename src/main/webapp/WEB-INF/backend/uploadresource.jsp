<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
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
                          <form  class="form-horizontal">
                                <div class="uploadfrom">
                                    <label  class="col-sm-2 control-label form-label">课程名</label>
                                    <div class="col-sm-10">
                                        <select class="form-control" name="course_id">
                                            <option value ="course1">course1</option>
                                            <option value ="course2">course2</option>
                                            <option value="course3">course3</option>
                                            <option value="course4">course4</option>
                                        </select>
                                    </div>
                                </div>
                                <div class="uploadfrom">
                                    <label class="col-sm-2 control-label form-label">批量上传</label>
                                    <div class="col-sm-10">
                                        <input type="file" class="uploadinput"  multiple="">
                                    </div>
                                </div>
                                <div class="courseform">
                                  <div class="uploadleft col-sm-12 text-right" style="padding-top:20px;">
                                      <a href="#" class="btn btn-success">提交</a>
                                  </div>
                              </div>
                            </form>
                        </div>
                        <!-- End Content -->
                    </div>
                    <%--课程end--%>
                    <%--章--%>
                    <div role="tabpanel" class="tab-pane" id="profile10">
                        <div class="container-padding">
                            <form  class="form-horizontal">
                                <div class="uploadfrom">
                                    <label  class="col-sm-2 control-label form-label">课程名</label>
                                    <div class="col-sm-10">
                                        <select class="form-control" name="course_id">
                                            <option value ="course1">course1</option>
                                            <option value ="course2">course2</option>
                                            <option value="course3">course3</option>
                                            <option value="course4">course4</option>
                                        </select>
                                    </div>
                                </div>
                                <div class="uploadfrom">
                                    <label class="col-sm-2 control-label form-label">其他上传</label>
                                    <div class="col-sm-10">
                                        <input type="file" class="uploadinput"  multiple="">
                                    </div>
                                </div>
                                <div class="courseform">
                                    <div class="uploadleft col-sm-12 text-right" style="padding-top:20px;">
                                        <a href="#" class="btn btn-success">提交</a>
                                    </div>
                                </div>
                            </form>
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
