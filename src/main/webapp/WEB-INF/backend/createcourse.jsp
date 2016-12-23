<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="renderer" content="webkit">
    <title>createCourse</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/backend/css/bootstrap/bootstrap.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/backend/css/course/course.css">
</head>
<body>
<%--内容--%>
<div class="content">

    <!-- 创建课程 -->
    <div class="page-header">
        <h1 class="title">创建课程</h1>
    </div>
    <!-- 创建课程end -->

    <!-- 课程、章、节 -->
    <div>

        <div class="panel-body" style="padding-bottom:30px;">

            <div role="tabpanel">

                <!-- Nav tabs -->
                <ul class="nav nav-tabs tabcolor5-bg" role="tablist">
                    <li role="presentation" class="active">
                        <a href="#home10" aria-controls="home10" role="tab" data-toggle="tab" aria-expanded="true" class="active">课程</a>
                    </li>
                    <li role="presentation" class="">
                        <a href="#profile10" aria-controls="profile10" role="tab" data-toggle="tab" class="" aria-expanded="false">章</a>
                    </li>
                    <li role="presentation" class="">
                        <a href="#messages10" aria-controls="messages10" role="tab" data-toggle="tab" class="" aria-expanded="false">节</a>
                    </li>
                </ul>


                <div class="tab-content">
                    <%--课程--%>
                    <div role="tabpanel" class="tab-pane active" id="home10">
                        <div class="container-padding">
                            <div class="panel-body">
                                <form id="course" class="form-horizontal">
                                    <div class="courseform">
                                        <label for="input002" class="col-sm-2 control-label form-label">课程名</label>
                                        <div class="col-sm-10">
                                            <input type="text" name="name" class="form-control" id="input002" >
                                        </div>
                                    </div>
                                    <div class="courseform">
                                        <label class="col-sm-2 control-label form-label">课程简介</label>
                                        <div class="col-sm-10">
                                            <textarea class="form-control" name="introduction" rows="3" id="textarea1" placeholder="课程简介"></textarea>
                                        </div>
                                    </div>
                                    <div class="courseform">
                                        <div class="col-sm-12 text-right" style="padding-top:20px;">
                                            <a href="#" class="btn btn-success course">提交</a>
                                        </div>
                                    </div>

                                </form>
                            </div>
                        </div>
                    </div>
                    <%--课程end--%>
                    <%--章--%>
                    <div role="tabpanel" class="tab-pane" id="profile10">
                        <div class="container-padding">
                            <div class="panel-body">
                                    <form id="chapter" class="form-horizontal">
                                        <div class="courseform">
                                            <label for="input002" class="col-sm-2 control-label form-label">课程名</label>
                                            <div class="col-sm-10">
                                                <select class="form-control" name="course_id">
                                                    <option value ="course1">course1</option>
                                                    <option value ="course2">course2</option>
                                                    <option value="course3">course3</option>
                                                    <option value="course4">course4</option>
                                                </select>
                                            </div>
                                        </div>
                                        <div class="courseform">
                                            <label for="input002" class="col-sm-2 control-label form-label">章号</label>
                                            <div class="col-sm-10">
                                                第<input type="text" name="index" class="form-control" style="width: 50px;" >章
                                            </div>
                                        </div>
                                        <div class="courseform">
                                            <label for="input002" class="col-sm-2 control-label form-label">章名称</label>
                                            <div class="col-sm-10">
                                                <input type="text" name="name" class="form-control"  >
                                            </div>
                                        </div>
                                        <div class="courseform">
                                            <label class="col-sm-2 control-label form-label">章简介</label>
                                            <div class="col-sm-10">
                                                <textarea class="form-control" name="introduction" rows="3"  placeholder="课程简介"></textarea>
                                            </div>
                                        </div>
                                        <div class="courseform">
                                            <div class="col-sm-12 text-right" style="padding-top:20px;">
                                                <a href="#" class="btn btn-success chapter">提交</a>
                                            </div>
                                        </div>

                                    </form>
                                </div>
                        </div>
                    </div>
                    <%--章end--%>
                    <%--节--%>
                    <div role="tabpanel" class="tab-pane" id="messages10">
                        <div class="container-padding">
                            <div class="panel-body">
                                <form id="section" class="form-horizontal">
                                    <div class="courseform">
                                        <label for="input002" class="col-sm-2 control-label form-label">课程名</label>
                                        <div class="col-sm-10">
                                            <select class="form-control" name="course_id">
                                                <option value ="course1">course1</option>
                                                <option value ="course2">course2</option>
                                                <option value="course3">course3</option>
                                                <option value="course4">course4</option>
                                            </select>
                                        </div>
                                    </div>
                                    <div class="courseform">
                                        <label for="input002" class="col-sm-2 control-label form-label">章</label>
                                        <div class="col-sm-10">
                                            <select class="form-control" name="parent_id">
                                                <option value ="1">parent1</option>
                                                <option value ="2">parent2</option>
                                                <option value="3">parent3</option>
                                                <option value="4">parent4</option>
                                            </select>
                                        </div>
                                    </div>
                                    <div class="courseform">
                                        <label for="input002" class="col-sm-2 control-label form-label">节</label>
                                        <div class="col-sm-10">
                                            第<input type="text" name="index" class="form-control" style="width: 50px;" >节
                                        </div>
                                    </div>
                                    <div class="courseform">
                                        <label for="input002" class="col-sm-2 control-label form-label">节名称</label>
                                        <div class="col-sm-10">
                                            <input type="text" name="name" class="form-control"  >
                                        </div>
                                    </div>
                                    <div class="courseform">
                                        <label for="input002" class="col-sm-2 control-label form-label">视频资源</label>
                                        <div class="col-sm-10">
                                            <select class="form-control" name="document_url_id">
                                                <option value ="1">parent1</option>
                                                <option value ="2">parent2</option>
                                                <option value="3">parent3</option>
                                                <option value="4">parent4</option>
                                            </select>
                                        </div>
                                    </div>
                                    <div class="courseform">
                                        <label for="input002" class="col-sm-2 control-label form-label">预览图</label>
                                        <div class="col-sm-10">
                                            <select class="form-control" name="document_img_id">
                                                <option value ="1">1</option>
                                                <option value ="2">2</option>
                                                <option value="3">3</option>
                                                <option value="4">4</option>
                                            </select>
                                        </div>
                                    </div>
                                    <div class="courseform">
                                        <label for="input002" class="col-sm-2 control-label form-label">其他资源</label>
                                        <div class="col-sm-10">
                                            <select class="form-control" name="document_id">
                                                <option value ="1">document1</option>
                                                <option value ="2">document2</option>
                                                <option value="3">document3</option>
                                                <option value="4">document4</option>
                                            </select>
                                        </div>
                                    </div>
                                    <div class="courseform">
                                        <div class="col-sm-12 text-left" style="padding-top:20px;">
                                            <a id="moreresourse" href="javascript:void(0);" class="btn btn-success">更多其他资源</a>
                                        </div>
                                        <%--显示更多资源--%>
                                        <div class="more">
                                        </div>
                                        <%--显示更多资源end--%>
                                    </div>
                                    <div class="courseform">
                                        <div class="col-sm-12 text-right" style="padding-top:20px;">
                                            <a href="#" class="btn btn-success">提交</a>
                                        </div>
                                    </div>

                                </form>
                            </div>
                        </div>
                    </div>
                    <%--节end--%>
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
<script type="text/javascript">
    /*加载更多资源*/
    $("#moreresourse").on("click",function (e) {
        e.preventDefault();
        var html ='';
        html +='<div class="col-sm-10 qt">\n';
        html +='<select class="form-control" name="document_id">\n';
        html +='<option value ="1">document1</option>\n';
        html +='<option value ="2">document2</option>\n';
        html +='<option value="3">document3</option>\n';
        html +='<option value="4">document4</option>\n';
        html +='</select>\n';
        html +='<span class="cb"></span>\n';
        html +='</div>\n';
        $(".more").append(html);
        removemore();
    });
    /*加载更多资源end*/
    /*删除资源*/
    function removemore() {
        $(".cb").on("click",function (e) {
            e.preventDefault();
            $(this).parent('div').remove();
        });
    }
    /*删除资源end*/

    /*** start: 课程提交 ***/
    $('.btn,.btn-success,.course').on('click',function () {
        //上传
        var form = new FormData(document.getElementById("course"));

        $.ajax({
            url:"/OnlineCourseFronten/root/course/add",
            type:"post",
            data:form,
            processData:false,
            contentType:false,
            success:function(data){
                if (data == 'profile-err')
                    alert('课程创建失败！请先完善个人信息');
                if (data == 'success') {
                    alert('成功');
                    $('#course')[0].reset();
                }
            },
            error:function(e){
                alert('课程创建失败');
            }
        });
    });
    /*** end: 课程提交 ***/
</script>
</body>
</html>
