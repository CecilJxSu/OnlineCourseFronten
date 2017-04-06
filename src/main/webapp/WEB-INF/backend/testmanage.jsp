<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="renderer" content="webkit">
    <title>testmanage</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/backend/css/bootstrap/bootstrap.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/backend/css/course/course.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/backend/css/datatables/datatables.css">
</head>
<body>
<%--内容--%>
<div class="content">
    <%--学习记录--%>
    <div class="page-header">
        <h1 class="title">小测管理</h1>
    </div>
    <%--学习记录end--%>
    <%--学习记录内容--%>
    <div class="panel-body" style="padding-bottom:30px;">
        <div role="tabpanel">
            <ul class="nav nav-tabs tabcolor5-bg" role="tablist">
                <li role="presentation" class="active">
                    <a href="#home10" aria-controls="home10" role="tab" data-toggle="tab" aria-expanded="true"
                       class="active">小测管理</a>
                </li>
            </ul>
            <div class="tab-content">
                <%--学习记录--%>
                <div role="tabpanel" class="tab-pane active" id="home10">
                    <div class="container-padding">
                        <%--查询条件--%>
                        <form class="form-horizontal">
                            <div class="managediv">
                                <label>课程:</label>
                                <select class="learnselect form-control" name="course_id" id="section_course_id">
                                    <option value ="">请选择课程</option>
                                    <c:forEach var="course" items="${courses}">
                                        <option value ="<c:out value="${course.id}"/>"><c:out value="${course.name}"/></option>
                                    </c:forEach>
                                </select>
                                <label>章:</label>
                                <select class="learnselect form-control" name="parent_id" id="parent_id">
                                    <option value="">请选择章</option>
                                </select>
                                <input class="manageinput btn btn-success" type="button" value="查询" onclick="main()">
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
                                                <th class="sorting_asc"  style="text-align:center;">名称</th>
                                                <th class="sorting"  style="text-align:center;">创建日期</th>
                                                <th class="sorting"  style="text-align:center;">总分</th>
                                                <th class="sorting"  style="text-align:center;">操作</th>
                                            </tr>
                                        </thead>
                                        <tbody class="comment-course-list">
                                        </tbody>
                                    </table>
                                    <%--<div class="dataTables_paginate paging_full_numbers page" id="example0_paginate">--%>
                                    <%--</div>--%>
                                </div>


                            </div>
                        </div>
                        <%--显示查询内容end--%>
                    </div>
                </div>
                <%--学习记录--%>
            </div>


        </div>

    </div>
    <%--学习记录内容end--%>
</div>
<%--内容--%>
<!--加载js-->
<script src="${pageContext.request.contextPath}/static/backend/js/jquery-1.11.2.min.js"></script>
<script src="${pageContext.request.contextPath}/static/backend/js/bootstrap/bootstrap.min.js"></script>
<script>
    $('#section_course_id').change(function () {
        //获取章
        $.ajax({
            url: "/OnlineCourseFronten/root/catalog/chapter/get",
            type: "post",
            data: {
                course_id: $('#section_course_id').val()
            },
            cache: false,
            dataType: 'json',
            success: function (data) {
                var html = '';
                $.each(data, function (index, content) {
                    html += '<option value ="' + content.id + '">第' + content.index + '章 ' + content.name + '</option>';
                });
                $('#parent_id').html(html);
                getSection();
            },
            error: function (e) {
                $('#parent_id').html('<option value ="">请选择章</option>');
            }
        });
    });
    /************** start：分页列表***********/
    //默认当前页(不可动)
    var nowPage = 1;
    //默认最大页数(不可动)
    var maxPage = 1;

    //ajax入口
    function main() {
        var url = '/OnlineCourseFronten/root/test/get';
        var data = {
            catalog_id  :   $('#parent_id').val()
        };
        getData(url,data);
    }

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
//                maxPage = data.totalPage;
//                pageChange();
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
        $.each( data.questions, function(index, content)
        {
            if (index%2==1)
                html += '<tr role="row" class="odd">';
            else
                html += '<tr role="row" class="even">';
            html += '<td style="text-align:center;" class="sorting_1">'+content.name+'</td>';
            html += '<td style="text-align:center;">'+new Date(content.date).Format("yyyy-MM-dd")+'</td>';
            html += '<td style="text-align:center;">'+content.total+'</td>';
            html += '<td style="text-align:center;">';
            html += '<a class="btn btn-info" href="/OnlineCourseFronten/test/show?id='+content.id+'">查看</a> ';
            html += '<a class="btn btn-danger" onclick="deleteC(this)" data-id="'+content.id+'">删除</a>';
            html += '</td></tr>';
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

    /**
     * 删除小测
     */
    function deleteC(e) {
        if(confirm("确定删除该测试？")){
            $.ajax({
                url:'/OnlineCourseFronten/root/test/delete',//路径
                type:'post',
                cache:false,
                dataType:false,
                data:{
                    id : $(e).attr('data-id')
                },
                success:function (data) {
                    alert("删除成功");
                    main();
                },
                error:function (e) {
                    alert("删除失败！");
                }
            });
        }
    }
</script>
</body>
</html>
