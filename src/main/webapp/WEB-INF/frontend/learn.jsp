<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="renderer" content="webkit">
    <link href="${pageContext.request.contextPath}/static/public/css/learn/common.css" rel="stylesheet"/>
    <title><c:out value="${course.name}"/> | 课程学习网</title>
</head>
<body>
<%--头部--%>
<jsp:include page="include/header.jsp"></jsp:include>
<%--头部end--%>
<!--学习课程-->
<div id="main">
    <div class="course-infos">
        <div class="w pr">
            <div class="path">
                <a href="/course/list">课程</a>
                <i class="path-split">\</i><a href="/course/list?c=fe">前端开发</a>
                <i class="path-split">\</i><a href="/course/list?c=html">HTML/CSS</a>
                <i class="path-split">\</i><a href="/learn/9"><span>HTML+CSS基础课程</span></a>
            </div>
            <div class="hd clearfix">
                <h2 class="l" id="<c:out value='${course.id}'/>"><c:out value="${course.name}"/></h2>
            </div>

            <div class="statics clearfix">

                <div class="moco-btn l learn-btn green-btn red-btn">
                    <a href="/OnlineCourseFronten/video/show?id=<c:out value='${chapterAndSection[0].sections[0].id}'/>" class="J-learn-course">开始学习</a>
                    <em></em>
                    <i style="line-height: 0;" class="follow-action js-follow-action icon-star_outline" data-cid="9" data-cmd="follow" title="收藏"></i>
                </div>

                <div class="static-item l">
                    <span class="meta">学习人数</span>
                    <span class="meta-value js-learn-num"><c:out value="${numOfPeople}"/></span>
                </div>
                <div class="static-item l">
                    <span class="meta">难度级别</span>
                    <span class="meta-value">初级</span>
                    <em></em>
                </div>
                <div class="static-item l">
                    <span class="meta">课程时长</span>
                    <span class="meta-value"> 9小时17分</span>
                    <em></em>
                </div>
                <div class="static-item l">
                    <span class="meta">综合评分</span>
                    <span class="meta-value"><c:out value="${complex}"/></span>
                    <em></em>
                </div>
            </div>
            <div class="extra">
                <!-- credit -->
                <div class="share-rl-tips share-posi js-share-statue" style="display: none; right: 22px;">
                    <span class="icon-drop_up share-triangle"></span>
                    <span>分享即可 +</span><strong>1积分</strong>
                </div>
                <!-- share -->
                <div class="share-action r bdsharebuttonbox bdshare-button-style0-16" data-bd-bind="1479873254864">
                    <a href="javascript:;" class="share wx js-share icon-share-weichat" data-cmd="weixin" title="分享到微信"></a>
                    <a href="javascript:;" class="share qq js-share icon-share-qq" data-cmd="qzone" title="分享到QQ空间"></a>
                    <a href="javascript:;" class="share sina js-share icon-share-weibo" data-cmd="tsina" title="分享到新浪微博"></a>
                </div>
            </div>
        </div>
        <div class="info-bg" id="js-info-bg">
            <div class="cover-img-wrap">
                <img data-src="http://img.mukewang.com/55af49ad000116a506000338.jpg" alt="" style="display: none" id="js-cover-img">
            </div>
            <div class="cover-mask"></div>
            <canvas width="1349" height="212" class="cover-canvas" id="js-cover-canvas"></canvas></div>


    </div>
    <div class="course-info-main clearfix w">
        <div class="content-wrap">
            <div class="content">
                <!-- 课程公告 -->
                <!-- 课程简介 -->
                <div class="course-brief">
                    <p class="auto-wrap">简介：<c:out value="${course.introduction}"/></p>
                </div>
                <!-- 课程简介 end -->
                <div class="mod-tab-menu ">
                    <ul class="learnlearn course-menu clearfix">
                        <li><a id="learnOn" class="ui-tabs-active active"  ><span>章节</span></a></li>
                        <li><a id="commentOn" class="" ><span>评论</span></a></li>
                        <li><a id="qaOn" class="" ><span>问答</span></a></li>
                        <%--<li><a id="noteOn" class="" href="/note/9?sort=last&amp;page=1"><span>笔记</span></a></li>--%>
                        <!--
                        <li><a id="wikiOn" class="" href="/wiki/9">WIKI</a></li>
                        -->
                    </ul>

                </div>
                <!-- 课程面板 -->
                <!-- 课程章节 -->
                <div id="learnOncourse" class="mod-chapters">
                    <c:forEach var="units" items="${chapterAndSection}" >
                    <div class="chapter  chapter-active">
                        <h3>
                            <span class="icon-drop_down js-close js-open"></span>
                            <strong>
                                <i class="icon-chapter"></i>
                                <c:out value="${units.chapter.name}"/>
                                <div class="icon-info chapter-info">
                                    <i class="icon-drop_up triangle" style="display: none;">
                                        <div class="chapter-introubox" style="left: -132px;">
                                            <div class="chapter-content" style="width: 280px; white-space: pre-line; text-align: center;">
                                                <c:out value="${units.chapter.introduction}"/>
                                            </div>
                                        </div>
                                    </i>
                                </div>
                            </strong>
                        </h3>
                        <!-- 章节标题 end -->
                        <!-- 章节小节 -->
                        <ul class="video">
                            <c:forEach var="section" items="${units.sections}">
                            <li data-media-id="52">
                                <a href="/OnlineCourseFronten/video/show?id=<c:out value='${section.id}'/>" class="J-media-item">
                                    <i class="icon-code type"></i>
                                    <c:out value="${section.name}"/>
                                    <button class="r moco-btn moco-btn-red preview-btn">开始学习</button>
                                </a>
                                <!-- 未登录时 -->
                                <!-- <a target="_blank" href="/video/1430" class="J-media-item studyvideo">1-1 Java简介 (05:49)
                                    <button class="r moco-btn moco-btn-blue preview-btn">预览</button>
                                </a> -->
                            </li>
                            </c:forEach>
                        </ul>
                        <!-- 章节小节 end -->
                    </div>
                    </c:forEach>
                </div>
                <!-- 课程章节 end -->
                <%--评论--%>
                <div id="commentOncourse" class="hide">
                    <ul class="mod-post" id="comment-list">
                        <li class="post-row" id="6696">
                            <div class="media">
                                <a href="#" target="_blank">
                                    <img src="${pageContext.request.contextPath}/static/staticWEB/img/common/545865f0000198ee02200220-40-40.jpg" width="40" height="40">
                                </a>
                            </div>
                            <div class="bd">
                                <div class="tit">
                                    <a href="#" target="_blank">Flicker</a>
                                </div>
                                <p class="cnt">
                                    一个html页面可以看成一个家，而一个div你们可以看成家的每个小房间，房间有了当然没什么效果，但是一个家必须分成一个个小房间才能多姿多彩，但每个房间里怎么装饰就得你们自己放东西，当然装饰就得交给css了，后面讲到&lt;div
                                    class&gt;大家就懂了，不知道我表达得对不对，不对请指出。</p>
                                <div class="footer clearfix">
                                    <span title="创建时间" class="l timeago">时间：2014-12-08</span>
                                    <a href="#" class="from">源自：3-3 认识div在排版中的作用</a>
                                    <div class="actions r">
                                        <a title="赞" href="javascript:;" class="js-pl-praise list-praise post-action"
                                           data-id="6696">
                                            <span class="icon-thumb-revert"></span>
                                            <em>1108</em>
                                        </a>
                                    </div>
                                </div>
                            </div>
                        </li>
                    </ul>
                    <div class="page"><span class="disabled_page">首页</span><span class="disabled_page">上一页</span><a
                            href="javascript:void(0)" class="active text-page-tag">1</a><a class="text-page-tag"
                                                                                           href="/course/comment/id/9?page=2">2</a><a
                            class="text-page-tag" href="/course/comment/id/9?page=3">3</a><a class="text-page-tag"
                                                                                             href="/course/comment/id/9?page=4">4</a><a
                            class="text-page-tag" href="/course/comment/id/9?page=5">5</a><a class="text-page-tag"
                                                                                             href="/course/comment/id/9?page=6">6</a><a
                            class="text-page-tag" href="/course/comment/id/9?page=7">7</a><a
                            href="/course/comment/id/9?page=2">下一页</a><a href="/course/comment/id/9?page=1439">尾页</a>
                    </div>
                </div>
                <%--评论end--%>
                <%--问答--%>
                <div id="qa" class="qa hide">
                    <div class="comp-filter-bar">
                        <a href="/qa/9/t/1?page=1" class="bar-item active">全部</a>
                        <a href="/qa/9/t/2?page=1" class="bar-item ">精华</a>
                    </div>
                    <div class="answertabcon">
                        <div class="course_quescon">
                            <div class="wenda-listcon mod-qa-list clearfix">
                                <div class="headslider qa-medias l">
                                    <a href="/u/4465849/courses" class="media" target="_blank" title="慕粉1459202131"><img src="http://img.mukewang.com/user/54584d9f0001043b02200220-40-40.jpg" width="40" height="40">
                                        <i class="icon-ques-revert nofinish"></i>
                                    </a>
                                </div>
                                <div class="wendaslider qa-content" style="border-bottom: 0px;">
                                    <h2 class="wendaquetitle qa-header">
                                        <a href="/u/4465849/courses" class="name" target="_blank" title="慕粉1459202131">
                                            慕粉1459202131
                                        </a>
                                        <div class="wendatitlecon qa-header-cnt clearfix">
                                            <a href="/qadetail/183984" target="_blank" class="qa-tit">
                                                <i>作为一个文科生，怎么去学习编程？</i>
                                            </a>
                                        </div>
                                    </h2>
                                    <div class="replycont qa-body clearfix">
                                        <div class="l replydes">
                                    <span class="replysign praise">[最新
                                        <a href="/u/4465496/courses" target="_blank" title="哎哟不错哦" class="nickname">哎哟不错哦</a>
                                    的回答]</span>
                                            <span class="replydet">重点在于自己，想不想学，有没有去尝试，有没有恒心！文科理科差异不大1</span>
                                        </div>
                                    </div>
                                    <div class="replymegfooter qa-footer clearfix">
                                        <div class="wenda-time">
                                            <div class="l-box l">
                                                <em>时间：4分钟前</em>
                                                <a href="/video/52" target="_blank">源自：1-2 Html和CSS的关系</a>
                                            </div>
                                            <a href="${pageContext.request.contextPath}/qadetail/showQadetail" target="_blank" class="replynumber static-count r">
                                                <span class="static-item answer">
                                                    <b class="val">2</b>
                                                    <span class="key">回答</span>
                                                </span>
                                                                <span class="static-item">
                                                    <b class="val">9</b>
                                                    <span class="key">浏览</span>
                                                </span>
                                            </a>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="page"><span class="disabled_page">首页</span><span class="disabled_page">上一页</span><a href="javascript:void(0)" class="active text-page-tag">1</a><a class="text-page-tag" href="/course/qa/id/9/t/1?page=2">2</a><a class="text-page-tag" href="/course/qa/id/9/t/1?page=3">3</a><a class="text-page-tag" href="/course/qa/id/9/t/1?page=4">4</a><a class="text-page-tag" href="/course/qa/id/9/t/1?page=5">5</a><a class="text-page-tag" href="/course/qa/id/9/t/1?page=6">6</a><a class="text-page-tag" href="/course/qa/id/9/t/1?page=7">7</a><a href="/course/qa/id/9/t/1?page=2">下一页</a><a href="/course/qa/id/9/t/1?page=948">尾页</a></div>
                    </div>
                </div>
                <%--问答end--%>
            </div>
            <!--content end-->
            <div class="aside r">
                <div class="bd">
                    <div class="box mb40 js-usercard-box">
                        <h4>讲师提示</h4>
                        <div class="no-teacher"></div>
                        <div class="course-info-tip">
                            <dl class="first">
                                <dt>课程须知</dt>
                                <dd class="autowrap">没有任何WEB经验的WEB应用程序开发者、对WEB前端技术感兴趣的用户均可学习。</dd>
                            </dl>
                            <dl>
                                <dt>老师告诉你能学到什么？</dt>
                                <dd class="autowrap">轻松学习HTML、CSS样式基础知识，可以利用HTML、CSS样式技术制作出简单页面。</dd>
                            </dl>
                        </div>
                    </div>

                    <div class="js-recom-box"><div class="box  mb40">                        <h4>相关学习路径</h4>                        <ul class="js-planrecom other-list">                            <li>                            <a href="/course/programdetail/pid/3" target="_blank">                                <span class="name autowrap">Web前端工程师成长第一阶段(基础篇)</span>                            </a>                        </li><li>                            <a href="/course/programdetail/pid/11" target="_blank">                                <span class="name autowrap">PHP开发工程师闯关记--初识PHP</span>                            </a>                        </li><li>                            <a href="/course/programdetail/pid/21" target="_blank">                                <span class="name autowrap">电商网站全站开发攻略</span>                            </a>                        </li><li>                            <a href="/course/programdetail/pid/27" target="_blank">                                <span class="name autowrap">从零开始学习ThinkPHP框架</span>                            </a>                        </li><li>                            <a href="/course/programdetail/pid/28" target="_blank">                                <span class="name autowrap">高德开发者必由之路——JS API篇</span>                            </a>                        </li>                        </ul>                    </div><div class="box  mb40">                        <h4>推荐课程</h4>                        <ul class="js-courserecom other-list">                            <li>                            <a href="/learn/15" target="_blank">                                <span class="name autowrap">分页页码制作</span>                            </a>                        </li><li>                            <a href="/learn/20" target="_blank">                                <span class="name autowrap">网页简单布局之结构与表现原则</span>                            </a>                        </li><li>                            <a href="/learn/42" target="_blank">                                <span class="name autowrap">表单美化</span>                            </a>                        </li><li>                            <a href="/learn/48" target="_blank">                                <span class="name autowrap">IT菜鸟逆袭指南（江湖篇）</span>                            </a>                        </li><li>                            <a href="/learn/57" target="_blank">                                <span class="name autowrap">如何用CSS进行网页布局</span>                            </a>                        </li>                        </ul>                    </div></div>

                </div>        </div>
        </div>
        <div class="clear"></div>

    </div>
    <!-- 视频介绍 -->
    <div id="js-video-wrap" class="video pop-video" style="display:none">
        <div class="video_box" id="js-video"></div>
        <a href="javascript:;" class="pop-close icon-close"></a>
    </div>

</div>
<!--学习课程end-->
<%--尾部--%>
<jsp:include page="include/footer.jsp"></jsp:include>
<%--尾部end--%>
<!--加载js-->
<script src="${pageContext.request.contextPath}/static/public/js/jquery-1.11.2.min.js"></script>
<script src="${pageContext.request.contextPath}/static/public/js/learn/learn.js"></script>
<script type="text/javascript">
    $('.learnlearn a').on('click',function(e){
         e.preventDefault();
        var id = $(this).attr('id');
        if(id=='learnOn'){
            if($('#commentOn').hasClass('active')){
                $('#commentOn').removeClass('active') ;
                $('#commentOncourse').addClass('hide');
            }
            if($('#qaOn').hasClass('active')){
                $('#qaOn').removeClass('active') ;
                $('#qa').addClass('hide');
            }
            $(this).addClass('active');
            if($('#learnOncourse').hasClass('hide')){
                $('#learnOncourse').removeClass('hide')
            }
        }

        if(id=='commentOn'){
            if($('#learnOn').hasClass('active')){
                $('#learnOn').removeClass('active') ;
                $('#learnOncourse').addClass('hide');
            }
            if($('#qaOn').hasClass('active')){
                $('#qaOn').removeClass('active') ;
                $('#qa').addClass('hide');
            }
            $(this).addClass('active');
            if($('#commentOncourse').hasClass('hide')){
                $('#commentOncourse').removeClass('hide')
            }
        }

        if(id=='qaOn'){
            if($('#learnOn').hasClass('active')){
                $('#learnOn').removeClass('active') ;
                $('#learnOncourse').addClass('hide');
            }
            if($('#commentOn').hasClass('active')){
                $('#commentOn').removeClass('active') ;
                $('#commentOncourse').addClass('hide');
            }
            $(this).addClass('active');
            if($('#qa').hasClass('hide')){
                $('#qa').removeClass('hide')
            }
        }
    });

    $(".icon-info").hover(function(){
        $(this).children("i").css("display","inline");
    },function(){
        $(this).children("i").css("display","none");
    });

</script>
</body>
</html>
