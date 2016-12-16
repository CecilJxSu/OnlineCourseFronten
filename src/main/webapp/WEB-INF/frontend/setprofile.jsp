<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="renderer" content="webkit">
    <link href="${pageContext.request.contextPath}/static/public/css/setprofile/base.css" rel="stylesheet"/>
    <link href="${pageContext.request.contextPath}/static/public/css/setprofile/common.css" rel="stylesheet"/>
    <link href="${pageContext.request.contextPath}/static/public/css/setprofile/setprofile.css" rel="stylesheet"/>
    <title>setprofile</title>
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
        <div class="setting pb10">
            <div class="nav-tabs pa">
                <div id="info" class="baseinfo fl active">基本信息</div>
                <div id="modify" href="#" class="countinfo fl ">修改密码</div>
                <!--<a href="/user/address" class="countinfo fl">收货地址</a>
                <a href="/user/authenticate" class="countinfo fl">实名认证</a>-->
                <div class="cb"></div>
            </div>
            <%--基本信息--%>
            <div id="personinfo" class="contentBox ">
                <div class="formBox">
                    <div id="setting-profile" class="setting-wrap setting-profile">

                        <form id="profile">
                            <div class="wlfg-wrap clearfix ">
                                <label class="label-name" for="job">头像：</label>
                                <div  class="rlf-group">
                                    <div id="preview">
                                        <img id="imghead" class="fl avator-img" id="js-portrait" src="http://img.mukewang.com/552133900001743101800180-200-200.jpg" data-portrait="552133900001743101800180" width="180" height="180">
                                    </div>
                                    <div class="fl ml20 pr">
                                        <div><input type="button" hidefocus="true"  class="js-avator-try"></div>
                                        <div id="avator-btns" class="avator-btn-inner">
                                            <div class="avator-btn-wrap">
                                                <form target="uploadtarget" action="postpic" method="post" enctype="multipart/form-data">
                                                    <a href="javascript:void(0)" hidefocus="true" class="avator-btn-fake">上传头像</a>
                                                    <input class="hide" type="file" title="上传头像" name="fileField" id="upload" accept="image/*">
                                                    <input class="hide" type="hidden" name="type" value="1">
                                                </form>
                                                <%--<input type="file" title="上传头像" name="fileField" id="upload" onchange="previewImage(this)">--%>
                                                <%--<iframe src="about:blank" id="uploadtarget" name="uploadtarget" frameborder="0" style="display:none;"></iframe>--%>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="cb"></div>
                                    <p class="rlf-tip-wrap errorHint color-red"></p>
                                </div>
                            </div>

                            <div class="wlfg-wrap clearfix">
                                <label class="label-name" for="nick">昵称：</label>
                                <div class="rlf-group">
                                    <input type="text" name="nickname" id="nick" autocomplete="off" data-validate="require-nick" class="moco-form-control" value="哈米的小宇宙" placeholder="请输入昵称.">
                                    <p class="rlf-tip-wrap errorHint color-red"></p>
                                </div>
                            </div>

                            <div class="wlfg-wrap clearfix">
                                <label class="label-name" for="job">职位：</label>
                                <div class="rlf-group">
                                    <select class="moco-form-control rlf-select" name="job" hidefocus="true" id="job" data-validate="require-select">
                                        <option value="">请选择职位</option>
                                        <option value="13" selected="selected">学生</option>
                                        <option value="1">页面重构设计</option>
                                        <option value="6">Web前端工程师</option>
                                        <option value="5">JS工程师</option>
                                        <option value="8">PHP开发工程师</option>
                                        <option value="11">JAVA开发工程师</option>
                                        <option value="7">移动开发工程师</option>
                                        <option value="9">软件测试工程师</option>
                                        <option value="10">Linux系统工程师</option>
                                        <option value="2">交互设计师</option>
                                        <option value="3">产品经理</option>
                                        <option value="15">数据库工程师</option>
                                        <option value="4">UI设计师</option>
                                        <option value="17">CG影视动画师</option>
                                        <option value="16">全栈工程师</option>
                                    </select>
                                    <p class="rlf-tip-wrap errorHint color-red"></p>
                                </div>
                            </div>

                            <div class="wlfg-wrap clearfix">
                                <label class="label-name" for="province-select">城市：</label>
                                <div class="rlf-group profile-address">
                                    <select id="province-select" class="moco-form-control" hidefocus="true">
                                        <option value="0">选择省份</option>
                                        <option value="1">北京</option>
                                        <option value="2">天津</option>
                                        <option value="3">河北</option>
                                        <option value="4">山西</option>
                                        <option value="5">内蒙古</option>
                                        <option value="6">辽宁</option>
                                        <option value="7">吉林</option>
                                        <option value="8">黑龙江</option>
                                        <option value="9">上海</option>
                                        <option value="10">江苏</option>
                                        <option value="11">浙江</option>
                                        <option value="12">安徽</option>
                                        <option value="13">福建</option>
                                        <option value="14">江西</option>
                                        <option value="15">山东</option>
                                        <option value="16">河南</option>
                                        <option value="17">湖北</option>
                                        <option value="18">湖南</option>
                                        <option value="19">广东</option>
                                        <option value="20">海南</option>
                                        <option value="21">广西</option>
                                        <option value="22">甘肃</option>
                                        <option value="23">陕西</option>
                                        <option value="24">新疆</option>
                                        <option value="25">青海</option>
                                        <option value="26">宁夏</option>
                                        <option value="27">重庆</option>
                                        <option value="28">四川</option>
                                        <option value="29">贵州</option>
                                        <option value="30">云南</option>
                                        <option value="31">西藏</option>
                                        <option value="32">台湾</option>
                                        <option value="33">澳门</option>
                                        <option value="34">香港</option>
                                        <option value="100">其他</option>
                                    </select>
                                    <select class="moco-form-control" id="city-select" hidefocus="true">
                                        <option value="0">选择城市</option>
                                    </select>
                                    <select class="moco-form-control mr0" id="area-select" hidefocus="true">
                                        <option value="0">选择区县</option>
                                    </select>
                                    <div class="cb"></div>
                                    <p class="rlf-tip-wrap errorHint color-red"></p>
                                </div>
                            </div>

                            <div class="wlfg-wrap clearfix">
                                <label class="label-name h16 lh16">性别：</label>
                                <div class="rlf-group rlf-radio-group">
                                    <label class="lh16"><input type="radio" hidefocus="true" value="0" checked="checked" name="sex">保密</label>
                                    <label class="lh16"><input type="radio" hidefocus="true" value="1" name="sex">男</label>
                                    <label class="lh16"><input type="radio" hidefocus="true" value="2" name="sex">女</label>
                                    <p class="rlf-tip-wrap errorHint color-red"></p>
                                </div>
                            </div>

                            <div class="wlfg-wrap clearfix">
                                <label class="label-name" for="aboutme">个性签名：</label>
                                <div class="rlf-group">
                                    <div class="pr">
                                        <textarea name="aboutme" id="aboutme" rows="5" class="noresize js-sign moco-form-control">这位童鞋很懒，什么也没有留下～～！</textarea>
                                        <p class="numCanInput js-numCanInput ">还可以输入111个字符</p>
                                    </div>
                                </div>
                            </div>

                            <div class="wlfg-wrap clearfix">
                                <label class="label-name" for=""></label>
                                <div class="rlf-group">
                                    <span id="profile-submit" hidefocus="true" aria-role="button" class="rlf-btn-green btn-block profile-btn">保存</span>
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
</script>
</body>
</html>