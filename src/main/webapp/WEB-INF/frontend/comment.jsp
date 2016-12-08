<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="renderer" content="webkit">
    <link href="${pageContext.request.contextPath}/static/public/css/learn/common.css" rel="stylesheet"/>
    <link href="${pageContext.request.contextPath}/static/public/css/learn/layer.css" rel="stylesheet"/>
    <title>comment</title>
</head>
<body>
<%--头部--%>
<jsp:include page="include/header.jsp"></jsp:include>
<%--头部end--%>
<%--内容--%>
<div id="main">
    <div class="course-info-main clearfix w">
        <div class="content-wrap clearfix">
            <div class="content">
                <div class="mod-tab-menu ">
                    <ul class="course-menu clearfix">
                        <li><a class="ui-tabs-active " id="learnOn" href="#"><span>章节</span></a></li>
                        <li><a id="commentOn" class="active" href="#"><span>评论</span></a></li>
                        <li><a id="qaOn" class="" href="#"><span>问答</span></a></li>
                        <li><a id="noteOn" class="" href="#"><span>笔记</span></a></li>
                        <!--
                        <li><a id="wikiOn" class="" href="/wiki/9">WIKI</a></li>
                        -->
                    </ul>
                </div>
                <!--发布评论-->
                <!--课程评论-->
                <div id="course_note">
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
                <!--课程评论end-->

            </div>
            <!--右边内容-->
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
                    <div class="js-recom-box">
                        <div class="box  mb40"><h4>相关学习路径</h4>
                            <ul class="js-planrecom other-list">
                                <li><a href="#" target="_blank"> <span class="name autowrap">Web前端工程师成长第一阶段(基础篇)</span>
                                </a></li>
                                <li><a href="#" target="_blank"> <span class="name autowrap">PHP开发工程师闯关记--初识PHP</span>
                                </a></li>
                                <li><a href="#" target="_blank"> <span class="name autowrap">电商网站全站开发攻略</span>
                                </a></li>
                                <li><a href="#" target="_blank"> <span class="name autowrap">从零开始学习ThinkPHP框架</span>
                                </a></li>
                                <li><a href="#" target="_blank"> <span class="name autowrap">高德开发者必由之路——JS API篇</span>
                                </a></li>
                            </ul>
                        </div>
                    </div>

                </div>
            </div>
        </div>
        <div class="clear"></div>
    </div>
</div>
<%--内容end--%>
<%--尾部--%>
<jsp:include page="include/footer.jsp"></jsp:include>
<%--尾部end--%>
</body>
</html>
