<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="renderer" content="webkit">
    <link href="${pageContext.request.contextPath}/static/public/css/setprofile/base.css" rel="stylesheet"/>
    <link href="${pageContext.request.contextPath}/static/public/css/setprofile/common.css" rel="stylesheet"/>
    <link href="${pageContext.request.contextPath}/static/public/css/setprofile/setprofile.css" rel="stylesheet"/>
    <title>个人设置</title>
</head>
<body>
<%--头部--%>
<jsp:include page="include/header.jsp"></jsp:include>
<%--头部end--%>
<!--内容-->
<div id="main">
    <div class="page-settings">
        <div class="top">
            <div class="w960 mauto top_title">
                <p>个人设置</p>
            </div>
        </div>
        <div class="setting pb10" style="height: 900px;">
            <div class="nav-tabs pa">
                <div id="info" class="baseinfo fl active">基本信息</div>
                <div id="modify" href="#" class="countinfo fl ">修改密码</div>
                <!--<a href="/user/address" class="countinfo fl">收货地址</a>
                <a href="/user/authenticate" class="countinfo fl">实名认证</a>-->
                <div class="cb"></div>
            </div>
            <%--基本信息--%>
            <div id="personinfo" class="contentBox">
                <div class="formBox">
                    <div id="setting-profile" class="setting-wrap setting-profile">

                        <form id="profile">
                            <div class="wlfg-wrap clearfix ">
                                <label class="label-name">头像：</label>
                                <div  class="rlf-group">
                                    <div id="preview">
                                        <c:if test="${profile.iconUrl!=null}">
                                            <img id="imghead" class="fl avator-img" id="js-portrait" src="/OnlineCourseFronten/file/get?url=<c:out value='${profile.iconUrl}'/>" data-portrait="552133900001743101800180" width="180" height="180">
                                        </c:if>
                                        <c:if test="${profile.iconUrl==null}">
                                            <img id="imghead" class="fl avator-img" id="js-portrait" src="/OnlineCourseFronten/static/staticWEB/img/default.png" data-portrait="552133900001743101800180" width="180" height="180">
                                        </c:if>
                                    </div>
                                    <div class="fl ml20 pr">
                                        <div><input type="button" hidefocus="true"  class="js-avator-try"></div>
                                        <div id="avator-btns" class="avator-btn-inner">
                                            <div class="avator-btn-wrap">
                                                <%--<form target="uploadtarget" action="postpic" method="post" enctype="multipart/form-data">--%>
                                                    <a href="javascript:void(0)" hidefocus="true" class="avator-btn-fake">上传头像</a>
                                                    <input class="hide" type="file" title="上传头像" name="fileField" id="upload" accept="image/*">
                                                    <%--<input class="hide" type="hidden" name="type" value="1">--%>
                                                <%--</form>--%>
                                                <%--<input type="file" title="上传头像" name="fileField" id="upload" onchange="previewImage(this)">--%>
                                                <%--<iframe src="about:blank" id="uploadtarget" name="uploadtarget" frameborder="0" style="display:none;"></iframe>--%>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="cb"></div>
                                    <p class="rlf-tip-wrap">25KB以内的图片</p>
                                    <p id="pic-error" class="rlf-tip-wrap errorHint color-red"></p>
                                </div>
                            </div>

                            <div class="wlfg-wrap clearfix">
                                <label class="label-name"><span class="color-red">* </span>学工号：</label>
                                <div class="rlf-group">
                                    <input type="number" name="universityId" id="universityId" autocomplete="off" data-validate="require-nick" class="moco-form-control" value="<c:out value='${profile.universityId}'/>" placeholder="请输入学工号">
                                    <p class="rlf-tip-wrap errorHint color-red"></p>
                                </div>
                            </div>

                            <div class="wlfg-wrap clearfix">
                                <label class="label-name"><span class="color-red">* </span>昵称：</label>
                                <div class="rlf-group">
                                    <input type="text" name="nickname" id="nickname" autocomplete="off" data-validate="require-nick" class="moco-form-control" value="<c:out value='${profile.nickname}'/>" placeholder="请输入昵称">
                                    <p class="rlf-tip-wrap errorHint color-red"></p>
                                </div>
                            </div>

                            <div class="wlfg-wrap clearfix">
                                <label class="label-name">真实姓名：</label>
                                <div class="rlf-group">
                                    <input type="text" name="realname" id="realname" autocomplete="off" data-validate="require-nick" class="moco-form-control" value="<c:out value='${profile.realname}'/>" placeholder="请输入真实姓名">
                                    <p class="rlf-tip-wrap errorHint color-red"></p>
                                </div>
                            </div>

                            <div class="wlfg-wrap clearfix">
                                <label class="label-name h16 lh16">性别：</label>
                                <div class="rlf-group rlf-radio-group">
                                    <c:if test="${profile.gender=='' || profile.gender==null}">
                                        <label class="lh16"><input type="radio" hidefocus="true" value="" checked="checked" name="sex">保密</label>
                                        <label class="lh16"><input type="radio" hidefocus="true" value="男" name="sex">男</label>
                                        <label class="lh16"><input type="radio" hidefocus="true" value="女" name="sex">女</label>
                                    </c:if>
                                    <c:if test="${profile.gender=='男'}">
                                        <label class="lh16"><input type="radio" hidefocus="true" value="" name="sex">保密</label>
                                        <label class="lh16"><input type="radio" hidefocus="true" value="男" checked="checked" name="sex">男</label>
                                        <label class="lh16"><input type="radio" hidefocus="true" value="女" name="sex">女</label>
                                    </c:if>
                                    <c:if test="${profile.gender=='女'}">
                                        <label class="lh16"><input type="radio" hidefocus="true" value="" name="sex">保密</label>
                                        <label class="lh16"><input type="radio" hidefocus="true" value="男" name="sex">男</label>
                                        <label class="lh16"><input type="radio" hidefocus="true" value="女" checked="checked" name="sex">女</label>
                                    </c:if>
                                    <p class="rlf-tip-wrap errorHint color-red"></p>
                                </div>
                            </div>

                            <div class="wlfg-wrap clearfix">
                                <label class="label-name">手机号：</label>
                                <div class="rlf-group">
                                    <input type="number" name="phone" id="phone" autocomplete="off" data-validate="require-nick" class="moco-form-control" value="<c:out value='${profile.phone}'/>" placeholder="请输入手机号">
                                    <p class="rlf-tip-wrap errorHint color-red"></p>
                                </div>
                            </div>

                            <div class="wlfg-wrap clearfix">
                                <label class="label-name">Email：</label>
                                <div class="rlf-group">
                                    <input type="email" name="email" id="email" autocomplete="off" data-validate="require-nick" class="moco-form-control" value="<c:out value='${profile.email}'/>" placeholder="请输入Email">
                                    <p class="rlf-tip-wrap errorHint color-red"></p>
                                </div>
                            </div>

                            <div class="wlfg-wrap clearfix">
                                <label class="label-name">系别：</label>
                                <div class="rlf-group">
                                    <input type="text" name="department" id="department" autocomplete="off" data-validate="require-nick" class="moco-form-control" value="<c:out value='${profile.department}'/>" placeholder="请输入系别">
                                    <p class="rlf-tip-wrap errorHint color-red"></p>
                                </div>
                            </div>

                            <div class="wlfg-wrap clearfix">
                                <label class="label-name">专业方向：</label>
                                <div class="rlf-group">
                                    <input type="text" name="major" id="major" autocomplete="off" data-validate="require-nick" class="moco-form-control" value="<c:out value='${profile.major}'/>" placeholder="请输入专业方向">
                                    <p class="rlf-tip-wrap errorHint color-red"></p>
                                </div>
                            </div>

                            <div class="wlfg-wrap clearfix">
                                <label class="label-name">宿舍地址：</label>
                                <div class="rlf-group">
                                    <input type="text" name="dormitoryAddress" id="dormitoryAddress" autocomplete="off" data-validate="require-nick" class="moco-form-control" value="<c:out value='${profile.dormitoryAddress}'/>" placeholder="请输入宿舍地址">
                                    <p class="rlf-tip-wrap errorHint color-red"></p>
                                </div>
                            </div>

                            <div class="wlfg-wrap clearfix">
                                <label class="label-name"></label>
                                <div class="rlf-group">
                                    <a id="profile-submit" hidefocus="true" aria-role="button" class="rlf-btn-green btn-block profile-btn">保存</a>
                                </div>
                            </div>

                        </form>

                    </div>
                </div>
            </div>
            <%--基本信息--%>
            <%--修改密码--%>
            <div id="modifypassword" class="contentBox hide">
                <div class="changePasswordForm">
                    <div class="formItems clearfix">
                        <label>原始密码：</label>
                        <div class="inputText">
                            <input type="password" id="sourcePassword" maxlength="16" itemtype="sourcePassword" placeholder="请输入原始密码"/>
                            <p class="color-red"></p>
                        </div>
                    </div>
                    <div class="formItems clearfix">
                        <label>新密码：</label>
                        <div class="inputText">
                            <input type="password" id="newPassword" maxlength="16" itemtype="newPassword" placeholder="请输入新密码"/>
                            <p class="color-red"></p>
                        </div>
                    </div>
                    <div class="formItems clearfix">
                        <label>确认密码：</label>
                        <div class="inputText">
                            <input type="password" id="againPassword" maxlength="16" itemtype="againPassword" placeholder="请输入确认密码"/>
                            <p class="color-red"></p>
                        </div>
                    </div>
                    <p id="errorTip" class="color-red"></p>
                    <p class="passwordTip">密码由8-20位,字母、数字、下划线组成</p>
                    <div class="formBtn">
                        <input type="button" style="height: 40px;" value="修改密码" class="gradientColor" onclick="sureChange()">
                    </div>
                    <!-- 密码修改成功弹窗-->
                    <div id="change-success" class=" white_content popupBg changeSuccessPopup" >
                        <div class="changeSuccess popupBox" style="margin-left: 36%;margin-top: 17%;">
                            <p>您的密码已经修改成功！</p>
                            <p><span id="count-down"></span>s后跳转到首页，请重新登录</p>
                        </div>
                    </div>
                    <!-- 密码修改成功弹窗 end-->
                </div>
            </div>
            <%--修改密码end--%>
        </div>
</div>
</div>
<!--内容end-->
<%--尾部--%>
<jsp:include page="include/footer.jsp"></jsp:include>
<%--尾部end--%>
<script src="${pageContext.request.contextPath}/static/public/js/jquery-1.11.2.min.js"></script>
<script src="${pageContext.request.contextPath}/static/public/js/setprofile/uploadpicture.js"></script>
<script type="text/javascript">
    /*修改密码成功弹窗*/
    function ShowDiv(show_div) {
        document.getElementById(show_div).style.display = 'block';
    }
    /*修改密码成功弹窗*/
    $('.nav-tabs div').on('click',function (e) {
        e.preventDefault();
        var id =$(this).attr('id');
        if(id=='info'){
            if($('#modify').hasClass('active')){
                $('#modify').removeClass('active');
                $('#modifypassword').addClass('hide');
            }
            $(this).addClass('active');
            if($('#personinfo').hasClass('hide')){
                $('#personinfo').removeClass('hide')
            }
        }
        if(id=='modify'){
            if($('#info').hasClass('active')){
                $('#info').removeClass('active');
                $('#personinfo').addClass('hide');
            }
            $(this).addClass('active');
            if($('#modifypassword').hasClass('hide')){
                $('#modifypassword').removeClass('hide')
            }
        }
    });
    $(document).on("click",".avator-btn-fake",function(){$("#upload").click()});
    $("#upload").on("change", function () {
        previewImage(this);
    });
    function sureChange() {
        var sourcePassword = $('#sourcePassword').val();
        var newPassword = $('#newPassword').val();
        var againPassword = $('#againPassword').val();

        if (isLegal(sourcePassword,8,20)){
            $('#sourcePassword').next('p').html('');
        } else {
            $('#sourcePassword').next('p').html('原始密码输入不合法');
            $('#sourcePassword').focus();
            return false;
        }
        if (isLegal(newPassword,8,20)){
            $('#newPassword').next('p').html('');
        } else {
            $('#newPassword').next('p').html('新密码输入不合法');
            $('#newPassword').focus();
            return false;
        }
        if (newPassword == againPassword){
            $('#againPassword').next('p').html('');
        } else {
            $('#againPassword').next('p').html('新密码、确认密码不一致');
            $('#againPassword').focus();
            return false;
        }
        $.ajax({
            url:'/OnlineCourseFronten/user/change/pwd',//路径
            type:'post',
            cache:false,
            dataType:'json',
            data:{
                sourcePassword :   sourcePassword,
                newPassword    :   newPassword
            },
            success:function (data) {
                /*$('#change-success').removeClass("hide");*/
                ShowDiv('change-success');
                countDown(5,'/OnlineCourseFronten/');
            },
            error:function (e) {
                $('#errorTip').html('密码修改失败!原始密码输不正确')
            }
        });
    }

    //倒计时s秒后跳转到url
    function countDown(s,url) {
        if (s<=0){
            location.href = url;
        }
        setTimeout(function () {
            s--;
            $('#count-down').html(s);
            countDown(s,url);
        },1000);
    }
    /**
     * 验证文本由数字、26个英文字母或者下划线组成
     * @param text 文本
     * @param min 最小长度
     * @param max 最大长度
     */
    function isLegal(text,min,max){
        var reg=/^[a-zA-Z0-9_]+$/;
        if(reg.test(text) && text.length<=max && text.length>=min){
            return true;
        }else{
            return false;
        }
    }


    /*******************个人信息***********************/
    $('#profile-submit').on('click',function () {
        if ($('#universityId').val()==''){
            $('#universityId').next('p').html('学工号不能为空');
            return false;
        } else {
            $('#universityId').next('p').html('');
        }
        if ($('#nickname').val()==''){
            $('#nickname').next('p').html('学工号不能为空');
            return false;
        } else {
            $('#nickname').next('p').html('');
        }

        //上传
        var form = new FormData(document.getElementById("profile"));

        $.ajax({
            url:"/OnlineCourseFronten/user/change/profile",
            type:"post",
            data:form,
            processData:false,
            contentType:false,
            beforeSend:function () {
                $('#pic-error').html('');
            },
            success:function(data){
                if (data.error=='error-pic-type'){
                    $('#pic-error').html("不是图片");
                }
                if (data.error=='error-pic-size'){
                    $('#pic-error').html("图片太大");
                }
                if (data.success=='success'){
                    alert('修改成功');
                    window.location.reload();//刷新当前页面
                }
            },
            error:function(e){
                alert('修改失败');
            }
        });
    });
</script>
</body>
</html>