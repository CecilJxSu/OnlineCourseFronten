<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="renderer" content="webkit">
    <title>usermanage</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/backend/css/bootstrap/bootstrap.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/backend/css/course/course.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/backend/css/datatables/datatables.css">
</head>
<body>
<%--内容--%>
<div class="content">
    <%--用户管理--%>
    <div class="page-header">
        <h1 class="title">用户管理</h1>
    </div>
    <%--用户管理end--%>
    <%--管理内容--%>
    <div class="panel-body" style="padding-bottom:30px;">

        <div role="tabpanel">


            <ul class="nav nav-tabs tabcolor5-bg" role="tablist">
                <li role="presentation" class="active">
                    <a href="#home10" aria-controls="home10" role="tab" data-toggle="tab" aria-expanded="true"
                       class="active">用户管理</a>
                </li>
            </ul>


            <div class="tab-content">
                <%--用户管理--%>
                <div role="tabpanel" class="tab-pane active" id="home10">
                    <div class="container-padding">
                        <%--查询条件--%>
                        <form class="form-horizontal">
                            <div class="managediv">
                                <label>用户:</label>
                                <select class="cmi form-control">
                                    <option value="1">student</option>
                                    <option value="2">teacher</option>
                                    <option value="3">admin</option>
                                </select>
                                <label>账号:</label>
                                <input type="text" id="chapter_name" name="name" class="userinput form-control"  >
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
                                            <th class="sorting_asc"  style="width: 101px;">账号</th>
                                            <th class="sorting"  style="width: 212px;">状态</th>
                                            <th class="sorting"  style="width: 207px;">注册时间</th>
                                            <th class="sorting"  style="width: 207px;">用户角色</th>
                                            <th class="sorting"  style="width: 157px;">操作</th>
                                        </tr>
                                        </thead>
                                        <tbody>
                                        <tr role="row" class="odd">
                                            <td class="sorting_1">
                                                123456
                                            </td>
                                            <td>
                                                正常
                                            </td>
                                            <td>
                                                2016-12-20 10:51:03
                                            </td>
                                            <td>
                                                老师
                                            </td>
                                            <td>
                                                <a data-toggle="modal" data-target="#modify" onclick="modify(this,'12')">修改</a>
                                            </td>
                                        </tr>
                                        <tr role="row" class="even">
                                            <td class="sorting_1">
                                                109880
                                            </td>
                                            <td>
                                                封号
                                            </td>
                                            <td>
                                                2016-12-20 10:51:03
                                            </td>
                                            <td>
                                                老师
                                            </td>
                                            <td>
                                                <a data-toggle="modal" data-target="#modify" onclick="modify(this,'13')">修改</a>
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
                <%--用户管理--%>
            </div>


        </div>

    </div>
    <%--管理内容end--%>
</div>

<%--修改用户权限--%>
<div class="modal fade" id="modify" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="usercontent modal-content">
            <%--关闭窗口按钮--%>
            <div class="modify modal-header">
                <div class="modifydiv">
                    <h2>修改</h2>
                </div>
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
            </div>
            <%--关闭窗口按钮end--%>
            <%--提交内容--%>
            <div class="modifyfrom">
                <form action="" method="post">
                    <input id="userId" type="hidden" name="userId" value=""/>
                    <div class="zhanghao">
                        账号：<span id="username"></span>
                    </div>
                    <div class="modifydiv">
                        <span>用户角色：</span>
                        <label class="mo checkbox-inline">
                            <input type="radio" name="userStatus" value="student" checked>学生
                        </label>
                        <label class="mo checkbox-inline">
                            <input type="radio" name="userStatus" value="teacher">老师
                        </label>
                        <label class="mo checkbox-inline">
                            <input type="radio" name="userStatus" value="admin">管理员
                        </label>
                    </div>
                    <div class="modifydiv">
                        <span>状态：</span>
                        <label class="sta mo checkbox-inline">
                            <input type="radio" name="status" value="active" checked>正常
                        </label>
                        <label class="sta mo checkbox-inline">
                            <input id="lock" type="radio" name="status" value="lock">封号
                        </label>
                        <label class="sta mo checkbox-inline">
                            <input  type="radio" name="status" value="dead">永久封号
                        </label>
                    </div>
                    <div id="locktime" class="modifydiv" style="display:none;">
                        <span>封号时间：</span><input type="date" name="locktime">
                    </div>
                    <div class="modal-footer" style="border-top:none;">
                        <button type="button" class="btn btn-default">提交</button>
                    </div>
                </form>
            </div>

            <%--提交内容--%>
        </div>
    </div>
</div>
<%--修改用户权限end--%>
<%--内容--%>
<!--加载js-->
<script src="${pageContext.request.contextPath}/static/backend/js/jquery-1.11.2.min.js"></script>
<script src="${pageContext.request.contextPath}/static/backend/js/bootstrap/bootstrap.min.js"></script>
<script type="text/javascript">
    /*修改用户权限*/
    function  modify(obj,userid) {
        var $this = $(obj);
        $('#userId').attr('value',userid);//赋值
        var username =$this.parent('td').parent('tr').find('td:eq(0)').text();
        var state =$this.parent('td').parent('tr').find('td:eq(1)').text();
        $('#username').html(username);
        clickdead();
    }

    function clickdead() {
        $(".sta input").on('click',function () {
            var statu = $(this).val();
            if(statu=='lock'){
                $('#locktime').css('display','block');
            }else {
                $('#locktime').css('display','none');
            }

        })
    }
    /*修改用户权限end*/
</script>
</body>
</html>
