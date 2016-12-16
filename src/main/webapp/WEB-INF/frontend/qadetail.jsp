<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="renderer" content="webkit">
    <link href="${pageContext.request.contextPath}/static/public/css/qadetail/common.css" rel="stylesheet"/>
    <link href="${pageContext.request.contextPath}/static/public/css/qadetail/layer.css" rel="stylesheet"/>
    <title>qadetail </title>
</head>
<body>
<%--头部--%>
<jsp:include page="include/header.jsp"></jsp:include>
<%--头部end--%>
<!--内容-->
<div id="main">

    <div class="container qa-container clearfix">
        <!--左边内容-->
        <div class="qa-left l">
            <div class="qa-left-wrap">

                <div class="qa-header">
                    <div class="qa-header-right r">
                        <!-- follow -->
                        <a href="javascript:void(0)" data-id="187799" class="l wenda-add-collection js-collection-btn">
                            <i class="icon-heart" style="    line-height: 1.2px;"></i>
                        </a>
                        <span class="care l">关注</span>
                    </div>

                    <a href="/u/4558558/bbs" target="_blank" class="qa-author">
                        <img src="http://img.mukewang.com/user/54584cfb0001308402200220-40-40.jpg" width="40" height="40"> 慕粉1514285489
                    </a>
                </div>

                <div class="qa-content" data-qid="187799">

                    <div class="qa-content-inner imgPreview">
                        <div id="js-content-main">
                            <h1 class="js-qa-wenda-title qa-wenda-title">求解释！！！！！！！！！！</h1>
                            <div id="js-qa-content" class="qa-disscus rich-text">
                                <p>为什么在中间两列布局基础上，再在div中加上两个div后，只显示在中间，并且只有一个布局？？？         </p>
                            </div>
                        </div>
                    </div>

                    <div class="qa-content-addon clearfix">
                        <span class="qa-createtime l">3天前</span>
                        <!--来源-->
                        <a href="#" class="qa-course-from"> 源自：如何用CSS进行网页布局... 5-1</a>
                        <!--来源end-->
                        <span class="qa-view-num r">13 浏览</span>
                        <span class="qa-total-comment r">1 回答</span>
                    </div>

                </div>

                <div class="qa-comments" data-title="求解释！！！！！！！！！！">
                    <!--回答-->
                    <div class="qa-comment js-qa-comment" data-cid="282305" id="id_282305">
                        <div class="qa-comment-wrap clearfix ">
                            <div class="qa-comment-author">
                                <a href="/u/3871685/bbs" title="李白_三圣">
                                    <img src="http://img.mukewang.com/user/545862fe00017c2602200220-40-40.jpg" width="40" height="40">
                                    <span class="qa-comment-nick">李白_三圣</span>
                                </a>
                            </div>
                            <div class="qa-comment-d ">
                                <!-- <div class="qa-triangle-left"><i></i></div> -->
                                <div class="qa-comment-inner">
                                    <div class="qa-comment-c imgPreview">
                                        <div class="rich-text">
                                            <p>没有看到你的代码吗，无法准确回到。但估计应该是没有浮动<br></p>
                                        </div>
                                    </div>
                                    <div class="dianzan qa-comment-addon">
                                        <span class="qa-comment-time">2天前</span>
                                        <div class="qa-comment-addon-r">
                                            <span class="qa-total-reply js-reply-item-reply">
                                                <i class="icon-msg"></i>
                                                <span class="js-qa-tr-num">回复</span>
                                            </span>
                                            <a title="赞" href="javascript:;"
                                               class="js-pl-praise js-qa-comment-support qa-comment-support  js-qacom-supported-user" data-ids="187799-282305">
                                                <i class="icon-thumb-revert "></i>
                                                <span>0</span>
                                            </a>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <!--回复-->
                        <div class="qa-reply">
                            <div class="qa-reply-header"></div>
                            <div class="qa-replies">
                                <div class="qa-reply-c">
                                    <!--  <p class="qa-reply-loading">
                                        加载中...
                                    </p>  -->
                                    <!-- 默认显示三条回复的回复 -->

                                </div>

                                <!-- 回复框 -->
                                <div class="js-qa-reply-ibox qa-reply-ibox  clearfix" style="display:none">
                                    <div class="qa-reply-iavator l">
                                        <a href="/u/1361691/id" title="哈米的小宇宙">
                                            <img src="http://img.mukewang.com/user/552133900001743101800180-40-40.jpg" width="40" height="40">
                                        </a>
                                    </div>
                                    <div class="qa-reply-iwrap">
                                        <div class="qa-reply-iarea">
                                            <textarea name="" id="" class="js-reply-ipt-default ipt" placeholder="写下你的评论..."></textarea>
                                        </div>
                                    </div>
                                    <div class="qa-reply-ifoot clearfix">
                                        <div class="qa-reply-footright r">
                                            <span class="qa-tips"></span>
                                            <button class="btn-normal btn-mini js-ipt-cancel" onclick="closetextarea(this)">取消</button>
                                            <button class="btn-mini btn-green  js-ipt-submit">提交</button>
                                        </div>
                                    </div>
                                </div>

                            </div>
                        </div>
                        <!--回复-->
                    </div>
                    <!--回答-->

                </div>
                <!--编辑-->
                <div id="js-qa-comment-input" class="qa-comment-input js-msg-context  clearfix">
                    <div class="js-qa-reply-ibox qa-reply-ibox  clearfix"  style="border-bottom: none; padding: 0px;">
                        <div class="qa-reply-iavator l">
                            <a href="#" title="哈米的小宇宙">
                                <img src="http://img.mukewang.com/user/552133900001743101800180-40-40.jpg" width="40" height="40">
                            </a>
                        </div>
                        <div class="qa-reply-iwrap">
                            <div class="qa-reply-iarea">
                                <textarea name="" id="" class="js-reply-ipt-default ipt" style="height: 136px;" placeholder="写下你的评论..."></textarea>
                            </div>
                        </div>
                        <div class="qa-reply-ifoot clearfix">
                            <div class="qa-reply-footright r">
                                <span class="qa-tips"></span>
                                <!--<button class="btn-normal btn-mini js-ipt-cancel" onclick="closetextarea(this)">取消</button>-->
                                <button class="btn-mini btn-green  js-ipt-submit">回答</button>
                            </div>
                        </div>
                    </div>
                </div>
                <!--编辑end-->
            </div>
        </div>
        <!--左边内容end-->
        <!--右边内容-->
        <div class="qa-right r">
            <div class="wenda-slider">
                <!-- pub new ques -->
                <div class="newques-container">
                    <a href="#" class="newques-btn" id="js-newques" target="_blank"><!--<i class="icon-addques"></i>-->发新问题</a>
                </div>
                <!--user info-->
                <div class="wenda-my">
                    <div class="user-info">
                        <a class="user-img" href="#">
                            <img src="http://img.mukewang.com/552133900001743101800180-100-100.jpg" alt="哈米的小宇宙">
                        </a>
                        <p class="username">哈米的小宇宙</p>
                        <a href="/u/1361691/credit" target="_blank" class="credit-count">我的积分：1</a>
                    </div>

                </div>

                <div class="panel about-ques">
                    <div class="panel-heading">
                        <h2 class="panel-title">相关问题</h2>
                    </div>
                    <div class="panel-body clearfix">
                        <div class="mkhotlist padtop"><a href="#" target="_blank">焦点图不跳转，求大神赐教呀</a></div>
                        <div class="mkhotlist "><a href="#" target="_blank">为什么用&lt;a&gt;标签</a></div>
                        <div class="mkhotlist "><a href="#" target="_blank">设置这个padding的时候，内容输入了中文和英语他不在一行显示呢</a></div>
                        <div class="mkhotlist "><a href="#" target="_blank">我按照要求写了结果在运行的时候点链接老师弹出空白页</a></div>
                        <div class="mkhotlist bordbottom"><a href="#" target="_blank">想要做成左右结构的，要写p</a></div>
                    </div>
                </div>

                <!-- reply rank -->
                <!-- course relations -->
            </div>
        </div>
        <!--右边内容end-->
    </div>

</div>
<!--内容-->
<%--尾部--%>
<jsp:include page="include/footer.jsp"></jsp:include>
<%--尾部end--%>
<!--加载js-->
<script src="${pageContext.request.contextPath}/static/public/js/jquery-1.11.2.min.js"></script>
<script type="text/javascript">
    /*回复*/
    $('.js-qa-tr-num').on('click',function (e) {
        e.preventDefault();
        $(this).parents('div').parents('div').parents('div').parents('div').parents('div').next().children().next().children().next().attr('style','display:block;');
    });
    function closetextarea(obj) {
        $(obj).parent('div').parent('div').parent('div').attr('style','display:none;');

    }
    /*回复end*/
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
</script>
</body>
</html>
