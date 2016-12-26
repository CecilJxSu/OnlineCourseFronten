<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="renderer" content="webkit">
    <title>catalogmanage</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/backend/css/bootstrap/bootstrap.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/backend/css/course/course.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/backend/css/datatables/datatables.css">
</head>
<body>
<%--内容--%>
<div class="content">
    <%--课程管理--%>
    <div class="page-header">
        <h1 class="title">课程管理</h1>
    </div>
    <%--课程管理end--%>
    <%--管理内容--%>
    <div class="panel-body" style="padding-bottom:30px;">

        <div role="tabpanel">


            <ul class="nav nav-tabs tabcolor5-bg" role="tablist">
                <li role="presentation" class="">
                    <a  href="${pageContext.request.contextPath}/root/course/manage/show" class="" aria-expanded="false">课程管理</a>
                </li>
                <li role="presentation" class="active">
                    <a href="#home10" aria-controls="home10" role="tab" data-toggle="tab" aria-expanded="true" class="active">章管理</a>
                </li>
            </ul>


            <div class="tab-content">
                <%--课程管理--%>
                <div role="tabpanel" class="tab-pane active" id="home10">
                    <div class="container-padding">
                        <%--显示查询内容--%>
                        <div class="panel">
                            <div class="panel-body table-responsive">
                                <div id="example0_wrapper" class="manage dataTables_wrapper no-footer" style="overflow: hidden">
                                    <table id="example0" data-id="<c:out value='${courseId}'/>" class="table display dataTable no-footer" role="grid" aria-describedby="example0_info" >
                                        <thead>
                                            <tr role="row">
                                                <th class="sorting_asc"  style="width: 101px;text-align:center;">章号</th>
                                                <th class="sorting"  style="width: 212px;text-align:center;">章名称</th>
                                                <th class="sorting"  style="width: 207px;text-align:center;">章简介</th>
                                                <th class="sorting"  style="width: 157px;text-align:center;">操作</th>
                                            </tr>
                                        </thead>
                                        <tbody class="comment-course-list">
                                        </tbody>
                                    </table>
                                    <div class="dataTables_paginate paging_full_numbers page" id="example0_paginate">
                                    </div>
                                </div>


                            </div>
                        </div>
                        <%--显示查询内容end--%>
                    </div>
                </div>
                <%--课程管理--%>
            </div>


        </div>

    </div>
    <%--管理内容end--%>
</div>
<%--内容--%>
<!--加载js-->
<script src="${pageContext.request.contextPath}/static/backend/js/jquery-1.11.2.min.js"></script>
<script src="${pageContext.request.contextPath}/static/backend/js/bootstrap/bootstrap.min.js"></script>
<script>
    /************** start：分页列表***********/
            //默认当前页(不可动)
    var nowPage = 1;
    //默认最大页数(不可动)
    var maxPage = 1;

    //ajax入口
    function main() {
        var url = '/OnlineCourseFronten/root/catalog/manage/get';
        var data = {
            nowPage : nowPage,
            id      :   $('#example0').attr('data-id')
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
        $.each( data.catalogs, function(index, content)
        {
            if (index%2==1)
                html += '<tr role="row" class="odd">';
            else
                html += '<tr role="row" class="even">';
            html += '<td style="text-align:center;" class="sorting_1"><a href="/OnlineCourseFronten/root/catalog/section/show?id='+content.id+'">第'+content.index+'章</a></td>';
            html += '<td style="text-align:center;">'+content.name+'</td>';
            html += '<td style="text-align:center;">'+content.introduction+'</td>';
            html += '<td style="text-align:center;">';
            html += '<a class="btn btn-info" href="/OnlineCourseFronten/root/course/modify/show?id='+content.id+'">修改</a> ';
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
     * 删除章
     */
    function deleteC(e) {
        if(confirm("删除该章的同时会删除其下所有节及节资源，且一经删除，不可恢复\n确定删除该章？")){
            $.ajax({
                url:'/OnlineCourseFronten/root/catalog/delete',//路径
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
