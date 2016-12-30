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
            <div id="course-list" class="js-course-list my-space-course study-tl">
                <%--第一条内容--%>
                <div class="clearfix tl-item  tl-item-first">
			            <span class="time">
                <b>2016</b>
                <em>12月23日</em>
            </span>
                    <div class="course-list course-list-m">
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
                <%--内容--%>
                <div class="clearfix tl-item ">
			            <span class="time">
                <b>2016</b>
                <em>12月17日</em>
            </span>
                    <div class="course-list course-list-m">
                        <ul class="clearfix">
                            <li class="course-one" data-courseid="740" data-uid="1361691">
                                <div class="course-list-img l">
                                    <a href="/learn/740" target="_blank">
                                        <img width="200" height="113" alt="带你实现别样的Android侧滑菜单"
                                             src="http://img.mukewang.com/57feff6700012aa806000338-240-135.jpg">
                                    </a>
                                </div>
                                <div class="course-list-cont">
                                    <h3 class="study-hd">
                                        <a href="/learn/740" target="_blank">带你实现别样的Android侧滑菜单</a>

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
                                        <span class="i-mid span-common">用时10小时 3分</span>
                                        <span class="i-right span-common">学习至1-1 Android侧滑菜单之DrawerLa...</span>
                                    </div>
                                    <div class="catog-points">
                                        <span class="i-left span-common"><a
                                                href="/u/1361691/course/740/notes">笔记 <i>0</i></a></span>
                                        <span class="i-mid span-common"><a
                                                href="/u/1361691/course/740/codes">代码 <i>0</i></a></span>
                                        <span class="i-right span-common"><a
                                                href="/u/1361691/course/740/questions">问答 <i>0</i></a></span>

                                        <a href="/video/13124" target="_blank" class="btn-red continute-btn">继续学习</a>

                                    </div>
                                </div>


                            </li>
                        </ul>
                    </div>
                </div>
                <%--内容end--%>
                <%--最后内容--%>
                <div class="clearfix tl-item ">
			            <span class="time">
                <b>2016</b>
                <em>06月05日</em>
            </span>
                    <div class="course-list course-list-m">
                        <ul class="clearfix">
                            <li class="course-one" data-courseid="334" data-uid="1361691">
                                <div class="course-list-img l">
                                    <a href="/learn/334" target="_blank">
                                        <img width="200" height="113" alt="Hibernate初探之一对多映射"
                                             src="http://img.mukewang.com/55657b3b0001e78d06000338-240-135.jpg">
                                    </a>
                                </div>
                                <div class="course-list-cont">
                                    <h3 class="study-hd">
                                        <a href="/learn/334" target="_blank">Hibernate初探之一对多映射</a>

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
                                        <span class="i-mid span-common">用时 0分</span>
                                        <span class="i-right span-common">学习至5-5 测试MyEclipse生成效果</span>
                                    </div>
                                    <div class="catog-points">
                                        <span class="i-left span-common"><a
                                                href="/u/1361691/course/334/notes">笔记 <i>0</i></a></span>
                                        <span class="i-mid span-common"><a
                                                href="/u/1361691/course/334/codes">代码 <i>0</i></a></span>
                                        <span class="i-right span-common"><a
                                                href="/u/1361691/course/334/questions">问答 <i>0</i></a></span>

                                        <a href="/video/8760" target="_blank" class="btn-red continute-btn">继续学习</a>

                                    </div>
                                </div>


                            </li>
                        </ul>
                    </div>
                </div>
                <%--最后内容--%>
                <div class="clearfix tl-item  tl-item-last">
			            <span class="time">
                <b>2016</b>
                <em>03月17日</em>
            </span>
                    <div class="course-list course-list-m">
                        <ul class="clearfix">
                            <li class="course-one" data-courseid="140" data-uid="1361691">
                                <div class="course-list-img l">
                                    <a href="/learn/140" target="_blank">
                                        <img width="200" height="113" alt="移动端的WEB相册"
                                             src="http://img.mukewang.com/53acc68600017f4506000338-240-135.jpg">
                                    </a>
                                </div>
                                <div class="course-list-cont">
                                    <h3 class="study-hd">
                                        <a href="/learn/140" target="_blank">移动端的WEB相册</a>

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
                                        <span class="i-left span-common">已学73%</span>
                                        <span class="i-mid span-common">用时 5小时29分</span>
                                        <span class="i-right span-common">学习至3-6 查看大图功能实现</span>
                                    </div>
                                    <div class="catog-points">
                                        <span class="i-left span-common"><a
                                                href="/u/1361691/course/140/notes">笔记 <i>0</i></a></span>
                                        <span class="i-mid span-common"><a
                                                href="/u/1361691/course/140/codes">代码 <i>0</i></a></span>
                                        <span class="i-right span-common"><a
                                                href="/u/1361691/course/140/questions">问答 <i>0</i></a></span>

                                        <a href="/video/2248" target="_blank" class="btn-red continute-btn">继续学习</a>

                                    </div>
                                </div>


                            </li>
                        </ul>
                    </div>
                </div>
            </div>
            <%--我的课程--%>
            <%--我的收藏--%>
            <div id="favorite-list" class="course-list course-list-m js-course-list" style="display: none;">
                <ul class="clearfix">
                    <li class="course-one" data-courseid="156" data-uid="1361691">
                        <div class="course-list-img l">
                            <a href="/learn/156" target="_blank">
                                <img width="200" height="113" alt="AngularJS实战" src="http://img.mukewang.com/5707699500012d5a06000338-240-135.jpg">
                            </a>
                        </div>
                        <div class="course-list-cont">
                            <h3 class="study-hd">
                                <a href="/learn/156" target="_blank">AngularJS实战</a>
                                <span class="i-new">更新完毕</span>
                                <!-- 更新完毕 -->
                                <!-- 关注和分享 -->
                                <div class="share-box clearfix">
                                    <div class="show-btn"><i class="icon-down2"></i></div>
                                    <div class="share-box-con share-r">
                                        <div class="bdsharebuttonbox bdshare-button-style0-16" data-tag="share_156" data-id="156" data-bd-bind="1483086631617">
                                            <a class="bds_weixin icon-share-weichat" data-cmd="weixin" title="分享到微信"></a>
                                            <a class="bds_tsina icon-share-weibo" data-cmd="tsina" title="分享到新浪微博"></a>
                                            <a class="bds_qzone icon-share-qq" data-cmd="qzone" href="#" title="分享到QQ空间"></a>
                                        </div>
                                        <a href="javascript:;" title="取消收藏" class="follow"><i class="icon icon-star2"></i></a>
                                    </div>
                                </div>
                            </h3>
                            <div class="study-points">

                                <span class="i-left span-common">已学0%</span>
                                <span class="i-mid span-common">用时19分</span>
                                <span class="i-right span-common">学习至1-2 快速上手</span>

                            </div>

                            <div class="catog-points">
                                <span class="i-left span-common"><a href="/u/1361691/course/156/notes">笔记 <i>0</i></a></span>
                                <span class="i-mid span-common"><a href="/u/1361691/course/156/codes">代码 <i>0</i></a></span>
                                <span class="i-right span-common"><a href="/u/1361691/course/156/questions">问答 <i>0</i></a></span>

                                <a href="/video/4441" target="_blank" class="btn-red continute-btn">继续学习</a>

                            </div>
                        </div>
                    </li><li class="course-one" data-courseid="782" data-uid="1361691">
                    <div class="course-list-img l">
                        <a href="/learn/782" target="_blank">
                            <img width="200" height="113" alt="Android-实用的App换肤功能" src="http://img.mukewang.com/5863529b0001b33106000338-240-135.jpg">
                        </a>
                    </div>
                    <div class="course-list-cont">
                        <h3 class="study-hd">
                            <a href="/learn/782" target="_blank">Android-实用的App换肤功能</a>
                            <span class="i-new">更新至5-1</span>
                            <!-- 关注和分享 -->
                            <div class="share-box clearfix">
                                <div class="show-btn"><i class="icon-down2"></i></div>
                                <div class="share-box-con share-r">
                                    <div class="bdsharebuttonbox bdshare-button-style0-16" data-tag="share_782" data-id="782" data-bd-bind="1483086631647">
                                        <a class="bds_weixin icon-share-weichat" data-cmd="weixin" title="分享到微信"></a>
                                        <a class="bds_tsina icon-share-weibo" data-cmd="tsina" title="分享到新浪微博"></a>
                                        <a class="bds_qzone icon-share-qq" data-cmd="qzone" href="#" title="分享到QQ空间"></a>
                                    </div>
                                    <a href="javascript:;" title="取消收藏" class="follow"><i class="icon icon-star2"></i></a>
                                </div>
                            </div>
                        </h3>
                        <div class="study-points">

                            <span class="i-left span-common">已学0%</span>
                            <span class="i-mid span-common">用时 0分</span>
                            <span class="i-right span-common">学习至1-1 课程介绍(1)</span>

                        </div>

                        <div class="catog-points">
                            <span class="i-left span-common"><a href="/u/1361691/course/782/notes">笔记 <i>0</i></a></span>
                            <span class="i-mid span-common"><a href="/u/1361691/course/782/codes">代码 <i>0</i></a></span>
                            <span class="i-right span-common"><a href="/u/1361691/course/782/questions">问答 <i>0</i></a></span>

                            <a href="/video/13881" target="_blank" class="btn-red continute-btn">继续学习</a>

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
