<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="renderer" content="webkit">
    <link href="${pageContext.request.contextPath}/static/public/css/learn/common.css" rel="stylesheet"/>
    <title>learn</title>
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
                <h2 class="l">HTML+CSS基础课程</h2>
            </div>

            <div class="statics clearfix">

                <div class="moco-btn l learn-btn green-btn red-btn">
                    <a href="/code/49" class="J-learn-course">开始学习</a>
                    <em></em>
                    <i style="line-height: 0;" class="follow-action js-follow-action icon-star_outline" data-cid="9" data-cmd="follow" title="收藏"></i>
                </div>



                <div class="static-item l">
                    <span class="meta">学习人数</span>
                    <span class="meta-value js-learn-num">563978</span>
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
                <div class="static-item l score-btn">
                    <span class="meta">综合评分</span>
                    <span class="meta-value">9.5</span>
                    <em></em>


                    <div class="score-wrap icon-drop_up triangle">
                        <div class="score-box">
                            <a href="/coursescore/9" class="person-num">
                                <span class="person-num l">5366人评价</span>
                            </a>
                            <a href="/coursescore/9?page=1" class="evaluation-btn r">查看评价</a>
                            <div class="score-detail-box">
                                <div class="score-static-item">
                                    <span class="meta-value">9.8</span>
                                    <span class="meta">内容实用</span>
                                </div>
                                <div class="score-static-item">
                                    <span class="meta-value">9.5</span>
                                    <span class="meta">简洁易懂</span>
                                    <em></em>
                                </div>
                                <div class="score-static-item">
                                    <span class="meta-value">9.2</span>
                                    <span class="meta">逻辑清晰</span>
                                    <em></em>
                                </div>
                            </div>
                        </div>
                    </div>

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
                    <p class="auto-wrap">简介：本课程从最基本的概念开始讲起，步步深入，带领大家学习HTML、CSS样式基础知识，了解各种常用标签的意义以及基本用法，后半部分讲解CSS样式代码添加，为后面的案例课程打下基础。</p>
                </div>
                <!-- 课程简介 end -->
                <div class="mod-tab-menu ">
                    <ul class="course-menu clearfix">
                        <li><a class="ui-tabs-active active" id="learnOn" href="/learn/9"><span>章节</span></a></li>
                        <li><a id="commentOn" class="" href="/comment/9"><span>评论</span></a></li>
                        <li><a id="qaOn" class="" href="/qa/9/t/1?page=1"><span>问答</span></a></li>
                        <li><a id="noteOn" class="" href="/note/9?sort=last&amp;page=1"><span>笔记</span></a></li>
                        <!--
                        <li><a id="wikiOn" class="" href="/wiki/9">WIKI</a></li>
                        -->
                    </ul>

                </div><!-- 课程面板 -->
                <!-- 课程章节 -->
                <div class="mod-chapters">
                    <div class="chapter  chapter-active">
                        <!-- 章节标题 -->
                        <h3>

                            <span class="icon-drop_down js-close js-open"></span>
                            <strong>
                                <i class="icon-chapter"></i>
                                第1章 Html介绍
                                <div class="icon-info chapter-info">
                                    <i class="icon-drop_up triangle" style="display: none;">
                                        <div class="chapter-introubox" style="left: -132px;">
                                            <div class="chapter-content" style="width: 280px; white-space: pre-line; text-align: center;">本章节主要讲解html和css样式的关系，以及html标签、html文件结构、head标签,最后讲解了在html中的注释代码的作用。</div>
                                        </div>
                                    </i>
                                </div>
                            </strong>

                        </h3>
                        <!-- 章节标题 end -->
                        <!-- 章节小节 -->
                        <ul class="video">
                            <li data-media-id="49">
                                <a href="/code/49" class="J-media-item">
                                    <i class="icon-code type"></i>
                                    1-1 代码初体验，制作我的第一个网页

                                    <button class="r moco-btn moco-btn-red preview-btn">开始学习</button>

                                </a>
                                <!-- 未登录时 -->
                                <!-- <a target="_blank" href="/video/1430" class="J-media-item studyvideo">1-1 Java简介 (05:49)
                                    <button class="r moco-btn moco-btn-blue preview-btn">预览</button>
                                </a> -->
                            </li>
                            <li data-media-id="52">
                                <a href="/code/52" class="J-media-item">
                                    <i class="icon-code type"></i>
                                    1-2 Html和CSS的关系

                                    <button class="r moco-btn moco-btn-red preview-btn">开始学习</button>

                                </a>
                                <!-- 未登录时 -->
                                <!-- <a target="_blank" href="/video/1430" class="J-media-item studyvideo">1-1 Java简介 (05:49)
                                    <button class="r moco-btn moco-btn-blue preview-btn">预览</button>
                                </a> -->
                            </li>
                            <li data-media-id="54">
                                <a href="/code/54" class="J-media-item">
                                    <i class="icon-code type"></i>
                                    1-3 认识html标签

                                    <button class="r moco-btn moco-btn-red preview-btn">开始学习</button>

                                </a>
                                <!-- 未登录时 -->
                                <!-- <a target="_blank" href="/video/1430" class="J-media-item studyvideo">1-1 Java简介 (05:49)
                                    <button class="r moco-btn moco-btn-blue preview-btn">预览</button>
                                </a> -->
                            </li>
                            <li data-media-id="83">
                                <a href="/code/83" class="J-media-item">
                                    <i class="icon-code type"></i>
                                    1-4 标签的语法

                                    <button class="r moco-btn moco-btn-red preview-btn">开始学习</button>

                                </a>
                                <!-- 未登录时 -->
                                <!-- <a target="_blank" href="/video/1430" class="J-media-item studyvideo">1-1 Java简介 (05:49)
                                    <button class="r moco-btn moco-btn-blue preview-btn">预览</button>
                                </a> -->
                            </li>
                            <li data-media-id="56">
                                <a href="/code/56" class="J-media-item">
                                    <i class="icon-code type"></i>
                                    1-5 认识html文件基本结构

                                    <button class="r moco-btn moco-btn-red preview-btn">开始学习</button>

                                </a>
                                <!-- 未登录时 -->
                                <!-- <a target="_blank" href="/video/1430" class="J-media-item studyvideo">1-1 Java简介 (05:49)
                                    <button class="r moco-btn moco-btn-blue preview-btn">预览</button>
                                </a> -->
                            </li>
                            <li data-media-id="74">
                                <a href="/code/74" class="J-media-item">
                                    <i class="icon-code type"></i>
                                    1-6 认识head标签

                                    <button class="r moco-btn moco-btn-red preview-btn">开始学习</button>

                                </a>
                                <!-- 未登录时 -->
                                <!-- <a target="_blank" href="/video/1430" class="J-media-item studyvideo">1-1 Java简介 (05:49)
                                    <button class="r moco-btn moco-btn-blue preview-btn">预览</button>
                                </a> -->
                            </li>
                            <li data-media-id="75">
                                <a href="/code/75" class="J-media-item">
                                    <i class="icon-code type"></i>
                                    1-7 了解HTML的代码注释

                                    <button class="r moco-btn moco-btn-red preview-btn">开始学习</button>

                                </a>
                                <!-- 未登录时 -->
                                <!-- <a target="_blank" href="/video/1430" class="J-media-item studyvideo">1-1 Java简介 (05:49)
                                    <button class="r moco-btn moco-btn-blue preview-btn">预览</button>
                                </a> -->
                            </li>
                        </ul>
                        <!-- 章节小节 end -->
                    </div>
                </div>
                <!-- 课程章节 end -->

            </div><!--content end-->
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
</body>
</html>
