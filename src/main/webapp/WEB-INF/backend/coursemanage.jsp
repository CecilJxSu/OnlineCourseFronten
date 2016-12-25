<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="renderer" content="webkit">
    <title>coursemanage</title>
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
                <li role="presentation" class="active">
                    <a href="#home10" aria-controls="home10" role="tab" data-toggle="tab" aria-expanded="true"
                       class="active">课程管理</a>
                </li>
            </ul>


            <div class="tab-content">
                <%--课程管理--%>
                <div role="tabpanel" class="tab-pane active" id="home10">
                    <div class="container-padding">
                        <%--查询条件--%>
                        <form class="form-horizontal">
                            <div class="managediv">
                                <label>课程:</label>
                                <select class="cmi form-control">
                                    <option value="1">course1</option>
                                    <option value="2">course2</option>
                                    <option value="3">sourse3</option>
                                    <option value="4">course4</option>
                                </select>
                                <input class="manageinput btn btn-success" type="button" value="查询">
                            </div>
                        </form>
                        <%--查询条件end--%>
                        <%--显示查询内容--%>
                        <div class="panel">
                            <div class="panel-body table-responsive">
                                <div id="example0_wrapper" class="manage dataTables_wrapper no-footer" style="overflow: hidden">
                                    <table id="example0" class="table display dataTable no-footer" role="grid" aria-describedby="example0_info" >
                                        <thead>
                                        <tr role="row">
                                            <th class="sorting_asc"  style="width: 101px;">课程</th>
                                            <th class="sorting"  style="width: 212px;">状态</th>
                                            <th class="sorting"  style="width: 207px;">创建日期</th>
                                            <th class="sorting"  style="width: 157px;">操作</th>
                                        </tr>
                                        </thead>
                                        <tbody>


                                        <tr role="row" class="odd">
                                            <td class="sorting_1">
                                                <a href="${pageContext.request.contextPath}/root/catalog/manage/show">java</a>
                                            </td>
                                            <td>
                                                草稿
                                            </td>
                                            <td>
                                                2016-12-20 10:51:03
                                            </td>
                                            <td>
                                                <a>发布</a>
                                                <a href="${pageContext.request.contextPath}/root/course/modify/show">修改</a>
                                                <a>删除</a>
                                            </td>
                                        </tr>
                                        <tr role="row" class="even">
                                            <td class="sorting_1">
                                                <a href="${pageContext.request.contextPath}/root/catalog/manage/show">java</a>
                                            </td>
                                            <td>
                                                草稿
                                            </td>
                                            <td>
                                                2016-12-20 10:51:03
                                            </td>
                                            <td>
                                                <a>发布</a>
                                                <a>修改</a>
                                                <a>删除</a>
                                            </td>
                                        </tr>
                                        </tbody>
                                    </table>
                                    <div class="dataTables_paginate paging_full_numbers" id="example0_paginate">
                                        <a class="paginate_button first disabled" aria-controls="example0" data-dt-idx="0" tabindex="0" id="example0_first">第一页</a>
                                        <a class="paginate_button previous disabled" aria-controls="example0" data-dt-idx="1" tabindex="0" id="example0_previous">上一页</a>
                                        <span>
                                        <a class="paginate_button current" aria-controls="example0" data-dt-idx="2" tabindex="0">1</a>
                                    </span>
                                        <a class="paginate_button next disabled" aria-controls="example0" data-dt-idx="3" tabindex="0" id="example0_next">下一页</a>
                                        <a class="paginate_button last disabled" aria-controls="example0" data-dt-idx="4" tabindex="0" id="example0_last">最后</a>
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
</body>
</html>
