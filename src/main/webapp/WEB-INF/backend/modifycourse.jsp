<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="renderer" content="webkit">
    <title>modifyCourse</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/backend/css/bootstrap/bootstrap.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/backend/css/course/course.css">
</head>
<body>
<%--内容--%>
<div class="content">

    <!-- 修改课程 -->
    <div class="page-header">
        <h1 class="title">修改课程</h1>
    </div>
    <!-- 创建课程end -->

    <!-- 课程、章、节 -->
    <div>

        <div class="panel-body" style="padding-bottom:30px;">

            <div role="tabpanel">

                <!-- Nav tabs -->
                <ul class="nav nav-tabs tabcolor5-bg" role="tablist">
                    <li role="presentation" class="active">
                        <a href="#home10" aria-controls="home10" role="tab" data-toggle="tab" aria-expanded="true" class="active">
                            <c:if test="${course != null}">课程</c:if>
                            <c:if test="${chapter != null}">章</c:if>
                            <c:if test="${section != null}">节</c:if>
                        </a>
                    </li>
                </ul>


                <div class="tab-content">
                    <%--课程--%>
                    <c:if test="${course != null}">
                    <div role="tabpanel" class="tab-pane active" id="home10">
                        <div class="container-padding">
                            <div class="panel-body">
                                <form id="course" class="form-horizontal">
                                    <input type="hidden" name="id" value="<c:out value='${course.id}'/>"/>
                                    <div class="courseform">
                                        <label for="course-name" class="col-sm-2 control-label form-label">课程名</label>
                                        <div class="col-sm-10">
                                            <input type="text" name="name" class="form-control" id="course-name" value="<c:out value='${course.name}'/>">
                                        </div>
                                    </div>
                                    <div class="courseform">
                                        <label class="col-sm-2 control-label form-label">课程简介</label>
                                        <div class="col-sm-10">
                                            <textarea class="form-control" name="introduction" rows="3" id="textarea1" placeholder="课程简介"><c:out value='${course.introduction}'/></textarea>
                                        </div>
                                    </div>
                                    <div class="courseform">
                                        <div class="col-sm-12 text-right" style="padding-top:20px;">
                                            <a id="btn-success-course" href="#" class="btn btn-success">提交</a>
                                        </div>
                                    </div>

                                </form>
                            </div>
                        </div>
                    </div>
                    </c:if>
                    <%--课程end--%>
                    <%--章--%>
                    <c:if test="${chapter != null}">
                    <div role="tabpanel" class="tab-pane active" id="profile10">
                        <div class="container-padding">
                            <div class="panel-body">
                                    <form id="chapter" class="form-horizontal">
                                        <input name="id" type="hidden" value="<c:out value='${chapter.id}'/>">
                                        <div class="courseform">
                                            <label class="col-sm-2 control-label form-label">课程名</label>
                                            <div class="col-sm-10">
                                                <c:out value="${courseName}"/>
                                            </div>
                                        </div>
                                        <div class="courseform">
                                            <label class="col-sm-2 control-label form-label">章号</label>
                                            <div class="xz col-sm-10">
                                                <i>第</i><input type="number" id="chapter_index" name="index" class="form-control" style="width: 50px;" value="<c:out value='${chapter.index}'/>"><i>章</i>
                                            </div>
                                        </div>
                                        <div class="courseform">
                                            <label class="col-sm-2 control-label form-label">章名称</label>
                                            <div class="col-sm-10">
                                                <input type="text" id="chapter_name" name="name" class="form-control" value="<c:out value='${chapter.name}'/>"/>
                                            </div>
                                        </div>
                                        <div class="courseform">
                                            <label class="col-sm-2 control-label form-label">章简介</label>
                                            <div class="col-sm-10">
                                                <textarea class="form-control" name="introduction" rows="3"  placeholder="课程简介"><c:out value="${chapter.introduction}"/></textarea>
                                            </div>
                                        </div>
                                        <div class="courseform">
                                            <div class="col-sm-12 text-right" style="padding-top:20px;">
                                                <a id="btn-success-chapter" href="#" class="btn btn-success">提交</a>
                                            </div>
                                        </div>

                                    </form>
                                </div>
                        </div>
                    </div>
                    </c:if>
                    <%--章end--%>
                    <%--节--%>
                    <c:if test="${section != null}">
                    <div role="tabpanel" class="tab-pane active" id="messages10">
                        <div class="container-padding">
                            <div class="panel-body">
                                <form id="section" class="form-horizontal">
                                    <input type="hidden" name="id" value="<c:out value='${section.id}'/>"/>
                                    <div class="courseform">
                                        <label class="col-sm-2 control-label form-label">课程</label>
                                        <div class="col-sm-10">
                                            <c:out value="${courseName}"/>
                                        </div>
                                    </div>
                                    <div class="courseform">
                                        <label class="col-sm-2 control-label form-label">章</label>
                                        <div class="col-sm-10">
                                            <c:out value="${chapterName}"/>
                                        </div>
                                    </div>
                                    <div class="courseform">
                                        <label class="col-sm-2 control-label form-label">节</label>
                                        <div class="xz col-sm-10 ">
                                            <i>第</i><input type="text" name="index" id="section_index" class="form-control" style="width: 50px;" value="<c:out value='${section.index}'/>"/><i>节</i>
                                        </div>
                                    </div>
                                    <div class="courseform">
                                        <label class="col-sm-2 control-label form-label">节名称</label>
                                        <div class="col-sm-10">
                                            <input type="text" name="name" class="form-control" id="section_name" value="<c:out value='${section.name}'/>"/>
                                        </div>
                                    </div>
                                    <div class="courseform">
                                        <label class="col-sm-2 control-label form-label">视频资源</label>
                                        <div class="col-sm-10">
                                            <select class="form-control" name="document_url" id="document_url_id">
                                                <option value ="<c:out value='${section.url}'/>"><c:out value='${videoName}'/></option>
                                                <c:forEach var="video" items="${videos}">
                                                    <option value ="<c:out value='${video.url}'/>"><c:out value='${video.name}'/></option>
                                                </c:forEach>
                                            </select>
                                        </div>
                                    </div>
                                    <div class="courseform">
                                        <label class="col-sm-2 control-label form-label">预览图</label>
                                        <div class="col-sm-10">
                                            <select class="form-control" name="document_img" id="document_img_id">
                                                <option value ="<c:out value='${section.previewImage}'/>"><c:out value='${picName}'/></option>
                                                <c:forEach var="pic" items="${pics}">
                                                    <option value ="<c:out value='${pic.url}'/>"><c:out value='${pic.name}'/></option>
                                                </c:forEach>
                                            </select>
                                        </div>
                                    </div>
                                    <div class="courseform">
                                        <label class="col-sm-2 control-label form-label">其他资源</label>
                                        <div class="col-sm-10">
                                            <select class="form-control" name="document_ids" id="document_id">
                                                <option value ="">请选择其他资源</option>
                                                <c:forEach var="document" items="${documents}">
                                                    <option value ="<c:out value='${document.id}'/>"><c:out value='${document.name}'/></option>
                                                </c:forEach>
                                            </select>
                                            <a id="moreresourse" href="javascript:void(0);" class="btn btn-success">更多其他资源</a>
                                                <%--显示更多资源--%>
                                            <div class="more">
                                            </div>
                                                <%--显示更多资源end--%>
                                        </div>
                                    </div>

                                    <div class="courseform">
                                        <label class="col-sm-2 control-label form-label">删除已选资源</label>
                                        <div class="col-sm-10">
                                            勾选要去除的资源<br/>
                                            <c:forEach var="chooseDocument" items="${chooseDocuments}">
                                                <label class="checkbox-inline">
                                                    <input type="checkbox" name="delete_document_ids" id="delete_document_id" value="<c:out value='${chooseDocument.id}'/>"> <c:out value='${chooseDocument.name}'/>
                                                </label>
                                            </c:forEach>
                                        </div>
                                    </div>
                                    <div class="courseform">
                                        <div class="col-sm-12 text-right" style="padding-top:20px;">
                                            <a id="btn-success-section" href="#" class="btn btn-success">提交</a>
                                        </div>
                                    </div>

                                </form>
                            </div>
                        </div>
                    </div>
                    </c:if>
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
        html +='<select class="form-control" name="document_ids">\n';
        html +=$('#document_id').html();
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

    /*** start: 课程修改提交 ***/
    $('#btn-success-course').on('click',function () {
        if ($('#course-name').val()==''){
            alert('课程名不能为空');
            return false;
        }

        //上传
        var form = new FormData(document.getElementById("course"));

        $.ajax({
            url:"/OnlineCourseFronten/root/course/update",
            type:"post",
            data:form,
            processData:false,
            contentType:false,
            success:function(data){
                    alert('成功');
            },
            error:function(e){
                alert('课程修改失败');
            }
        });
    });
    /*** end: 课程修改提交 ***/
    /*** start: 节修改提交 ***/
    $('#btn-success-section').on('click',function () {
        if($('#section_index').val()==''){
            alert('请先填写节号');
            return false;
        }
        if($('#section_name').val()==''){
            alert('请先填写节名称');
            return false;
        }
        //上传
        var form = new FormData(document.getElementById("section"));

        $.ajax({
            url:"/OnlineCourseFronten/root/catalog/section/update",
            type:"post",
            data:form,
            processData:false,
            contentType:false,
            success:function(data){
                alert('节修改成功');
            },
            error:function(e){
                alert('节修改失败');
            }
        });
    });
    /*** end: 节修改提交 ***/
    /*** start: 章修改提交 ***/
    $('#btn-success-chapter').on('click',function () {
        if($('#chapter_name').val()==''){
            alert('请先填写章名称');
            return false;
        }
        //上传
        var form = new FormData(document.getElementById("chapter"));

        $.ajax({
            url:"/OnlineCourseFronten/root/catalog/chapter/update",
            type:"post",
            data:form,
            processData:false,
            contentType:false,
            success:function(data){
                alert('修改成功');
            },
            error:function(e){
                alert('章修改失败');
            }
        });
    });
    /*** end: 章修改提交 ***/
    /*** start: 创建节时的资源和章的获取 ***/
    $('#section_course_id').change(function () {
        //获取章
        $.ajax({
            url:"/OnlineCourseFronten/root/catalog/chapter/get",
            type:"post",
            data:{
                course_id : $('#section_course_id').val()
            },
            cache:false,
            dataType:'json',
            success:function(data){
                var html = '<option value ="">请选择章</option>';
                $.each( data, function(index, content) {
                    html += '<option value ="'+content.id+'">第'+content.index+'章 '+content.name+'</option>';
                });
                $('#parent_id').html(html);
            },
            error:function(e){
                $('#parent_id').html('<option value ="">请选择章</option>');
            }
        });
        //获取资源
        $.ajax({
            url:"/OnlineCourseFronten/root/course/sources/all/get",
            type:"post",
            data:{
                course_id : $('#section_course_id').val()
            },
            cache:false,
            dataType:'json',
            success:function(data){
                var document_url_html = '<option value ="">请选择视频资源</option>';
                var document_img_html = '<option value ="">请选择预览图</option>';
                var document_html = '<option value ="">请选择其他资源</option>';
                $.each( data.videos, function(index, content) {
                    document_url_html += '<option value ="'+content.id+'">'+content.name+'</option>';
                });
                $.each( data.pics, function(index, content) {
                    document_img_html += '<option value ="'+content.id+'">'+content.name+'</option>';
                });
                $.each( data.all, function(index, content) {
                    document_html += '<option value ="'+content.id+'">'+content.name+'</option>';
                });
                $('#document_url_id').html(document_url_html);
                $('#document_img_id').html(document_img_html);
                $('#document_id').html(document_html);
            },
            error:function(e){
                $('#document_url_id').html('<option value ="">请选择视频资源</option>');
                $('#document_img_id').html('<option value ="">请选择预览图</option>');
                $('#document_id').html('<option value ="">请选择其他资源</option>');
            }
        });
    });
    /*** end: 创建节时的资源和章的获取 ***/
</script>
</body>
</html>
