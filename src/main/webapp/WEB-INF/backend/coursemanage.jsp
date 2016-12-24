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
    <%--资源管理--%>
    <div class="page-header">
        <h1 class="title">课程管理</h1>
    </div>
    <%--资源管理end--%>
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
                                <input type="text" id="course" name="course" class="cmi form-control"  >
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
                                            <th class="sorting" style="width: 130px;">转化率</th>
                                        </tr>
                                        </thead>
                                        <tbody>


                                        <tr role="row" class="odd">
                                            <td class="sorting_1">P293</td>
                                            <td>10.86%</td>
                                            <td>66</td>
                                            <td>1.92</td>
                                            <td>6.38%</td>
                                        </tr>
                                        <tr role="row" class="even">
                                            <td class="sorting_1">P309</td>
                                            <td>3.62%</td>
                                            <td>22</td>
                                            <td>6.92</td>
                                            <td>3.98</td>
                                        </tr>
                                        <tr role="row" class="odd">
                                            <td class="sorting_1">P483</td>
                                            <td>6.27%</td>
                                            <td>22</td>
                                            <td>3.98</td>
                                            <td>4.38%</td>
                                        </tr>
                                        <tr role="row" class="even">
                                            <td class="sorting_1">P683</td>
                                            <td>8.28%</td>
                                            <td>22</td>
                                            <td>3.01</td>
                                            <td>4.74%</td>
                                        </tr>
                                        <tr role="row" class="odd">
                                            <td class="sorting_1">P832</td>
                                            <td>12.86%</td>
                                            <td>41.21</td>
                                            <td>1.23</td>
                                            <td>8.42%</td>
                                        </tr>
                                        </tbody>
                                    </table>
                                    <div class="dataTables_info" id="example0_info" role="status" aria-live="polite">
                                        总共1页，显示第1 到第 5 ，筛选之后得到 5 条，初始5 条
                                    </div>
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
