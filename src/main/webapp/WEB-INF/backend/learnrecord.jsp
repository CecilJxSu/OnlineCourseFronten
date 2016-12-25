<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="renderer" content="webkit">
    <title>learnrecord</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/backend/css/bootstrap/bootstrap.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/backend/css/course/course.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/backend/css/datatables/datatables.css">
</head>
<body>
<%--内容--%>
<div class="content">
    <%--学习记录--%>
    <div class="page-header">
        <h1 class="title">学习记录</h1>
    </div>
    <%--学习记录end--%>
    <%--学习记录内容--%>
    <div class="panel-body" style="padding-bottom:30px;">
        <div role="tabpanel">
            <ul class="nav nav-tabs tabcolor5-bg" role="tablist">
                <li role="presentation" class="active">
                    <a href="#home10" aria-controls="home10" role="tab" data-toggle="tab" aria-expanded="true"
                       class="active">学习记录</a>
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
                                <select class="learnselect form-control">
                                    <option value="1">course1</option>
                                    <option value="2">course2</option>
                                    <option value="3">sourse3</option>
                                    <option value="4">course4</option>
                                </select>
                                <label>章:</label>
                                <select class="learnselect form-control">
                                    <option value="1">catalog1</option>
                                    <option value="2">catalog2</option>
                                    <option value="3">catalog3</option>
                                    <option value="4">catalog4</option>
                                </select>
                                <label>节:</label>
                                <select class="learnselect form-control">
                                    <option value="1">section1</option>
                                    <option value="2">section2</option>
                                    <option value="3">section3</option>
                                    <option value="4">section4</option>
                                </select>
                                <input class="manageinput btn btn-success" type="button" value="查询">
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
                                            <th class="sorting_asc"  style="width: 101px;">账号</th>
                                            <th class="sorting"  style="width: 212px;">系别</th>
                                            <th class="sorting"  style="width: 207px;">专业</th>
                                            <th class="sorting"  style="width: 157px;">学习进度</th>
                                        </tr>
                                        </thead>
                                        <tbody>
                                        <tr role="row" class="odd">
                                            <td class="sorting_1">P293</td>
                                            <td>10.86%</td>
                                            <td>66</td>
                                            <td>
                                                <div class="progress">
                                                    <div class="progress-bar" style="width: 85%;">
                                                        <span>85%</span>
                                                    </div>
                                                </div>
                                            </td>
                                        </tr>
                                        <tr role="row" class="even">
                                            <td class="sorting_1">P309</td>
                                            <td>3.62%</td>
                                            <td>22</td>
                                            <td>
                                                <div class="progress">
                                                    <div class="progress-bar" style="width: 25%;">
                                                        <span>25%</span>
                                                    </div>
                                                </div>
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
                <%--学习记录--%>
            </div>


        </div>

    </div>
    <%--学习记录内容end--%>
</div>
<%--内容--%>
</body>
</html>
