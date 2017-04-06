<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="renderer" content="webkit">
    <link href="${pageContext.request.contextPath}/static/public/css/video/common.css" rel="stylesheet"/>
    <link href="${pageContext.request.contextPath}/static/public/css/video/video-js.css" rel="stylesheet"/>
    <meta charset="UTF-8">
    <title>video</title>
</head>
<body>
<%--头部--%>
<jsp:include page="include/header.jsp"></jsp:include>
<%--头部end--%>
<!--视频内容-->
<div id="studyMain">
    <!---->
    <div id="bgarea" class="video-con">
        <div class="js-box-wrap" style="width: 100%; height: 269px;">
            <div id="J_Box" class="course-video-box" name="<c:out value='${catalog.courseId}'/>">
                <video id="example_video_1" name="<c:out value='${catalog.id}'/>" class="js-box-wrap video-js vjs-default-skin" controls  style="width: 100%; height: 269px;"
                       poster="/OnlineCourseFronten/file/get?url=<c:out value='${catalog.previewImage}'/>" ata-setup="{}">
                    <source src="/OnlineCourseFronten/file/get?url=<c:out value='${catalog.url}'/>" type='video/mp4' />
                    <%--<source src="http://vjs.zencdn.net/v/oceans.webm" type='video/webm' />--%>
                    <%--<source src="http://vjs.zencdn.net/v/oceans.ogv" type='video/ogg' />--%>
                    <track kind="captions" src="${pageContext.request.contextPath}/static/staticWEB/fonts/captions.vtt" srclang="en" label="English" />
                </video>
            </div>
        </div>
        <!--此处结构为练习题，视频，编程公用的侧栏-->
        <!--<div class="section-list">
            <div class="operator">
                <div class="op chapter"><em class="icon-menu"></em>章节</div>
                <div class="op notes"><em class="icon-note"></em>笔记</div>
                <div class="op question"><em class="icon-addques"></em>提问</div>
                <div class="op wiki"><em class="icon-wiki"></em>WIKI</div>
            </div>
            <div class="nano has-scrollbar">
                <div class="nano-content" tabindex="0" style="right: -17px;">
                    <h3>PHP进阶篇-函数</h3>
                    <ul>
                        <li class="sec-title">
                            <span>第1章 PHP中函数简介</span>
                        </li>
                        <li data-id="13095">
                            <a href="#"><i class=""><em class="icon-nolearn"></em></i><em class="icon-video"></em>1-1
                                PHP函数的简介(05:34)</a>
                        </li>
                    </ul>
                    <ul>
                        <li class="sec-title">
                            <span>第2章 PHP自定义函数的使用</span>
                        </li>
                        <li data-id="13103">
                            <a href="#"><i class=""><em class="icon-nolearn"></em></i><em class="icon-video"></em>2-1
                                PHP中如何自定义函数及调...(19:44)</a>
                        </li>
                        <li data-id="13105">
                            <a href="#"><i class=""><em class="icon-nolearn"></em></i><em class="icon-video"></em>2-2
                                PHP中函数的返回值(07:35)</a>
                        </li>
                        <li data-id="13107">
                            <a href="#"><i class=""><em class="icon-nolearn"></em></i><em class="icon-video"></em>2-3
                                PHP中函数参数详解(17:10)</a>
                        </li>
                        <li data-id="13108">
                            <a href="#"><i class=""><em class="icon-nolearn"></em></i><em class="icon-video"></em>2-4
                                PHP中变量的作用域解析...(19:42)</a>
                        </li>
                        <li data-id="13157">
                            <a href="#"><i class=""><em class="icon-nolearn"></em></i><em class="icon-video"></em>2-5
                                PHP函数的传值和传引用的...(07:45)</a>
                        </li>
                    </ul>
                    <ul>
                        <li class="sec-title">
                            <span>第3章 PHP特殊形式函数剖析</span>
                        </li>
                        <li data-id="13153">
                            <a href="#"><i class="">正在学<em class="icon-clock"></em></i><em class="icon-video"></em>3-2
                                PHP中可变函数的使用...(04:52)</a>
                        </li>
                        <li data-id="13154">
                            <a href="#"><i class=""><em class="icon-nolearn"></em></i><em class="icon-video"></em>3-3
                                PHP中回调函数的使用...(18:26)</a>
                        </li>
                        <li data-id="13155">
                            <a href="#"><i class=""><em class="icon-nolearn"></em></i><em class="icon-video"></em>3-4
                                PHP中匿名函数的使用...(07:39)</a>
                        </li>
                        <li data-id="13156">
                            <a href="#"><i class=""><em class="icon-nolearn"></em></i><em class="icon-video"></em>3-5
                                PHP中递归函数的使用...(11:00)</a>
                        </li>
                    </ul>
                    <ul>
                        <li class="sec-title">
                            <span>第4章 PHP中使用自定义函数</span>
                        </li>
                        <li data-id="13158">
                            <a href="#"><i class=""><em class="icon-nolearn"></em></i><em class="icon-video"></em>4-1
                                PHP中使用自定义函数...(12:49)</a>
                        </li>
                    </ul>
                    <ul>
                        <li class="sec-title">
                            <span>第5章 PHP函数实战</span>
                        </li>
                        <li data-id="13159">
                            <a href="#"><i class=""><em class="icon-nolearn"></em></i><em class="icon-video"></em>5-1
                                PHP函数实战(16:51)</a>
                        </li>
                    </ul>

                </div>
                <div class="nano-pane" style="display: block;">
                    <div class="nano-slider" style="height: 65px; transform: translate(0px, 131.857px);"></div>
                </div>
            </div>
        </div>-->
    </div>
    <!---->
    <!---->
    <div class="maybe-wenda" id="maybe-wenda" style="display: none;">
        <i class="icon-chat"></i>
        <p class="text">你发的评论可能会是问题？<br>是否将他发到问答中</p>
        <input class="btn ok" type="button" value="好的" id="wenda-ok">
        <input class="btn no" type="button" value="不用" id="wenda-no">
    </div>
    <!---->
</div>
<!--视频内容end-->
<!--内容-->
<div class="course-subcontainer clearfix">
    <div class="course-left">
        <ul class="courseul course-menu course-video-menu clearfix js-course-menu" data-ower="all" data-sort="last"
            style="position: absolute; left: 0px;">
            <li class="course-menu-item"><a class="active" href="javascript:void(0)" id="plMenu">评论</a></li>
            <%--<li class="course-menu-item"><a href="javascript:void(0)" id="qaMenu">问答</a></li>--%>
        </ul>
        <div id="disArea" class="lists-container list-wrap">
            <div id="pl-content" class="list-tab-con">
                <div class="publish clearfix" id="discus-publish">
                    <div class="publish-wrap publish-wrap-pl">
                        <div class="pl-input-wrap clearfix">
                            <a href="/u/1361691" class="user-head l">
                                <c:if test="${iconUrl!=null && iconUrl!=''}">
                                    <img src="/OnlineCourseFronten/file/get?url=<c:out value='${iconUrl}'/>" alt="">
                                </c:if>
                                <c:if test="${iconUrl==null || iconUrl==''}">
                                    <img src="/OnlineCourseFronten/static/staticWEB/img/default.png" alt="">
                                </c:if>

                            </a>
                            <div id="js-pl-input-fake" class="pl-input-inner l">
                                <textarea id="js-pl-textarea" class="js-placeholder"
                                          placeholder="内容"></textarea>
                                <span class="num-limit"><span id="js-pl-limit">0</span>/127</span>
                            </div>
                            <div class="pl-input-btm input-btm clearfix">
                                <div class="verify-code l"></div>
                                <input type="button" id="js-pl-submit" class="r course-btn" value="发表评论">
                            </div>
                        </div>

                    </div>
                </div>

                <div id="plLoadListData">
                    <div class="pl-container">
                        <!--内容-->
                        <ul>
                        </ul>
                        <!--内容end-->
                    </div>
                    <div class="page pl-list-page">
                    </div>
                </div>
            </div>
            <%--<div id="qa-content" class="list-tab-con" style="display:none">
                <div id="qaLoadListData">
                    <div class="sortlist">
                        <div class="ordertab clearfix">
                            <a href="javascript:void(0)" hidefocus="true" data-order="1"
                               class="quealltab onactive">全部</a>
                            <a href="javascript:void(0)" hidefocus="true" data-order="2" class="quealltab ">精华</a>
                        </div>
                    </div>
                    <div class="answertabcon">
                        <!--问答内容-->
                        <div class="wenda-listcon clearfix">
                            <div class="headslider l"><a href="/u/4263213/courses" class="wenda-head" target="_blank"
                                                         title="慕粉4263213"> <img
                                    src="http://img.mukewang.com/545865c30001a2d802200220-80-80.jpg" alt="慕粉4263213"
                                    width="40"> <i class="icon-tick-revert isfinish"></i> </a></div>
                            <div class="wendaslider">
                                <h2 class="wendaquetitle"><a href="/u/4263213/courses" target="_blank" title="慕粉4263213"
                                                             class="wenda-nickname">慕粉4263213</a>
                                    <div class="wendatitlecon"><a href="/qadetail/182313" target="_blank"
                                                                  class="wendatitle"> <b> div不是块状元素标签吗？为什么行内元素设置居中
                                        文本前面是div标签？ </b> </a> <span class="wait-answer">+<strong>1积分</strong></span>
                                    </div>
                                </h2>
                                <div class="replycont clearfix">
                                    <div class="fl replydes"><span class="replysign adopt">[已采纳  <a
                                            href="/space/u/uid/3253882" target="_blank" title="qq_凌安年_03253882"
                                            class="nickname">qq_凌安年_03253882 </a> 的回答] </span> <span class="replydet">div是分层用的，可以用class属性更好的控制该层内容</span>
                                    </div>
                                </div>
                                <div class=" replymegfooter clearfix">
                                    <div class="wenda-time l"><em>时间：2016-11-17</em></div>
                                    <a href="${pageContext.request.contextPath}/qadetail/showQadetail" target="_blank" class="replynumber r hasanswernum">
                                        <span class="ys">
                                            <b class="numShow">2</b>
                                            <span class="number">回答</span>
                                        </span>
                                        <span class="browsenum">
                                            <b class="numShow">108</b>
                                            <span class="number">浏览</span>
                                        </span>
                                    </a>
                                </div>
                            </div>
                        </div>
                        <!--问答内容end-->
                    </div>
                    <!--分页-->
                    <div class="page discuss-list-page">
                        <span class="disabled_page">首页</span><span
                            class="disabled_page">上一页</span>
                        <a href="javascript:void(0)" data-page="1" class="active text-page-tag">1</a>
                        <a href="javascript:void(0)" data-page="2" class="text-page-tag">2</a>
                        <a href="javascript:void(0)" data-page="3" class="text-page-tag">3</a>
                        <a href="javascript:void(0)" data-page="4" class="text-page-tag">4</a>
                        <a href="javascript:void(0)" data-page="5" class="text-page-tag">5</a>
                        <a href="javascript:void(0)" data-page="2">下一页</a>
                        <a href="javascript:void(0)" data-page="9">尾页</a>
                    </div>
                    <!--分页end-->
                    <!--<div class="page discuss-list-page"></div>-->
                </div>
            </div>--%>
        </div>
    </div>
    <div class="course-right clearfix">

        <div class="js-recom-box">
            <div class="box  mb40"><h4>其他资源下载</h4>
                <ul class="js-planrecom other-list">
                    <c:if test="${otherDocuments==null}">
                        <li><a href="#"><span class="name autowrap">无其他资源</span></a></li>
                    </c:if>
                    <c:if test="${otherDocuments!=null}">
                        <c:forEach var="document" items="${otherDocuments}">
                            <li>
                                <a href="/OnlineCourseFronten/file/get?url=<c:out value='${document.url}'/>" target="_blank">
                                    <span class="name autowrap"><c:out value='${document.name}'/></span>
                                </a>
                            </li>
                        </c:forEach>
                    </c:if>
                </ul>
            </div>
            <div class="box  mb40"><h4>推荐课程</h4>
                <ul class="js-courserecom other-list">
                    <li><a href="//coding.imooc.com/class/71.html" target="_blank"> <span class="name autowrap">算法与数据结构C++精解</span>
                    </a></li>
                    <li><a href="//coding.imooc.com/class/57.html" target="_blank"> <span class="name autowrap">Yii2.0打造完整电商平台</span>
                    </a></li>
                    <li><a href="/learn/36" target="_blank"> <span class="name autowrap">JavaScript入门篇</span> </a></li>
                    <li><a href="/learn/260" target="_blank"> <span class="name autowrap">通过自动回复机器人学Mybatis---加强版</span>
                    </a></li>
                    <li><a href="/learn/40" target="_blank"> <span class="name autowrap">前端开发工具技巧介绍—Sublime篇</span> </a>
                    </li>
                </ul>
            </div>
        </div>
        <div class="wendalist js-right-wenda" style="display: block;">
            <div class="course-right-title">
                <h3>猿问推荐</h3>
                <a href="/wenda/?block_id=tuijian_yw" target="_blank" class="more">更多</a>
            </div>

            <ul>
                <li><a href="/wenda/detail/337941?block_id=tuijian_yw" target="_blank">世界上最好的语言是什么？</a><i>14 回答</i></li>
                <li><a href="/wenda/detail/338038?block_id=tuijian_yw" target="_blank">win8服务器 apach+php+MySQL
                    配置的详细步骤大家...</a><i>1 回答</i></li>
                <li><a href="/wenda/detail/337942?block_id=tuijian_yw" target="_blank">多选除了input的CheckBox还有其他的吗？</a><i>3
                    回答</i></li>
                <li><a href="/wenda/detail/337937?block_id=tuijian_yw" target="_blank">打了这行代码没显示东西</a><i>3 回答</i></li>
                <li><a href="/wenda/detail/338004?block_id=tuijian_yw" target="_blank">PHP学习有什么好的方法吗？</a><i>1 回答</i>
                </li>
            </ul>
        </div>
        <div class="articlelist js-right-article" style="display: block;">
            <div class="course-right-title">
                <h3>手记推荐</h3>
                <a href="/article/?block_id=tuijian_wz" target="_blank" class="more">更多</a>
            </div>
            <div class="course-right-content">

            </div>
            <ul>
                <li><a href="/article/15080?block_id=tuijian_wz" target="_blank">cookie与session的详细区别</a></li>
                <li><a href="/article/15027?block_id=tuijian_wz" target="_blank">isset、empty和is_null的区别</a></li>
                <li><a href="/article/15021?block_id=tuijian_wz" target="_blank">小白如何快速搭建属于自己的网站</a></li>
                <li><a href="/article/14995?block_id=tuijian_wz" target="_blank"><img
                        src="http://img.mukewang.com/5842d01d00015dac08380520-40-40.jpg" width="40" height="40">
                    <div>来吧！教你配置Nginx的HTTPS服务</div>
                </a></li>
                <li><a href="/article/14992?block_id=tuijian_wz" target="_blank">中间件为何不起作用——中间件的位置</a></li>
            </ul>
        </div>
    </div>
</div>
<!--内容end-->
<%--尾部--%>
<jsp:include page="include/footer.jsp"></jsp:include>
<%--尾部end--%>
<!--加载js-->
<script src="${pageContext.request.contextPath}/static/public/js/jquery-1.11.2.min.js"></script>
<script src="${pageContext.request.contextPath}/static/public/js/video/video.js"></script>
<script src="${pageContext.request.contextPath}/static/public/js/video/video-comment.js"></script>
<script type="text/javascript">
    /*评论js*/
    /*评价textarea框*/
    $("#js-pl-input-fake").on("click", function (e) {
        e.preventDefault();
        $(this).addClass('ipt-fake-focus');
    });
    $("#js-pl-textarea").blur(function (e) {
        e.preventDefault();
        $("#js-pl-input-fake").removeClass('ipt-fake-focus');
    });
    /*评价textarea框*/
    /*点赞*/
    $('.dianzan a').on('click', function (e) {
        e.preventDefault();
        var title = $(this).attr('title');
        var span = $(this).children('span').text();
        if (title == '赞') {
            $(this).attr('title', '取消赞');
            var newspan = parseInt(span) + parseInt(1);
            $(this).children('span').html(newspan);
        }
        if (title == '取消赞') {
            $(this).attr('title', '赞');
            var newspan = parseInt(span) - parseInt(1);
            $(this).children('span').html(newspan);
        }
    })
    /*点赞*/
    /*评论js*/
    /*选择内容*/
    $('.courseul li a').on('click', function (e) {
        e.preventDefault();
        var id = $(this).attr('id');
        if (id == 'plMenu') {
            $("#plMenu").addClass('active');
            document.getElementById('pl-content').style.display = 'block';
        } else {
            $("#plMenu").removeClass('active');
            document.getElementById('pl-content').style.display = 'none';
        }
        if (id == 'qaMenu') {
            $("#qaMenu").addClass('active');
            document.getElementById('qa-content').style.display = 'block';
        } else {
            $("#qaMenu").removeClass('active');
            document.getElementById('qa-content').style.display = 'none';
        }
    });
    /*选择内容*/
    /*问答js*/
    /*浏览*/
    $('.liulanqa a').on('click', function (e) {
        e.preventDefault();


    })
    /*浏览*/
    /*问答js-end*/
    /*笔记.js*/
    $(".switchon div").on("click", function (e) {
        e.preventDefault();
        var id = $(this).attr('id');

        if (id == 'switchon') {
            var parent = $(this).parent();
            if (parent.hasClass("on")) {
                $('.switchon').removeClass('on');
            } else {
                $('.switchon').addClass('on');
            }
        }
    })
    /*笔记.js*/
</script>
</body>
</html>
