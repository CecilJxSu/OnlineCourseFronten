<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="renderer" content="webkit">
    <title>soursemanage</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/backend/css/bootstrap/bootstrap.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/backend/css/course/course.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/backend/css/datatables/datatables.css">
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
    <div class="panel-body" style="padding-bottom:30px;">

        <div role="tabpanel">


            <ul class="nav nav-tabs tabcolor5-bg" role="tablist">
                <li role="presentation" class="active">
                    <a href="#home10" aria-controls="home10" role="tab" data-toggle="tab" aria-expanded="true"
                       class="active">资源管理</a>
                </li>
            </ul>


            <div class="tab-content">
                <%--资源管理--%>
                <div role="tabpanel" class="tab-pane active" id="home10">
                    <div class="container-padding">
                        <%--查询条件--%>
                        <form class="form-horizontal">
                            <div class="managediv">
                                <label>课程:</label>
                                <select id="course" class="manageselect form-control">
                                    <c:forEach var="course" items="${courses}">
                                        <option value ="<c:out value="${course.id}"/>"><c:out value="${course.name}"/></option>
                                    </c:forEach>
                                </select>
                                <label>资源类型:</label>
                                <select id="type" class="manageselect form-control">
                                    <option value="all">全部</option>
                                    <option value="video">视频</option>
                                    <option value="img">图片</option>
                                    <option value="other">其他</option>
                                </select>
                                <input id="find" class="manageinput btn btn-success" type="button" value="查询">
                            </div>
                        </form>
                        <%--查询条件end--%>
                        <%--显示查询内容--%>
                        <div class="panel">
                            <div class="panel-body table-responsive">
                                <div id="example0_wrapper" class="dataTables_wrapper no-footer" style="overflow: hidden">
                                    <table id="example0" class="table display dataTable no-footer" role="grid" aria-describedby="example0_info" >
                                        <thead>
                                            <tr role="row">
                                                <th class="sorting_asc"  style="width: 101px;">文件名</th>
                                                <th class="sorting"  style="width: 212px;">创建日期</th>
                                                <th class="sorting"  style="width: 207px;">文件大小</th>
                                                <th class="sorting"  style="width: 157px;">文件url</th>
                                                <th class="sorting" style="width: 130px;">操作</th>
                                            </tr>
                                        </thead>
                                        <tbody class="comment-course-list">
                                        </tbody>
                                    </table>
                                    <div class="dataTables_info" id="example0_info" role="status" aria-live="polite">
                                    </div>
                                    <div class="dataTables_paginate paging_full_numbers page" id="example0_paginate">

                                    </div>
                                </div>


                            </div>
                        </div>
                        <%--显示查询内容end--%>
                    </div>
                </div>
                <%--资源管理--%>
            </div>


        </div>

    </div>
    <%--管理内容end--%>
</div>
<%--内容--%>
<script src="${pageContext.request.contextPath}/static/backend/js/jquery-1.11.2.min.js"></script>
<script src="${pageContext.request.contextPath}/static/backend/js/bootstrap/bootstrap.min.js"></script>
<script>
    $('#find').on('click',function () {
        nowPage = 1;
        main();
    });
    /************** start：分页列表***********/
//默认当前页(不可动)
    var nowPage = 1;
    //默认最大页数(不可动)
    var maxPage = 1;

    //ajax入口
    function main() {
        var url = '/OnlineCourseFronten/root/document/manage/get';
        var data = {
            nowPage   :nowPage,
            course    :$('#course').val(),
            type      :$('#type').val()
        };
        getData(url,data);
    }

    //页面加载完成时触发
    $(function () {
        main();
    });

    //ajax(不可动)
    function getData(url,data){
        $.ajax({
            url:url,//路径
            type:'post',
            cache:false,
            dataType:'json',
            data:data,
            beforeSend: function(){
                beforeSend();
            },
            success:function (data) {
                maxPage = data.totalPage;
                pageChange();
                jsonToHtml(data);
            },
            error:function (e) {
                errBack();
            }
        });
    }

    //分页(不可动)
    function pageChange() {
        var pageHtml = '';
        //设置首页、上一页
        if (nowPage == 1){
            pageHtml += '<span class="paginate_button first disabled">首页</span>';
            pageHtml += '<span class="paginate_button previous disabled">上一页</span>';
        } else {
            pageHtml += '<a id="first-page" class="paginate_button first" href="javascript:void(0)">首页</a>';
            pageHtml += '<a id="previous-page" class="paginate_button previous" href="javascript:void(0)">上一页</a>';
        }
        //设置数字页
        for (var i=1;i<=maxPage;i++){
            if (i == nowPage){
                pageHtml += '<a class="paginate_button current disabled" href="javascript:void(0)">'+i+'</a>';
            } else {
                pageHtml += '<a class="paginate_button current page-num" href="javascript:void(0)">'+i+'</a>';
            }
        }
        //设置下一页、尾页
        if (nowPage == maxPage){
            pageHtml += '<span class="paginate_button next disabled">下一页</span>';
            pageHtml += '<span class="paginate_button last disabled">尾页</span>';
        } else {
            pageHtml += '<a id="next-page" class="paginate_button next" href="javascript:void(0)">下一页</a>';
            pageHtml += '<a id="last-page" class="paginate_button last" href="javascript:void(0)">尾页</a>';
        }
        //替换进分页div
        $('.page').html(pageHtml);

        //分页数字按钮监听
        $('.page-num').on('click',function () {
            nowPage = $(this).html();
            //触发ajax
            main();
        });

        //首页触发
        $('#first-page').on('click',function () {
            nowPage = 1;
            //触发ajax
            main();
        });
        //尾页触发
        $('#last-page').on('click',function () {
            nowPage = maxPage;
            //触发ajax
            main();
        });
        //上一页触发
        $('#previous-page').on('click',function () {
            if (nowPage-1>0){
                nowPage--;
                //触发ajax
                main();
            } else {
                return false;
            }
        });
        //下一页触发
        $('#next-page').on('click',function () {
            if (nowPage+1<=maxPage){
                nowPage++;
                //触发ajax
                main();
            } else {
                return false;
            }
        });
    }

    //将回传的数据转成html，放进相应位置(自己实现)
    function jsonToHtml(data) {
        var html = '';
        $.each( data.documents, function(index, content)
        {
            if (index%2==1)
                html += '<tr role="row" class="odd">';
            else
                html += '<tr role="row" class="even">';
            html += '<td class="sorting_1">'+content.name+'</td>';
            html += '<td>'+new Date(content.date).Format("yyyy-MM-dd")+'</td>';
            if (content.size/1024>1204)
                html += '<td>'+Number(content.size/1024/1024).toFixed(2)+'MB</td>';
            else
                html += '<td>'+Number(content.size/1024).toFixed(2)+'KB</td>';
            html += '<td>'+content.url+'</td>';
            html += '<td><a class="btn btn-danger delete" data-id="'+content.id+'" onclick="deleteD(this)">删除</a></td>';
            html += '</tr>';
        });
        $('.comment-course-list').html(html);
    }


    //错误回掉
    function errBack() {
        $('.comment-course-list').html('<div style="text-align:center; width:100%;">暂无数据</div>');
    }

    //发送前触发
    function beforeSend() {
        $('.comment-course-list').html('<div style="text-align:center; width:100%;"><img style="height: 80px;" src="/OnlineCourseFronten/static/staticWEB/img/box.gif"></div>');
    }
    /************** end：分页列表***********/

    /**
     * 删除资源
     */
    function deleteD(e){
        if(confirm("会同时删除节下的同一资源，且一经删除，不可恢复！\n确定删除该资源？")){
            $.ajax({
                url:'/OnlineCourseFronten/root/document/manage/delete',//路径
                type:'post',
                cache:false,
                dataType:false,
                data:{
                    id : $(e).attr('data-id')
                },
                success:function (data) {
                    alert("成功");
                    main();
                },
                error:function (e) {
                    alert("删除失败！");
                }
            });
        }
    }

    /**
     * 时间对象的格式化;
     */
    Date.prototype.Format = function (fmt) { //author: meizz
        var o = {
            "M+": this.getMonth() + 1, //月份
            "d+": this.getDate(), //日
            "h+": this.getHours(), //小时
            "m+": this.getMinutes(), //分
            "s+": this.getSeconds(), //秒
            "q+": Math.floor((this.getMonth() + 3) / 3), //季度
            "S": this.getMilliseconds() //毫秒
        };
        if (/(y+)/.test(fmt)) fmt = fmt.replace(RegExp.$1, (this.getFullYear() + "").substr(4 - RegExp.$1.length));
        for (var k in o)
            if (new RegExp("(" + k + ")").test(fmt)) fmt = fmt.replace(RegExp.$1, (RegExp.$1.length == 1) ? (o[k]) : (("00" + o[k]).substr(("" + o[k]).length)));
        return fmt;
    }
</script>
</body>
</html>
