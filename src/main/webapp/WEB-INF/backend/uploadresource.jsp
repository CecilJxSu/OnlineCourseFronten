<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta name="renderer" content="webkit">
<title>resource</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/static/backend/css/bootstrap/bootstrap.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/static/backend/css/course/course.css">
<style type="text/css">
    .parent{width:550px; height:20px; border:2px solid #09F;margin-top: 10px;margin-bottom: 15px;}
    .son {width:0; height:100%; background-color:#09F; text-align:center; line-height:10px; font-size:20px; font-weight:bold;}
</style>
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
                            <form id="video" class="form-horizontal">
                                <div class="uploadfrom">
                                    <label  class="col-sm-2 control-label form-label">课程名</label>
                                    <div class="col-sm-10">
                                        <select class="form-control" name="course_id" id="video_course_id">
                                            <option value ="">请选择课程</option>
                                            <c:forEach var="course" items="${courses}">
                                                <option value ="<c:out value="${course.id}"/>"><c:out value="${course.name}"/></option>
                                            </c:forEach>
                                        </select>
                                    </div>
                                </div>
                                <div class="uploadfrom">
                                    <label class="col-sm-2 control-label form-label">批量上传</label>
                                    <div class="col-sm-10">
                                        <input id="video_file" type="file" class="uploadinput" name="files" multiple accept="video/mp4">
                                    </div>
                                </div>
                                <div class="uploadfrom">
                                    <label class="col-sm-2 control-label form-label">上传进度</label>
                                    <div class="col-sm-10">
                                        <div id="video_parent" class="parent">
                                            <div id="video_son" class="son"></div>
                                        </div>
                                    </div>
                                </div>
                                <div class="courseform">
                                    <div class="uploadleft col-sm-12 text-right" style="padding-top:20px;">
                                        <a id="btn-success-video" href="#" class="btn btn-success">提交</a>
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
                            <form id="other" class="form-horizontal">
                                <div class="uploadfrom">
                                    <label  class="col-sm-2 control-label form-label">课程名</label>
                                    <div class="col-sm-10">
                                        <select class="form-control" name="course_id" id="other_course_id">
                                            <option value ="">请选择课程</option>
                                            <c:forEach var="course" items="${courses}">
                                                <option value ="<c:out value="${course.id}"/>"><c:out value="${course.name}"/></option>
                                            </c:forEach>
                                        </select>
                                    </div>
                                </div>
                                <div class="uploadfrom">
                                    <label class="col-sm-2 control-label form-label">其他上传</label>
                                    <div class="col-sm-10">
                                        <input type="file" class="uploadinput" name="files"  multiple="">
                                    </div>
                                </div>
                                <div class="uploadfrom">
                                    <label class="col-sm-2 control-label form-label">上传进度</label>
                                    <div class="col-sm-10">
                                        <div class="parent">
                                            <div class="son"></div>
                                        </div>
                                    </div>
                                </div>
                                <div class="courseform">
                                    <div class="uploadleft col-sm-12 text-right" style="padding-top:20px;">
                                        <a id="btn-success-other" href="#" class="btn btn-success">提交</a>
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
<script>
    $('#btn-success-video').on("click",function () {
        if($('#video_course_id').val()==''){
            alert('请先选择课程');
            return false;
        }
        var formData = new FormData(document.getElementById("video"));
        /**
         * 必须false才会避开jQuery对 formdata 的默认处理
         * XMLHttpRequest会对 formdata 进行正确的处理
         */
        $.ajax({
            type: "POST",
            url: "/OnlineCourseFronten/root/document/ul/video",
            data: formData ,
            processData : false,
            //必须false才会自动加上正确的Content-Type
            contentType : false ,
            success:function () {
                alert("成功");
            },
            error:function () {
                alert("上传失败");
            },
            xhr: function(){
                var xhr = $.ajaxSettings.xhr();
                if(onprogress && xhr.upload) {
                    xhr.upload.addEventListener("progress" , onprogress, false);
                    return xhr;
                }
            }
        });
    });
    $('#btn-success-other').on('click',function () {
        if($('#other_course_id').val()==''){
            alert('请先选择课程');
            return false;
        }
        var formData = new FormData(document.getElementById("other"));
        /**
         * 必须false才会避开jQuery对 formdata 的默认处理
         * XMLHttpRequest会对 formdata 进行正确的处理
         */
        $.ajax({
            type: "POST",
            url: "/OnlineCourseFronten/root/document/ul/other",
            data: formData ,
            processData : false,
            //必须false才会自动加上正确的Content-Type
            contentType : false ,
            success:function () {
                alert("成功");
            },
            error:function () {
                alert("上传失败");
            },
            xhr: function(){
                var xhr = $.ajaxSettings.xhr();
                if(onprogress && xhr.upload) {
                    xhr.upload.addEventListener("progress" , onprogress, false);
                    return xhr;
                }
            }
        });
    });
    /**
     * 侦查附件上传情况 ,这个方法大概0.05-0.1秒执行一次
     */
    function onprogress(evt){
        var loaded = evt.loaded;     //已经上传大小情况
        var tot = evt.total;      //附件总大小
        var per = Math.floor(100*loaded/tot);  //已经上传的百分比
        $(".son").html( per +"%" );
        $(".son").css("width" , per +"%");
    }
</script>
</body>
</html>
