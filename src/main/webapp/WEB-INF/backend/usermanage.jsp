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
                                <select id="userstatus" class="cmi form-control">
                                    <option></option>
                                    <option value="student">学生</option>
                                    <option value="teacher">老师</option>
                                    <option value="admin">管理员</option>
                                </select>
                                <label>账号:</label>
                                <input id="zhanghao" type="text" class="userinput form-control"  >
                                <input id="find" class="manageinput btn btn-success" type="button" value="查询">
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
                                        <tbody class="comment-user-list">
                                        </tbody>
                                    </table>
                                    <%--页数显示--%>
                                    <div class="dataTables_paginate paging_full_numbers page" id="example0_paginate"></div>
                                    <%--页数显示end--%>
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
                <form id="modifyfrom" action="/OnlineCourseFronten/root/user/manage/modify" method="post">
                    <input id="userId" type="hidden" name="userId" value=""/>
                    <div class="zhanghao">
                        账号：<span id="username"></span>
                    </div>
                    <div class="modifydiv">
                        <span>用户角色：</span>
                        <label class="mo checkbox-inline">
                            <input type="radio" id="student" name="userStatus" value="student">学生
                        </label>
                        <label class="mo checkbox-inline">
                            <input type="radio" id="teacher" name="userStatus" value="teacher">老师
                        </label>
                        <label class="mo checkbox-inline">
                            <input type="radio" id="admin" name="userStatus" value="admin">管理员
                        </label>
                    </div>
                    <div class="modifydiv">
                        <span style="margin-left: 40px;">状态：</span>
                        <label class="sta mo checkbox-inline">
                            <input type="radio" id="active" name="status" value="active" >正常
                        </label>
                        <label class="sta mo checkbox-inline">
                            <input id="lock" type="radio" name="status" value="lock">封号
                        </label>
                        <label class="sta mo checkbox-inline">
                            <input  id="dead" type="radio" name="status" value="dead">永久封号
                        </label>
                    </div>
                    <div id="locktime" class="has-error modifydiv" style="display:none;">
                        <span>封号时间：</span><input id="lockdate" type="date" name="locktime"><label id="dangqian" class="checkbox-inline" style="display: none;">时间不能为空且时间要大于当前时间！</label>
                    </div>
                    <div class="modal-footer" style="border-top:none;">
                        <button type="button" class="btn btn-default" onclick="check()">提交</button>
                    </div>
                </form>
            </div>

            <%--提交内容--%>
        </div>
    </div>
</div>
<%--修改用户权限end--%>
<%--内容--%>
<%--判断是否修改成功--%>
<div>
    <input id="update" type="hidden" value="${update}">
</div>
<%--判断是否修改成功--%>
<!--加载js-->
<script src="${pageContext.request.contextPath}/static/backend/js/jquery-1.11.2.min.js"></script>
<script src="${pageContext.request.contextPath}/static/backend/js/bootstrap/bootstrap.min.js"></script>
<script type="text/javascript">
    /*修改提交*/
    function check(obj) {
        var lockdate= $('#lock').prop('checked');
        if(lockdate){
            var lockdate = $('#lockdate').val();
            var date = new Date();//获取当前时间
            var now = date.getFullYear()+"-"+(date.getMonth()+1)+"-"+date.getDate();
            var start = new Date(lockdate.replace("-", "/"));//获取封号时间
            var end   = new Date(now.replace("-", "/"));//获取当前时间
            if(start<=end||lockdate==""||lockdate==null){
                $('#dangqian').css('display','block');
                return false;
            }else {
                $('#dangqian').css('display','none');
            }
        }
        $("#modifyfrom").submit();
    }
    /*修改提交end*/
    /*判断修改是否成功*/
    function update() {
        var update = $("#update").val();
        if (update == "updatefail") {
            alert("修改失败，请重新操作！");
        }
        if (update == "updatesuccess") {
            alert("修改成功！");
        }
    }
    /*判断修改是否成功end*/
    /*修改用户权限*/
    function  modify(obj,userid) {
        var $this = $(obj);
        $('#userId').attr('value',userid);//赋值
        var username =$this.parent('td').parent('tr').find('td:eq(0)').text();
        var status =$this.parent('td').parent('tr').find('td:eq(1)').text();
        var userstatus =$this.parent('td').parent('tr').find('td:eq(3)').text();
        $('#username').html(username);

        switch (userstatus){
            case '学生': $('#admin').removeProp('checked');$('#teacher').removeProp('checked');$('#student').prop('checked','checked');break;
            case '老师': $('#admin').removeProp('checked');$('#student').removeProp('checked');$('#teacher').prop('checked','checked');break;
            case '管理员': $('#student').removeProp('checked');$('#teacher').removeProp('checked');$('#admin').attr('checked','checked');break;
        }
        switch (status){
            case '正常': $('#dead').removeProp('checked');$('#lock').removeProp('checked');$('#active').prop('checked','checked');break;
            case '封号': $('#active').removeProp('checked');$('#dead').removeProp('checked');$('#lock').prop('checked','checked');break;
            case '永久封号': $('#active').removeProp('checked');$('#lock').removeProp('checked');$('#dead').prop('checked','checked');break;
        }
        if(status=='封号'){
            var lockenddate=$this.parent('td').parent('tr').find('td:eq(1)').attr('data-id');
            $('#lockdate').attr('value',lockenddate);
            $('#locktime').css('display','block');

        }else {
            $('#lockdate').attr('value','');
            $('#locktime').css('display','none');
        }
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
    /*点击查询*/
    $('#find').on('click',function () {
        nowPage = 1;
        main();
    });
    /*点击查询end*/
    /************** start：分页列表***********/
            //默认当前页(不可动)
    var nowPage = 1;
    //默认最大页数(不可动)
    var maxPage = 1;

    //ajax入口
    function main() {
        var url = '/OnlineCourseFronten/root/user/manage/get';
        var data = {
            nowPage : nowPage,
            userstatus:$('#userstatus').val(),
            username:$('#zhanghao').val(),
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
                update();
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
        $.each( data.users, function(index, content)
        {
            if (index%2==1)
                html += '<tr role="row" class="odd">';
            else
                html += '<tr role="row" class="even">';
                html+='<td class="sorting_1">'+content.username+'</td>';
                switch (content.status){
                case 'active': statu='正常'; break;
                case 'lock': statu='封号',data=content.lockEndDate; break;
                case 'dead': statu='永久封号'; break;
                }
                if(content.status=='lock'){
                    html+='<td data-id="'+new Date(data).Format("yyyy-MM-dd")+'">'+statu+'</td>';
                }else {
                    html+='<td>'+statu+'</td>';
                }
                html+='<td>'+content.date+'</td>';
                switch (content.userStatus){
                case 'student': userstatu='学生'; break;
                case 'teacher': userstatu='老师'; break;
                case 'admin': userstatu='管理员'; break;
                }
                html+='<td>'+userstatu+'</td>';
                html+='<td> <a class="btn btn-info" data-toggle="modal" data-target="#modify" onclick="modify(this,'+content.id+')">修改</a></td>';
                html+='</tr>';
        });
        $('.comment-user-list').html(html);
    }


    //错误回掉
    function errBack() {
        $('.comment-user-list').html('<div style="text-align:center; width:100%;">暂无数据</div>');
    }

    //发送前触发
    function beforeSend() {
        $('.comment-user-list').html('<div style="text-align:center; width:100%;"><img style="height: 80px;" src="/OnlineCourseFronten/static/staticWEB/img/box.gif"></div>');
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
     * 时间对象的格式化end;
     */
</script>
</body>
</html>
