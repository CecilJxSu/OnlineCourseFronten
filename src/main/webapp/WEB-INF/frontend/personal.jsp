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
            <div id="favorite-list" class="comment-favorite-list course-list course-list-m js-course-list" style="display: none;">
            </div>
            <%--收藏end--%>
            <%--通知--%>
            <div id="notice-list" class="comment-notice-list notice-list comment-message-list" style="display:none">
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
                            nowPage = 1;main_favorite();
                            break;
            case 'notices':$('#favorite-list').css('display','none');$('#course-list').css('display','none');$('#notice-list').css('display','block');
                            $('#course').removeClass('active');$('#favorite').removeClass('active');$('#notices').addClass('active');
                            nowPage = 1;main_message();
                            break;

        }    })
    /*table标签实现end*/

    /************** start：课程列表***********/
    //默认当前页(不可动)
    var nowPage = 1;
    //默认最大页数(不可动)
    var maxPage = 1;

    //ajax入口
    //课程
    function main_course() {
        var url = '/OnlineCourseFronten/message/course/get';
        var data = {
            nowPage : nowPage
        };
        getData_course(url,data);
    }
    //收藏
    function main_favorite() {
        var url = '/OnlineCourseFronten/message/favorite/get';
        var data = {
            nowPage : nowPage
        };
        getData_favorite(url,data);
    }
    //消息
    function main_message() {
        var url = '/OnlineCourseFronten/message/message/get';
        var data = {
            nowPage : nowPage
        };
        getData_message(url,data);
    }

    //页面加载完成时触发
    $(function () {
        main_course();
//        main_favorite();
//        main_message();
    });

    //ajax(不可动)
    //课程
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
    //收藏
    function getData_favorite(url,data){
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
                jsonToHtml_favorite(data);
            },
            error:function (e) {
                errBack();
            }
        });
    }
    //消息
    function getData_message(url,data){
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
                jsonToHtml_message(data);
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
    //课程
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
    //收藏
    function jsonToHtml_favorite(data) {
        var html = '';
            html+='<ul class="clearfix">\n';
        $.each( data.returnDate, function(index, content)
        {
                html+='<li class="course-one" data-courseid="156" data-uid="1361691">\n';
                html+='<div class="course-list-img l">\n';
                <%--用户头像--%>
                html+='<a href="" target="_blank">\n';
                if (content.iconurl==null || content.iconurl==""){
                    html +='<img style="width: 70px;height: 70px;border-radius: 100px;"  src="/OnlineCourseFronten/static/staticWEB/img/default.png" title="JavaScript">\n';

                }else {
                    html +='<img style="width: 70px;height: 70px;border-radius: 100px;"  src="/OnlineCourseFronten/file/get?url='+content.iconurl+'" title="JavaScript">\n';
                }
                html+='</a>\n';
                <%--用户头像end--%>
                <%--用户账号--%>
            html+='<div style="padding: 10px 2px 10px 7px;">\n';
            html+='<a style="font-size: 16px;">'+content.username+'</a>\n';
            html+='</div>\n';
                <%--用户账号end--%>
            html+='</div>\n';
            html+='<div class="course-list-cont" style="padding-left: 130px;">\n';
                <%--话题标题--%>
            html+='<h3 class="study-hd">\n';
            html+='<a href="/OnlineCourseFronten/commentdetail/show?id='+content.chat.id+'" target="_blank" style="color: #14191e;">'+content.chat.title+'</a>\n';
            html+='</h3>\n';
                <%--话题标题end--%>
                <%--内容--%>
            html+='<div class="study-points" style="display: inline-table;">\n';
            html+='<span class="i-left span-common" style="color: #1D1D20;font-size: 18px;">'+content.chat.content+'</span>\n';
            html+='</div>\n';
                <%--内容end--%>
            html+='<div class="catog-points">\n';
            html+='<span class="i-left span-common">\n';
            html+='<a href="javascript:void (0);">浏览 <i>'+content.watchCount+'</i></a>\n';
            html+='</span>\n';
            html+='<span class="i-mid span-common">\n';
            html+='<a href="/OnlineCourseFronten/commentdetail/show?id='+content.chat.id+'">评论 <i>'+content.commentCount+'</i></a>\n';
            html+='</span>\n';
            html+='<span class="i-right span-common">\n';
            html+='<a href="javascript:void (0);" onclick="favorite(this,'+content.chat.id+')">收藏 <i>'+content.favoriteCount+'</i></a>\n';
            html+='</span>\n';
            html+='<span class="i-right span-common">\n';
            html+='<a href="javascript:void (0);" onclick="like(this,'+content.chat.id+')">赞 <i>'+content.likeCount+'</i></a>\n';
            html+='</span>\n';
            html+='</div>\n';
            html+='</div>\n';
            html+='</li>\n';
        });
            html +='</ul>\n';
        $('.comment-favorite-list').html(html);
    }
    //消息
    function jsonToHtml_message(data) {
        var html = '';
        $.each( data.returnDate, function(index, content)
        {
            if (content.messages.isRead=='N'){
                html += '<div note-id="" class="notice">';
                html += '<div class="notice-box clearfix" style="display: flex;">';
                if (content.messages.type=='course')
                    html += '<p class="notice-type ">课程</p>';
                else if (content.messages.type=='chat')
                    html += '<p class="notice-type ">话题</p>';
                else if (content.messages.type=='comment')
                    html += '<p class="notice-type ">评论</p>';
                else if (content.messages.type=='system')
                    html += '<p class="notice-type ">系统</p>';
                else if (content.messages.type=='user')
                    html += '<p class="notice-type ">用户</p>';

                html += '<div class="notice-show-box">';

                if (content.messages.type=='course')
                    html += '<p class="notice-con ">课程消息<a onclick="read(this)" data-id="'+content.messages.id+'" target="_blank" href="/OnlineCourseFronten/learn/show?id='+content.messages.positionId+'">'+content.title+'</a>';
                else if (content.messages.type=='chat')
                    html += '<p class="notice-con ">你的话题<a onclick="read(this)" data-id="'+content.messages.id+'" target="_blank" href="/OnlineCourseFronten/commentdetail/show?id='+content.messages.positionId+'">'+content.title+'</a>';
                else if (content.messages.type=='comment')
                    html += '<p class="notice-con ">你的评论<a onclick="read(this)" data-id="'+content.messages.id+'" target="_blank" href="/OnlineCourseFronten/reply/show?id='+content.messages.positionId+'">'+content.title+'</a>';
                else if (content.messages.type=='system')
                    html += '<p class="notice-con ">系统消息<a onclick="read(this)" data-id="'+content.messages.id+'" target="_blank" href="#">'+content.title+'</a>';
                else if (content.messages.type=='user')
                    html += '<p class="notice-con ">用户消息<a onclick="read(this)" data-id="'+content.messages.id+'" target="_blank" href="#">'+content.title+'</a>';

                if (content.messages.actionType=='like')
                    html += '有新的赞';
                else if (content.messages.actionType=='favorite')
                    html += '有新收藏';
                else if (content.messages.actionType=='following')
                    html += '有新关注';
                else if (content.messages.actionType=='reply')
                    html += '有新回复';
                else if (content.messages.actionType=='comment')
                    html += '有新评论';
                html += '</p>';
                html += '<h5 class="notice-date">'+new Date(content.messages.date).Format("yyyy-MM-dd hh:mm:ss")+'</h5>';
                html += '</div>';
                html += '<div class="del-box clearfix"> ';
                html += '<a onclick="deleteMessage('+content.messages.id+')" href="javascript:void(0)" class="del-notice" title="删除此通知">';
                html += '<i class="icon icon-del"></i>';
                html += '</a>';
                html += '</div>';
                html += '</div>';
                html += '</div>';
            } else {
                html += '<div note-id="" class="notice"> ';
                html += '<div class="notice-box clearfix" style="display: flex;">';
                if (content.messages.type=='course')
                    html += '<p class="notice-type already-read">课程</p>';
                else if (content.messages.type=='chat')
                    html += '<p class="notice-type already-read">话题</p>';
                else if (content.messages.type=='comment')
                    html += '<p class="notice-type already-read">评论</p>';
                else if (content.messages.type=='system')
                    html += '<p class="notice-type already-read">系统</p>';
                else if (content.messages.type=='user')
                    html += '<p class="notice-type already-read">用户</p>';

                html += '<div class="notice-show-box">';

                if (content.messages.type=='course')
                    html += '<p class="notice-con pass">课程消息<a target="_blank" href="/OnlineCourseFronten/learn/show?id='+content.messages.positionId+'">'+content.title+'</a>';
                else if (content.messages.type=='chat')
                    html += '<p class="notice-con pass">你的话题<a target="_blank" href="/OnlineCourseFronten/commentdetail/show?id='+content.messages.positionId+'">'+content.title+'</a>';
                else if (content.messages.type=='comment')
                    html += '<p class="notice-con pass">你的评论<a target="_blank" href="/OnlineCourseFronten/reply/show?id='+content.messages.positionId+'">'+content.title+'</a>';
                else if (content.messages.type=='system')
                    html += '<p class="notice-con pass">系统消息<a target="_blank" href="#">'+content.title+'</a>';
                else if (content.messages.type=='user')
                    html += '<p class="notice-con pass">用户消息<a target="_blank" href="#">'+content.title+'</a>';

                if (content.messages.actionType=='like')
                    html += '有新的赞';
                else if (content.messages.actionType=='favorite')
                    html += '有新收藏';
                else if (content.messages.actionType=='following')
                    html += '有新关注';
                else if (content.messages.actionType=='reply')
                    html += '有新回复';
                else if (content.messages.actionType=='comment')
                    html += '有新评论';
                html += '</p>';
                html += '<h5 class="notice-date">'+new Date(content.messages.date).Format("yyyy-MM-dd hh:mm:ss")+'</h5>';
                html += '</div>';
                html += '<div class="del-box clearfix">';
                html += '<a onclick="deleteMessage('+content.messages.id+')" href="javascript:void(0)" class="del-notice" title="删除此通知">';
                html += '<i class="icon icon-del"></i>';
                html += '</a>';
                html += '</div>';
                html += '</div>';
                html += '</div>';
            }
        });
        $('.comment-message-list').html(html);
    }


    //错误回掉
    function errBack() {
        $('.comment-course-list').html('<div style="text-align:center; width:100%;">暂无数据</div>');
        $('.comment-favorite-list').html('<div style="text-align:center; width:100%;">暂无数据</div>');
        $('.comment-message-list').html('<div style="text-align:center; width:100%;">暂无数据</div>');
    }


    //发送前触发
    function beforeSend() {
        $('.comment-course-list').html('<div style="text-align:center; width:100%;"><img style="height: 80px;" src="/OnlineCourseFronten/static/staticWEB/img/box.gif"></div>');
        $('.comment-favorite-list').html('<div style="text-align:center; width:100%;"><img style="height: 80px;" src="/OnlineCourseFronten/static/staticWEB/img/box.gif"></div>');
        $('.comment-message-list').html('<div style="text-align:center; width:100%;"><img style="height: 80px;" src="/OnlineCourseFronten/static/staticWEB/img/box.gif"></div>');
    }
    /************** end：课程分页列表***********/

    /**
     *  点击链接时，设置已读
     */
    function read(e) {
        $.ajax({
            url:'/OnlineCourseFronten/message/message/read',//路径
            type:'post',
            cache:false,
            dataType:false,
            data:{
                id  : $(e).attr('data-id')
            },
            success:function (data) {
                main_message();
            },
            error:function (e) {
                ;
            }
        });
    }

    /**
     *  删除消息
     */
    function deleteMessage(id){
        $.ajax({
            url:'/OnlineCourseFronten/message/message/delete',//路径
            type:'post',
            cache:false,
            dataType:false,
            data:{
                id  : id
            },
            success:function (data) {
                main_message();
            },
            error:function (e) {
                alert('删除失败');
            }
        });
    }

    /*点赞*/
    function like(e,chatId) {
        $.ajax({
            url:'/OnlineCourseFronten/chat/getlike',//路径
            type:'post',
            cache:false,
            dataType:'json',
            data:{
                id  : chatId
            },
            success:function (data) {
                $(e).children('i').html(data);
            },
            error:function (e) {
                ;
            }
        });
    }
    /*点赞*/
    /*收藏*/
    function favorite(e,chatId) {
        $.ajax({
            url:'/OnlineCourseFronten/chat/getfavorite',//路径
            type:'post',
            cache:false,
            dataType:'json',
            data:{
                id  : chatId
            },
            success:function (data) {
                $(e).children('i').html(data);
            },
            error:function (e) {
                ;
            }
        });
    }
    /*点赞*/

    /**
     * 时间对象的格式化;
     */
    Date.prototype.Format = function (fmt) { //author: meizz
        var o = {
            "M+": this.getMonth() + 1, //月份
            "d+": this.getDate(), //日
            "h+": this.getHours(), //小时
            "m+": this.getMinutes(), //分
            "s+": this.getSeconds(), //秒
            "q+": Math.floor((this.getMonth() + 3) / 3), //季度
            "S": this.getMilliseconds() //毫秒
        };
        if (/(y+)/.test(fmt)) fmt = fmt.replace(RegExp.$1, (this.getFullYear() + "").substr(4 - RegExp.$1.length));
        for (var k in o)
            if (new RegExp("(" + k + ")").test(fmt)) fmt = fmt.replace(RegExp.$1, (RegExp.$1.length == 1) ? (o[k]) : (("00" + o[k]).substr(("" + o[k]).length)));
        return fmt;
    }
</script>
</body>
</html>
