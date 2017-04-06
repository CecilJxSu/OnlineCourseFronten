<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
                    <li role="presentation" class="">
                        <a href="#test" aria-controls="messages10" role="tab" data-toggle="tab" class="" aria-expanded="false">小测</a>
                    </li>
                </ul>


                <div class="tab-content">
                    <%--课程--%>
                    <div role="tabpanel" class="tab-pane active" id="home10">
                        <div class="container-padding">
                            <div class="panel-body">
                                <form id="course" class="form-horizontal">
                                    <div class="courseform">
                                        <label for="course-name" class="col-sm-2 control-label form-label">课程名</label>
                                        <div class="col-sm-10">
                                            <input type="text" name="name" class="form-control" id="course-name" >
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
                                            <a id="btn-success-course" href="#" class="btn btn-success">提交</a>
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
                                            <label class="col-sm-2 control-label form-label">课程名</label>
                                            <div class="col-sm-10">
                                                <select class="form-control" name="course_id" id="chapter_course">
                                                    <option value ="">请选择课程</option>
                                                    <c:forEach var="course" items="${courses}">
                                                        <option value ="<c:out value="${course.id}"/>"><c:out value="${course.name}"/></option>
                                                    </c:forEach>
                                                </select>
                                            </div>
                                        </div>
                                        <div class="courseform">
                                            <label class="col-sm-2 control-label form-label">章号</label>
                                            <div class="xz col-sm-10">
                                                <i>第</i><input type="number" id="chapter_index" name="index" class="form-control" style="width: 50px;" ><i>章</i>
                                            </div>
                                        </div>
                                        <div class="courseform">
                                            <label class="col-sm-2 control-label form-label">章名称</label>
                                            <div class="col-sm-10">
                                                <input type="text" id="chapter_name" name="name" class="form-control"  >
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
                                                <a id="btn-success-chapter" href="#" class="btn btn-success">提交</a>
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
                                        <label class="col-sm-2 control-label form-label">课程</label>
                                        <div class="col-sm-10">
                                            <select class="form-control" name="course_id" id="section_course_id">
                                                <option value ="">请选择课程</option>
                                                <c:forEach var="course" items="${courses}">
                                                    <option value ="<c:out value="${course.id}"/>"><c:out value="${course.name}"/></option>
                                                </c:forEach>
                                            </select>
                                        </div>
                                    </div>
                                    <div class="courseform">
                                        <label class="col-sm-2 control-label form-label">章</label>
                                        <div class="col-sm-10">
                                            <select class="form-control" name="parent_id" id="parent_id">
                                                <option value ="">请选择章</option>
                                            </select>
                                        </div>
                                    </div>
                                    <div class="courseform">
                                        <label class="col-sm-2 control-label form-label">节</label>
                                        <div class="xz col-sm-10 ">
                                            <i>第</i><input type="text" name="index" id="section_index" class="form-control" style="width: 50px;" ><i>节</i>
                                        </div>
                                    </div>
                                    <div class="courseform">
                                        <label class="col-sm-2 control-label form-label">节名称</label>
                                        <div class="col-sm-10">
                                            <input type="text" name="name" class="form-control" id="section_name" >
                                        </div>
                                    </div>
                                    <div class="courseform">
                                        <label class="col-sm-2 control-label form-label">视频资源</label>
                                        <div class="col-sm-10">
                                            <select class="form-control" name="document_url_id" id="document_url_id">
                                                <option value ="">请选择视频资源</option>
                                            </select>
                                        </div>
                                    </div>
                                    <div class="courseform">
                                        <label class="col-sm-2 control-label form-label">预览图</label>
                                        <div class="col-sm-10">
                                            <select class="form-control" name="document_img_id" id="document_img_id">
                                                <option value ="">请选择预览图</option>
                                            </select>
                                        </div>
                                    </div>
                                    <div class="courseform">
                                        <label class="col-sm-2 control-label form-label">其他资源</label>
                                        <div class="col-sm-10">
                                            <select class="form-control" name="document_ids" id="document_id">
                                                <option value ="">请选择其他资源</option>
                                            </select>
                                        </div>
                                    </div>
                                    <div class="courseform">
                                        <div class="col-sm-12 text-left" style="padding-top:20px;">
                                            <a id="moreresourse" href="javascript:void(0);" class="btn btn-success">添加其他资源</a>
                                        </div>
                                        <%--显示更多资源--%>
                                        <div class="more">
                                        </div>
                                        <%--显示更多资源end--%>
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
                    <%--节end--%>
                    <%--小测--%>
                    <div role="tabpanel" class="tab-pane" id="test">
                        <div class="container-padding">
                            <div class="panel-body">
                                <form id="testsection" class="form-horizontal">
                                    <div class="courseform">
                                        <label class="col-sm-2 control-label form-label">课程</label>
                                        <div class="col-sm-10">
                                            <select class="form-control" name="course_id" id="test_section_course_id">
                                                <option value ="">请选择课程</option>
                                                <c:forEach var="course" items="${courses}">
                                                    <option value ="<c:out value="${course.id}"/>"><c:out value="${course.name}"/></option>
                                                </c:forEach>
                                            </select>
                                        </div>
                                    </div>
                                    <div class="courseform">
                                        <label class="col-sm-2 control-label form-label">章</label>
                                        <div class="col-sm-10">
                                            <select class="form-control" name="parent_id" id="test_parent_id">
                                                <option value ="">请选择章</option>
                                            </select>
                                        </div>
                                    </div>
                                    <%--因为与移动端逻辑同步，注释测方法，改用B--%>
                                    <%--<div class="courseform">--%>
                                        <%--<label class="col-sm-2 control-label form-label">节</label>--%>
                                        <%--<div class="xz col-sm-10 ">--%>
                                            <%--<i>第</i><input type="text" name="index" id="test_section_index" class="form-control" style="width: 50px;" ><i>节</i>--%>
                                        <%--</div>--%>
                                    <%--</div>--%>
                                    <div class="courseform">
                                        <label class="col-sm-2 control-label form-label">小测名称</label>
                                        <div class="col-sm-10">
                                            <input type="text" name="name" class="form-control" id="test_section_name" >
                                        </div>
                                    </div>
                                    <div class="courseform">
                                        <label class="col-sm-2 control-label form-label">小测上传</label>
                                        <div class="col-sm-10">
                                            <input id="test_upload" class="uploadinput" type="file" name="test_upload" multiple accept="application/xlsx">
                                        </div>
                                    </div>
                                    <div class="courseform testfrom">
                                        <div class="col-sm-12 text-left" style="padding-top:20px;">
                                            <a id="test_mould" href="/OnlineCourseFronten/static/staticWEB/小测模板.xlsx" class="btn btn-success">小测模板下载</a>
                                        </div>
                                        <div class="col-sm-12 text-left" style="padding-top:20px;">
                                            <a id="test_preview" href="javascript:void(0);" class="btn btn-success">小测预览</a>
                                        </div>
                                        <%--显示更多资源--%>
                                        <div class="more">
                                        </div>
                                        <%--显示更多资源end--%>
                                    </div>
                                    <div class="courseform">
                                        <div class="col-sm-12 text-right" style="padding-top:20px;">
                                            <a id="test_btn-success-section" href="#" class="btn btn-success">提交</a>
                                        </div>
                                    </div>
                                </form>
                            </div>
                            <%--小测预览--%>
                            <div id="test_preview_show" class="panel-body"></div>
                        </div>
                    </div>
                    <%--小测end--%>
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

    /*** start: 课程提交 ***/
    $('#btn-success-course').on('click',function () {
        if ($('#course-name').val()==''){
            alert('课程名不能为空');
            return false;
        }

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
    /*** start: 节提交 ***/
    $('#btn-success-section').on('click',function () {
        if($('#section_course_id').val()==''){
            alert('请先选择课程');
            return false;
        }
        if($('#parent_id').val()==''){
            alert('请先选择章');
            return false;
        }
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
            url:"/OnlineCourseFronten/root/catalog/section/add",
            type:"post",
            data:form,
            processData:false,
            contentType:false,
            success:function(data){
                alert('成功');
                $('#section')[0].reset();
            },
            error:function(e){
                alert('节创建失败');
            }
        });
    });
    /*** end: 节提交 ***/
    /*** start: 章提交 ***/
    $('#btn-success-chapter').on('click',function () {
        if($('#chapter_course').val()==''){
            alert('请先选择课程');
            return false;
        }
        if($('#chapter_index').val()==''){
            alert('请先填写章号');
            return false;
        }
        if($('#chapter_name').val()==''){
            alert('请先填写章名称');
            return false;
        }
        //上传
        var form = new FormData(document.getElementById("chapter"));

        $.ajax({
            url:"/OnlineCourseFronten/root/catalog/chapter/add",
            type:"post",
            data:form,
            processData:false,
            contentType:false,
            success:function(data){
                alert('成功');
                $('#chapter')[0].reset();
            },
            error:function(e){
                alert('章创建失败');
            }
        });
    });
    /*** end: 章提交 ***/
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


    /*** start: 创建小测时，章的获取 ***/
    $('#test_section_course_id').change(function () {
        //获取章
        $.ajax({
            url: "/OnlineCourseFronten/root/catalog/chapter/get",
            type: "post",
            data: {
                course_id: $('#test_section_course_id').val()
            },
            cache: false,
            dataType: 'json',
            success: function (data) {
                var html = '<option value ="">请选择章</option>';
                $.each(data, function (index, content) {
                    html += '<option value ="' + content.id + '">第' + content.index + '章 ' + content.name + '</option>';
                });
                $('#test_parent_id').html(html);
            },
            error: function (e) {
                $('#test_parent_id').html('<option value ="">请选择章</option>');
            }
        });
    });
    /*** end: 创建小测时，章的获取 ***/

    var qa = null;
    /*** start:小测预览 ***/
    $('#test_preview').on('click',function () {
        //上传
        var form = new FormData(document.getElementById("testsection"));

        $.ajax({
            url:"/OnlineCourseFronten/root/test/preview",
            type:"post",
            data:form,
            cache:false,
            processData : false,
            //必须false才会自动加上正确的Content-Type
            contentType : false ,
            dataType:'json',
            beforeSend: function(){
                qa = null;
                $('#test_preview_show').html('<div style="text-align:center; width:100%;"><img style="height: 80px;" src="/OnlineCourseFronten/static/staticWEB/img/box.gif"></div>');
            },
            success:function(data){
                qa=data;
                var html = '';
                $.each( data, function(index1, questions){
                    if (questions.type=='单选题'){
                        html += '<h><b>单选题</b>(共'+questions.score+'分)</h>';
                    } else if (questions.type=='多选题'){
                        html += '<h><b>多选题</b>(共'+questions.score+'分)</h>';
                    } else if (questions.type=='判断题'){
                        html += '<h><b>判断题</b>(共'+questions.score+'分)</h>';
                    }
                    $.each( questions.questions, function(index2, question){
                        html += '<p>'+question.question+'</p>';
                        html += '<p>';
                        $.each( question.item, function(index3, option){
                            html += '<span style="margin-right: 30px;">'+index3+'. '+option+'</span>';
                        });
                        html += '</p>';
                        html += '<p>答案:'+question.answer+'</p>';
                        html += '<p style="color: #c81414">解析:'+question.explains+'</p><br>';
                    });
                });
                $('#test_preview_show').html(html);
            },
            error:function(e){
                qa = null;
                alert('上传失败或试题格式不正确');
                $('#test_preview_show').html('');
            }
        });
    });
    /*** end:小测预览 ***/

    /*** start: 小测提交 ***/
    $('#test_btn-success-section').on('click',function () {
        if($('#test_section_course_id').val()==''){
            alert('请先选择课程');
            return false;
        }
        if($('#test_parent_id').val()==''){
            alert('请先选择章');
            return false;
        }
        //因为与移动端逻辑同步，注释测方法
//        if($('#test_section_index').val()==''){
//            alert('请先填写节号');
//            return false;
//        }
        if($('#test_section_name').val()==''){
            alert('请先填写测试名称');
            return false;
        }
        if(qa==null){
            alert('请先上传');
            return false;
        }


        //上传
        var form = new FormData(document.getElementById("testsection"));
        $.ajax({
            url: "/OnlineCourseFronten/root/test/create",
            type: "post",
            data: form,
            cache:false,
            processData : false,
            //必须false才会自动加上正确的Content-Type
            contentType : false,
            dataType: false,
            success: function (data) {
                alert('小测创建成功');
                $('#testsection')[0].reset();
                $('#test_preview_show').html('');
            },
            error: function (e) {
                alert('小测创建失败');
            }
        });
    });
    /*** end: 小测提交 ***/
</script>
</body>
</html>
