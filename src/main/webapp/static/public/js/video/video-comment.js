//文本框输入字数控制
$('#js-pl-textarea').on('propertychange input',function () {
    var text = $(this).val();
    if (text.length>127){
        text = text.substr(0,127);
        $(this).val(text);
    }
    $('#js-pl-limit').html(text.length);
});
//提交评论
$('#js-pl-submit').on('click',function () {
    if ($('#js-pl-textarea').val().length<=0){
        alert("您还未输入评论");
        return false;
    }
    $.ajax({
        url:'/OnlineCourseFronten/comment/issue',//路径
        type:'post',
        cache:false,
        dataType:'json',
        data:{
            type    :   'course',
            id      :   $('#J_Box').attr('name'),
            content :   $('#js-pl-textarea').val()
        },
        success:function (data) {
            $('#js-pl-textarea').val('');
            main();
        },
        error:function (e) {
            alert('发表失败');
        }
    });
});


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
        id      :$('#J_Box').attr('name')
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

        html += '<li class="pl-list clearfix"><div class="pl-list-avator"><a href="/u/1862199/courses" target="_blank">';
        html += '<img width="40" height="40" src="/OnlineCourseFronten/file/get?url='+content.user_profile.iconUrl+'" title="'+content.user.username+'"></a></div>';
        html += '<div class="pl-list-main"><div class="pl-list-nick">';
        html += '<a href="/u/1862199/courses" target="_blank">'+content.user.username+'</a></div>';
        html += '<div class="pl-list-content">'+content.comment_content+'</div>';
        html += '<div class="pl-list-btm clearfix"><span class="pl-list-time l">时间: '+content.time+'</span>';
        html += '<div class="dianzan">';
        html += '<a title="赞" href="javascript:;" class="js-pl-praise list-praise r" data-id="82399" >';
        html += '<i class="icon-thumb-revert" style="line-height: 0px;"></i>';
        html += '<span>'+content.like_count+'</span></a></div>';
        html += '<a href="/OnlineCourseFronten/qadetail/showQadetail" target="_blank" class="replynumber r hasanswernum" style="margin-right: 18px;">';
        html += '<span class="ys" style="padding-right: 14px;">';
        html += '<b class="numShow">'+content.reply_count+'</b>';
        html += '<span class="number">回答</span></span></a></div></div></li>';
    });
    $('.pl-container').children('ul').html(html);
}




//错误回掉
function errBack() {
    $('.pl-container').children('ul').html('<div style="text-align:center; width:100%;">暂无数据</div>');
}

//发送前触发
function beforeSend() {
    $('.pl-container').children('ul').html('<div style="text-align:center; width:100%;"><img style="height: 80px;" src="/OnlineCourseFronten/static/staticWEB/img/box.gif"></div>');
}
/************** end：评论分页列表***********/