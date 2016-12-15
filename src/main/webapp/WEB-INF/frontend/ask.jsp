<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="renderer" content="webkit">
    <link  rel="stylesheet" href="${pageContext.request.contextPath}/static/public/css/ask/common_less.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/public/css/ask/global.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/public/css/ask/main.css">
    <title>ask</title>
</head>
<body>
<%--头部--%>
<jsp:include page="include/header.jsp"></jsp:include>
<%--头部end--%>
<!--意见反馈-->
<div id="main">
    <div class="container clearfix">
        <div class="other-left ">
            <div id="pjax-container">
                <div class="others clearfix">
                    <div class="headtitle">
                        <h2 class="new-save-title">你的话题:</h2>
                    </div>
                    <div class="feedback-wrap">
                        <!--<div class="result-wrap">
                            <h2>提交成功</h2>
                            <p>感谢你的建议，我会努力让自己变得高大上！</p>
                        </div>-->
                        <div class="huati  field-wrapp">
                            <div class="question-areaq" style="margin: 10px;">
                                <h2 class="new-save-title">标题:
                                    <input type="text" id="ques-title" class="ipt autocomplete" maxlength="255" name="title" placeholder="话题标题">
                                </h2>
                            </div>
                            <div>
                                <div style="margin: 10px">
                                    <h2 class="new-save-title">内容:</h2>
                                </div>
                                <textarea name="info" maxlength="400" id="info" class="phd js-jianyi" cols="30" rows="10" placeholder="请填写具体内容"></textarea>
                                <p class="rlf-tip-wrap"></p>
                            </div>
                            <p class="fr inputNum js-inputNum">400</p>
                            <div>
                                <div class="js-imagesWrap fl imagesWrap"> </div>
                                <div class="addImgBtn fl js-addImgBtn">
                                    <%--<i class="icon-plus"></i>--%>
                                </div>
                                <div class="avator-btn-wrap">
                                    <!--<form target="uploadtarget" action="" method="post" enctype="multipart/form-data">
                                        <input type="file" onclick="this.form.reset();" name="picture[]" class="hide" id="upload" accept="image/jpeg,image/png,image/gif,image/bmp">
                                    </form>-->
                                    <!--上传多张图片-->
                                    <ul>
                                        <li class="control-group js_uploadBox clearfix" id="uploadImg">
                                            <div class="btn-upload">
                                                <div class="js_showBox">
                                                    <div class="uploadImg">
                                                        <input class="js_upFile" type="file" name="cover">
                                                    </div>
                                                </div>
                                            </div>
                                        </li>
                                    </ul>
                                    <!--上传多张图片-->
                                    <iframe src="about:blank" id="uploadtarget" name="uploadtarget" frameborder="0" style="display:none;"></iframe>
                                </div>
                                <div class="cb"></div>
                                <p class="uploadImgsTip">最多可以上传<span class="color-red">5</span>张图片,图片大小不能超过<span class="color-red">2M</span></p>
                            </div>
                            <div class="btn-wrap">
                                <button hidefocus="true" id="submit" class="fl">提交</button>
                                <p id="feedback-error" class="rlf-tip-wrap rlf-tip-error" style="display:none"></p>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <!--右边内容-->
        <div class="other-right">
            <h4>想及时沟通，请加慕粉QQ群！</h4>
            <ul>
                <li>慕课网Android讨论群: 232465453</li>
                <li>慕课网Java开发讨论群: 6200344</li>
                <li>慕课网Web前端讨论群③: 249860541</li>
                <li>慕课网PHP开发讨论群②: 102741309</li>
            </ul>
        </div>
        <!--右边内容end-->
    </div>
</div>
<!--意见反馈end-->
<%--尾部--%>
<jsp:include page="include/footer.jsp"></jsp:include>
<%--尾部end--%>
<script src="${pageContext.request.contextPath}/static/public/js/jquery-1.11.2.min.js"></script>
<script src="${pageContext.request.contextPath}/static/public/js/ask/jquery.uploadView.js"></script>
<script type="text/javascript">
    function c(m) {
        var a = $(this).siblings("p");
        m ? (a.addClass("rlf-tip-error").text(m), $(this).addClass("error-field")) : (a.removeClass("rlf-tip-error").empty(), $(this).removeClass("error-field")), $("#feedback-error").empty().hide()
    }
    /*$(function () {
     $(document).delegate(".js-addImgBtn", "click", function () {
     return $(".feedimg").length > 4 ? void $(this).hide() : void $("#upload").click()
     }), $(document).delegate(".js-jianyi"), $(document).delegate(".js-jianyi", "change", function () {
     $(".inputNum").html(400 - $(".js-jianyi").val().length)
     }), $(document).delegate(".js-jianyi", "keyup", function () {
     $(".inputNum").html(400 - $(".js-jianyi").val().length)
     }), $(document).delegate(".js-jianyi", "keydown", function () {
     $(".inputNum").html(400 - $(".js-jianyi").val().length)
     });
     {
     var b, y;
     document.createElement("input")
     }
     y = $("textarea[name='info']"), y.on({
     keyup: function () {
     $(this).val() && c.call(this)
     }, blur: function () {
     $(this).val() || c.call(this, "内容不能为空！")
     }
     })
     })*/
    $('.huati textarea ').on('click',function () {
        $(document).delegate(".js-addImgBtn", "click", function () {
            return $(".feedimg").length > 4 ? void $(this).hide() : void $("#upload").click()
        }), $(document).delegate(".js-jianyi"), $(document).delegate(".js-jianyi", "change", function () {
            $(".inputNum").html(400 - $(".js-jianyi").val().length)
        }), $(document).delegate(".js-jianyi", "keyup", function () {
            $(".inputNum").html(400 - $(".js-jianyi").val().length)
        }), $(document).delegate(".js-jianyi", "keydown", function () {
            $(".inputNum").html(400 - $(".js-jianyi").val().length)
        });
        {
            var b, y;
            document.createElement("input")
        }
        y = $("textarea[name='info']"), y.on({
            keyup: function () {
                $(this).val() && c.call(this)
            }, blur: function () {
                $(this).val() || c.call(this, "内容不能为空！")
            }
        })
    });

    $(".js_upFile").uploadView({
        uploadBox: '.js_uploadBox',//设置上传框容器
        showBox : '.js_showBox',//设置显示预览图片的容器
        width : 100, //预览图片的宽度，单位px
        height : 100, //预览图片的高度，单位px
        allowType: ["gif", "jpeg", "jpg", "bmp", "png"], //允许上传图片的类型
        maxSize :5, //允许上传图片的最大尺寸，单位M
        success:function(e){
            //alert('图片上传成功');
        }
    });
</script>
</body>
</html>
