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
            <div id="course-list" class="js-course-list my-space-course study-tl comment-course-list">
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
                            nowPage = 1;main_course();
                            break;
            case 'favorite':$('#notice-list').css('display','none');$('#course-list').css('display','none');$('#favorite-list').css('display','block');
                            $('#notices').removeClass('active');$('#course').removeClass('active');$('#favorite').addClass('active');
                            break;
            case 'notices':$('#favorite-list').css('display','none');$('#course-list').css('display','none');$('#notice-list').css('display','block');
                            $('#course').removeClass('active');$('#favorite').removeClass('active');$('#notices').addClass('active');
                            break;

        }    })
    /*table标签实现end*/

    /************** start：课程列表***********/
    //默认当前页(不可动)
    var nowPage = 1;
    //默认最大页数(不可动)
    var maxPage = 1;

    //ajax入口
    function main_course() {
        var url = '/OnlineCourseFronten/message/course/get';
        var data = {
            nowPage : nowPage
        };
        getData_course(url,data);
    }

    //页面加载完成时触发
    $(function () {
        main_course();
    });

    //ajax(不可动)
    function getData_course(url,data){
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
                jsonToHtml_course(data);
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
            pageHtml += '<span class="disabled_page">首页</span>';
            pageHtml += '<span class="disabled_page">上一页</span>';
        } else {
            pageHtml += '<a id="first-page" href="javascript:void(0)">首页</a>';
            pageHtml += '<a id="previous-page" href="javascript:void(0)">上一页</a>';
        }
        //设置数字页
        for (var i=1;i<=maxPage;i++){
            if (i == nowPage){
                pageHtml += '<a class="text-page-tag active" href="javascript:void(0)">'+i+'</a>';
            } else {
                pageHtml += '<a class="text-page-tag page-num" href="javascript:void(0)">'+i+'</a>';
            }
        }
        //设置下一页、尾页
        if (nowPage == maxPage){
            pageHtml += '<span class="disabled_page">下一页</span>';
            pageHtml += '<span class="disabled_page">尾页</span>';
        } else {
            pageHtml += '<a id="next-page" href="javascript:void(0)">下一页</a>';
            pageHtml += '<a id="last-page" href="javascript:void(0)">尾页</a>';
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
    function jsonToHtml_course(data) {
        var html = '';
        $.each( data.returnDate, function(index, content)
        {
            html += '<div class="course-list course-list-m">';
            html += '<ul class="clearfix">';
            html += '<li class="course-one" data-courseid="156" data-uid="1361691">';
            html += '<div class="course-list-img l">';
            html += '<a href="/OnlineCourseFronten/learn/show?id='+content.course.id+'" target="_blank">';
            html += '<img width="200" height="113" alt="'+content.course.name+'" src="/OnlineCourseFronten/file/get?url='+content.pic+'">';
            html += '</a>';
            html += '</div>';
            html += '<div class="course-list-cont">';
            html += '<h3 class="study-hd">';
            html += '<a href="/OnlineCourseFronten/learn/show?id='+content.course.id+'" target="_blank">'+content.course.name+'</a>';
            html += '<span class="i-new">更新完毕</span>';
            html += '</h3>';
            html += '<div class="study-points">';
            html += '<span class="i-right span-common">'+content.course.introduction+'</span>';
            html += '</div>';
            html += '<div class="catog-points">';
            html += '<span class="i-left span-common">人数 <i>'+content.peopleNum+'</i></span>';
            html += '<span class="i-mid span-common">综合 <i>'+(Number(content.course.watchCount+content.course.likeCount+content.course.commentCount+content.course.favoriteCount)).toFixed(0)+'</i></span>';
            html += '<span class="i-right span-common">评论 <i>'+(Number(content.course.commentCount/3)).toFixed(0)+'</i></span>';
            html += '<a href="/OnlineCourseFronten/learn/show?id='+content.course.id+'" target="_blank" class="btn-red continute-btn">继续学习</a>';
            html += '</div>';
            html += '</div>';
            html += '</li>';
            html += '</ul>';
            html += '</div>';
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
    /************** end：课程分页列表***********/
</script>
</body>
</html>
