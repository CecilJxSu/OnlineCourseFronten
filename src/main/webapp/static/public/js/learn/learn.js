$(function () {
    $('.mod-chapters').on('click', 'h3, .J-media-item', function(e) {
        var $this = $(this);

        // 如果点击的是章
        if (!$this.hasClass('J-media-item')) {
            var flag = $this.find('span'),
                chapter = $this.parents('.chapter');

            chapter.toggleClass('chapter-active');

            if (chapter.hasClass('chapter-active')) {
                flag.removeClass('js-close').addClass('js-open');
            } else {
                flag.removeClass('js-open').addClass('js-close');
            }
        }
    })
});

/************** start：观看视频是需要登录才行***********/
$('.moco-btn,.l,.learn-btn,.green-btn,.red-btn').on('click', function () {
    dump($(this).children('a').attr("id"));
});
$('.J-media-item').on('click', function () {
    dump($(this).attr("id"));
});
function dump(id) {
    ///OnlineCourseFronten/video/show?id=
    //判断是否登录
    if ($('#js-signin-btn').length && $('#js-signin-btn').length > 0) {
        $('#js-signin-btn').trigger('click');
        $('#signin-globle-error').html("您还未登录");
    } else {
        var form = $('<form></form>');
        // 设置属性
        form.attr('action', "/OnlineCourseFronten/video/show");
        form.attr('method', 'post');
        // form的target属性决定form在哪个页面提交
        // _self -> 当前页面 _blank -> 新页面
        form.attr('target', '_blank');
        // 创建Input
        var my_input = $('<input type="text" name="id"/>');
        my_input.attr('value', id);
        // 附加到Form
        form.append(my_input);
        // 提交表单
        form.submit();
        // 注意return false取消链接的默认动作
        //return false;
    }
}
/************** end：观看视频是需要登录才行***********/


/************** start：评论分页列表***********/
//默认当前页(不可动)
var nowPage = 1;
//默认最大页数(不可动)
var maxPage = 1;

//ajax入口
function main() {
    var url = '/OnlineCourseFronten/comment/get';
    var data = {
        nowPage :nowPage,
        type    :'course',
        id      :$('#title').attr('name')
    };
    getData(url,data);
}

//页面加载完成时触发
$(function () {
    main();
});

//ajax(不可动)
function getData(url,data){
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
            jsonToHtml(data);
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

//最热最新按钮监听
$('.sort-item').on('click',function () {
    if ($(this).is('.active')){
        return false;
    } else {
        $('.sort-item,.active').removeClass('active');
        $(this).addClass('active');
        $('.sort-item,.active').attr('name',$('.sort-item,.active').attr('name')=='hot'?'new':'hot');
        nowPage = 1;
        //触发ajax
        main();
    }
});

//将回传的数据转成html，放进相应位置(自己实现)
function jsonToHtml(data) {
    var html = '';
    $.each( data.list, function(index, content)
    {
        html += '<div class="course_quescon">';
        html += '<div class="wenda-listcon mod-qa-list clearfix">';
        html += '<div class="headslider qa-medias l">';
        html += '<a href="#" class="media" target="_blank" title="'+content.user.username+'">';
        html += '<img src="/OnlineCourseFronten/file/get?url='+content.user_profile.iconUrl+'" width="40" height="40">';
        html += '<i class="icon-ques-revert nofinish"></i></a></div>';
        html += '<div class="wendaslider qa-content" style="border-bottom: 0px;">';
        html += '<h2 class="wendaquetitle qa-header">';
        html += '<a href="/u/4465849/courses" class="name" target="_blank" title="'+content.user.username+'">'+content.user.username+'</a>';
        html += '<div class="wendatitlecon qa-header-cnt clearfix">';
        html += '<a href="/qadetail/183984" target="_blank" class="qa-tit">';
        html += '<i>'+content.comment_content+'</i></a></div></h2>';
        html += '<div class="replycont qa-body clearfix"><div class="l replydes">';
        html += '<span class="replysign praise">[最新';
        html += '<a href="/u/4465496/courses" target="_blank" title="哎哟不错哦" class="nickname">哎哟不错哦</a>';
        html += '的回答]</span>';
        html += '<span class="replydet">重点在于自己，想不想学，有没有去尝试，有没有恒心！文科理科差异不大1</span></div></div>';
        html += '<div class="replymegfooter qa-footer clearfix"><div class=" wenda-time ">';
        html += '<div class="l-box l"><em>'+content.time+'</em></div>';
        html += '<div class="dianzan">';
        html += '<a title="赞" href="javascript:;" class="js-pl-praise replynumber static-count r" data-id="6696">';
        html += '<i class="static-item icon-thumb-revert" style=" line-height:0px;"></i>';
        html += '<span>'+content.like_count+'</span></a></div>';
        html += '<a href="/OnlineCourseFronten/qadetail/showQadetail" class="replynumber static-count r" style="margin-right: -8px;">';
        html += '<span class="static-item answer">';
        html += '<b class="val">'+content.reply_count+'</b>';
        html += '<span class="key">回答</span>';
        html += '</span></a></div></div></div></div></div>';

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
/************** end：评论分页列表***********/