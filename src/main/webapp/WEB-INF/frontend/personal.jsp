<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="renderer" content="webkit">
    <link href="${pageContext.request.contextPath}/static/public/css/personal/base.css" rel="stylesheet"/>
    <link href="${pageContext.request.contextPath}/static/public/css/notices/notices.css" rel="stylesheet"/>
    <link href="${pageContext.request.contextPath}/static/public/css/topic/common.css" rel="stylesheet"/>
    <title>personal</title>
</head>
<body>
<%--头部--%>
<jsp:include page="include/header.jsp"></jsp:include>
<%--头部end--%>
<%--内容--%>
<div id="main">
    <div class="wrap">
        <div class="slider" style="position: absolute; left: 0px; top: 0px;">
            <div class="user-pic" data-is-fans="" data-is-follows="">
                <div class="user-pic-bg"></div>
                <img class="img" src="http://img.mukewang.com/552133900001743101800180-200-200.jpg" alt="">
            </div>
            <%--<ul>
                <li>
                    <a href="">
                        <i class="icon-home"></i><span>主页</span><b class="icon-drop_right"></b>
                    </a>
                </li>
                <li>
                    <a href="" class="active">
                        <i class="icon-tick"></i><span>课程</span><b class="icon-drop_right"></b>
                    </a>
                </li>
                <li>
                    <a href="">
                        <i class="icon-shizhan"></i><span>收藏</span><b class="icon-drop_right"></b>
                    </a>
                </li>

            </ul>--%>
        </div>
        <div class="u-container">
            <div class="c-tab clearfix">
                <div class="tool-left l">
                    <a id="course" href="" class="sort-item active">我的课程</a>
                    <a id="favorite" href="" class="sort-item ">我的收藏</a>
                    <a id="notices" href="" class="sort-item ">通知</a>
                </div>
                    <%--<div class="tool-right r">
                    <div class="tool-all"></div>
                    </div>--%>
            </div>
            <%--我的课程--%>
            <div id="course-list" class="js-course-list my-space-course study-tl" style="padding: 0px;">
                <%--第一条内容--%>
                <div class="clearfix tl-item  tl-item-first" style="border-left: none;padding: 0px;">
                    <div class="course-list course-list-m" style="border-left: none;padding: 0px;">
                        <ul class="clearfix">
                            <li class="course-one" data-courseid="156" data-uid="1361691">
                                <div class="course-list-img l">
                                    <a href="/learn/156" target="_blank">
                                        <img width="200" height="113" alt="AngularJS实战"
                                             src="http://img.mukewang.com/5707699500012d5a06000338-240-135.jpg">
                                    </a>
                                </div>
                                <div class="course-list-cont">
                                    <h3 class="study-hd">
                                        <a href="/learn/156" target="_blank">AngularJS实战</a>

                                        <span class="i-new">更新完毕</span>
                                        <!-- 更新完毕 -->
                                        <!-- 收藏和删除 -->
                                        <div class="share-box clearfix">
                                            <div class="show-btn"><i class="icon-down2"></i></div>
                                            <div class="share-box-con courses-r">
                                                <a href="javascript:;" title="收藏" class="follow custom_f"><i
                                                        class="icon icon-star_outline"></i></a>
                                                <a href="javascript:;" title="删除" class="del"><i
                                                        class="icon icon-notdisplay"></i></a>

                                            </div>
                                        </div>
                                    </h3>
                                    <div class="study-points">
                                        <span class="i-left span-common">已学0%</span>
                                        <span class="i-mid span-common">用时19分</span>
                                        <span class="i-right span-common">学习至1-2 快速上手</span>
                                    </div>
                                    <div class="catog-points">
                                        <span class="i-left span-common"><a
                                                href="/u/1361691/course/156/notes">笔记 <i>0</i></a></span>
                                        <span class="i-mid span-common"><a
                                                href="/u/1361691/course/156/codes">代码 <i>0</i></a></span>
                                        <span class="i-right span-common"><a
                                                href="/u/1361691/course/156/questions">问答 <i>0</i></a></span>

                                        <a href="/video/4441" target="_blank" class="btn-red continute-btn">继续学习</a>

                                    </div>
                                </div>


                            </li>
                        </ul>
                    </div>
                </div>
                <%--第一条内容--%>
            </div>
            <%--我的课程--%>
            <%--我的收藏--%>
            <div id="favorite-list" class="course-list course-list-m js-course-list" style="display: none;">
                <ul class="clearfix">
                    <li class="course-one" data-courseid="156" data-uid="1361691">
                        <div class="course-list-img l">
                            <%--用户头像--%>
                            <a href="" target="_blank">
                                <img style="width: 70px;height: 70px;border-radius: 100px;" alt="AngularJS实战" src="http://img.mukewang.com/5707699500012d5a06000338-240-135.jpg">
                            </a>
                            <%--用户头像end--%>
                            <%--用户账号--%>
                             <div style="padding: 10px 2px 10px 7px;">
                                 <a style="font-size: 16px;">asdasd</a>
                             </div>
                            <%--用户账号end--%>
                        </div>
                        <div class="course-list-cont" style="padding-left: 130px;">
                            <%--话题标题--%>
                            <h3 class="study-hd">
                                <a href="" target="_blank" style="color: #14191e;">AngularJS实战</a>
                            </h3>
                            <%--话题标题end--%>
                            <%--内容--%>
                            <div class="study-points" style="display: inline-table;">
                                <span class="i-left span-common" style="color: #1D1D20;font-size: 18px;">
                                    2015年8月5日 - 标签:css 一键约师傅 百度师傅百度师傅,专治各种手机、电脑问题百度经验:jingyan.baidu.com 网页中圆形头像百度经验:jingyan.baidu.com 工具/原料 CSS百度经验:jin...
                                </span>
                            </div>
                            <%--内容end--%>
                            <div class="catog-points">
                                <span class="i-left span-common">
                                    <a href="javascript:void (0);">浏览 <i>0</i></a>
                                </span>
                                <span class="i-mid span-common">
                                    <a href="javascript:void (0);">评论 <i>0</i></a>
                                </span>
                                <span class="i-right span-common">
                                    <a href="javascript:void (0);">收藏 <i>0</i></a>
                                </span>
                                <span class="i-right span-common">
                                    <a href="javascript:void (0);">赞 <i>0</i></a>
                                </span>
                            </div>
                        </div>
                    </li>
                    <li class="course-one" data-courseid="156" data-uid="1361691">
                        <div class="course-list-img l">
                            <%--用户头像--%>
                            <a href="" target="_blank">
                                <img style="width: 70px;height: 70px;border-radius: 100px;" alt="AngularJS实战" src="http://img.mukewang.com/5707699500012d5a06000338-240-135.jpg">
                            </a>
                            <%--用户头像end--%>
                            <%--用户账号--%>
                             <div style="padding: 10px 2px 10px 7px;">
                                 <a style="font-size: 16px;">asdasd</a>
                             </div>
                            <%--用户账号end--%>
                        </div>
                        <div class="course-list-cont" style="padding-left: 130px;">
                            <%--话题标题--%>
                            <h3 class="study-hd">
                                <a href="" target="_blank" style="color: #14191e;">AngularJS实战</a>
                            </h3>
                            <%--话题标题end--%>
                            <%--内容--%>
                            <div class="study-points" style="display: inline-table;">
                                <span class="i-left span-common" style="color: #1D1D20;font-size: 18px;">
                                    2015年8月5日 - 标签:css 一键约师傅 百度师傅百度师傅,专治各种手机、电脑问题百度经验:jingyan.baidu.com 网页中圆形头像百度经验:jingyan.baidu.com 工具/原料 CSS百度经验:jin...
                                </span>
                            </div>
                            <%--内容end--%>
                            <div class="catog-points">
                                <span class="i-left span-common">
                                    <a href="javascript:void (0);">浏览 <i>0</i></a>
                                </span>
                                <span class="i-mid span-common">
                                    <a href="javascript:void (0);">评论 <i>0</i></a>
                                </span>
                                <span class="i-right span-common">
                                    <a href="javascript:void (0);">收藏 <i>0</i></a>
                                </span>
                                <span class="i-right span-common">
                                    <a href="javascript:void (0);">赞 <i>0</i></a>
                                </span>
                            </div>
                        </div>
                    </li>
                </ul>
            </div>
            <%--收藏end--%>
            <%--通知--%>
            <div id="notice-list" class="notice-list" style="display:none">
                <div note-id="633468" class="notice">
                    <div class="notice-box clearfix" style="display: flex;">
                        <p class="notice-type ">猿问</p>
                        <div class="notice-show-box">
                            <p class="notice-con ">
                                你的提问<a target="_blank" href="">求学习js数组目录！</a>有新回答
                            </p>
                            <h5 class="notice-date">2016-12-26 16:40:04</h5>
                        </div>
                        <div class="del-box clearfix">
                            <a href="javascript:void(0)" class="del-notice" title="删除此通知">
                                <i class="icon icon-del"></i>
                            </a>
                        </div>
                    </div>
                </div>
                <div note-id="606200" class="notice">
                    <div class="notice-box clearfix" style="display: flex;">
                        <p class="notice-type  already-read ">猿问</p>
                        <div class="notice-show-box">
                            <p class="notice-con pass ">
                                你的提问<a target="_blank" href="">现在学java前景好吗？</a>有新回答
                            </p>
                            <h5 class="notice-date">2016-12-13 17:01:38</h5>
                        </div>
                        <div class="del-box clearfix">
                            <a href="javascript:void(0)" class="del-notice" title="删除此通知">
                                <i class="icon icon-del"></i>
                            </a>
                        </div>
                    </div>
                </div>

            </div>
            <%--通知end--%>
            <!-- 分页 -->
            <div class="qa-comment-page">
                <div class="page">
                    <span class="disabled_page">首页</span>
                    <span class="disabled_page">上一页</span>
                    <a href="javascript:void(0)" class="active text-page-tag">1</a>
                    <a class="text-page-tag" href="/u/1361691/courses?page=2">下一页</a>
                    <a href="/u/1361691/courses?page=2">尾页</a>
                </div>
            </div>
        </div>
    </div>

</div>
<%--内容end--%>
<%--尾部--%>
<jsp:include page="include/footer.jsp"></jsp:include>
<%--尾部end--%>
<!--加载js-->
<script src="${pageContext.request.contextPath}/static/public/js/jquery-1.11.2.min.js"></script>
<script type="text/javascript">
    /*table标签实现*/
    $('.tool-left a').on('click',function (e) {
        e.preventDefault();
        var id=$(this).attr('id');
        switch (id){
            case 'course':$('#favorite-list').css('display','none');$('#notice-list').css('display','none');$('#course-list').css('display','block');
                            $('#notices').removeClass('active');$('#favorite').removeClass('active');$('#course').addClass('active');
                            break;
            case 'favorite':$('#notice-list').css('display','none');$('#course-list').css('display','none');$('#favorite-list').css('display','block');
                            $('#notices').removeClass('active');$('#course').removeClass('active');$('#favorite').addClass('active');
                            break;
            case 'notices':$('#favorite-list').css('display','none');$('#course-list').css('display','none');$('#notice-list').css('display','block');
                            $('#course').removeClass('active');$('#favorite').removeClass('active');$('#notices').addClass('active');
                            break;

        }    })
    /*table标签实现end*/

</script>
</body>
</html>
