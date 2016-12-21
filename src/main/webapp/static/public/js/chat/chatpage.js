
//默认当前页(不可动)
var nowPage = 1;
//默认最大页数(不可动)
var maxPage = 1;

//ajax入口
function main() {
    var url = '/OnlineCourseFronten/chat/getchat';
    var search = $('.search-input').val();
    var hot_new = $('.chat,.active').attr('name');
    var data = {
        nowPage :nowPage,
        hotOrNew:hot_new,
        search  :search
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
            big();
            favorite();
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
$('.chat').on('click',function () {
    if ($(this).is('.active')){
        return false;
    } else {
        $('.chat,.active').removeClass('active');
        $(this).addClass('active');
        $('.chat,.active').attr('name',$('.sort-item,.active').attr('name')=='hot'?'new':'hot');
        nowPage = 1;
        //触发ajax
        main();
    }
});

//将回传的数据转成html，放进相应位置(自己实现)
function jsonToHtml(data) {
    var html = '';
    $.each( data.chats, function(index, content)
    {
        html +='<div class="ques-answer">\n';

        /*用户头像*/
        html +='<div class="tag-img">\n'
        html +='<a href="/wenda/17" target="_blank">\n';
        if (content.profile==null || content.profile==""){
            html +='<img src="/OnlineCourseFronten/static/staticWEB/img/default.png" title="JavaScript">\n';
        }else {
            html +='<img src="/OnlineCourseFronten/file/get?url='+content.profile.iconUrl+'" title="JavaScript">\n';

        }
        html +='</a>\n';
        html +='</div>\n';
        /*用户头像end*/
        /*话题标题*/
        html +='<div class="ques-con">';
        html +='<a href="/wenda/detail/338503" class="ques-con-content" target="_blank"title="'+content.title+'">'+content.title+'</a>\n';
        html +='</div>';
        /*话题标题end*/

        html +='<div class="answer-con first" data-answer-id="218070" id="answer-con">\n';
        /*话题内容*/
        html +='<div class="answer-content">\n';
        html +=content.content;
        html +='</div>\n';
        /*话题内容end*/
        /*图片*/
        html +='<div  class="topicimg answer-content">'
        $.each( $.parseJSON(content.pictureUrls), function(pictureindex, picturecontent){
            html +='<img src="/OnlineCourseFronten/file/get?url='+picturecontent+'">\n';
        })
        html +='</div>'
        /*图片end*/
        html +='<div style="position: static;" class="ctrl-bar clearfix">\n';
        /*点赞*/
        html +='<a title="赞" href="javascript:;" class="js-pl-praise list-praise r" data-id="'+content.id+'">\n';
        html +='<em class="numShow">赞</em>\n';
        html +='<span>'+content.likeCount+'</span>\n';
        html +='</a>\n';
        /*点赞end*/
        /*收藏*/
        if(content.favorite==1){
            html +='<a title="取消收藏" href="javascript:;" class="favorite js-pl-praise list-praise r" data-id="'+content.id+'">\n';
        }
        if(content.favorite==0){
            html +='<a title="收藏" href="javascript:;" class="favorite js-pl-praise list-praise r" data-id="'+content.id+'">\n';
        }
        html +='<em class="numShow">收藏</em>\n';
        html +='<span>'+content.favoriteCount+'</span>\n';
        html +='</a>\n';
        /*收藏ends*/
        /*评论*/
        html +='<a title="评论" href="/OnlineCourseFronten/commentdetail/show?id='+content.id+'" class="js-pl-praise list-praise r" data-id="'+content.id+'">\n';
        html +='<em class="numShow">评论</em>\n';
        html +='<span>'+content.commentCount+'</span>\n';
        html +='</a>\n';
        /*评论end*/
        /*浏览*/
        html +='<span class="agree-with " data-ques-id="338503" data-answer-id="218070"data-hasop="">\n';
        html +='<em>'+content.watchCount+'</em>\n';
        html +='<b>浏览</b>\n';
        html +='</span>\n';
        /*浏览end*/
        html +='<span class="oppose " data-ques-id="338503" data-answer-id="218070" data-hasop="">\n';
        html +='<em>'+content.date+'</em>\n';
        html +='</span>\n';
        html +='<span class="shrink">收起</span>\n';
        html +='</div>\n';
        html +='</div>\n';
        html +='</div>\n';

    });
    $('.chatContent').html(html);
}

//错误回掉
function errBack() {
    $('.chatContent').html('<div style="text-align:center; width:100%;">暂无数据</div>');
}

//发送前触发
function beforeSend() {
    $('.chatContent').html('<div style="text-align:center; width:100%;"><img style="height: 80px;" src="/OnlineCourseFronten/static/staticWEB/img/box.gif"></div>');
}

/*照片变大*/
function big() {
    $('.topicimg img').on('click', function (e) {
        var popup = document.getElementById("popup");
        event = event||window.event;
        var target = document.elementFromPoint(event.clientX, event.clientY);
        showBig(target.src);
        popup.onclick = function (){
            popup.style.display = "none";
        }
        function showBig(src){
            popup.getElementsByTagName("img")[0].src = src;
            popup.style.display = "block";
        }
    })
}

/*照片变大end*/

/*点赞*/
function dizan() {
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
}
/*点赞*/

/*收藏*/
function favorite() {
    $('.favorite ').on('click', function (e) {
        e.preventDefault();
        var type ="chat";//话题
        var title = $(this).attr('title');
        var dataid= $(this).attr('data-id');
        var span = $(this).children('span').text();
        if (title == '收藏') {
            $(this).attr('title', '取消收藏');
            var newspan = parseInt(span) + parseInt(1);
            $(this).children('span').html(newspan);
        }
        if (title == '取消收藏') {
            $(this).attr('title', '收藏');
            var newspan = parseInt(span) - parseInt(1);
            $(this).children('span').html(newspan);
        }
        var data ={
            type:type,
            title:title,
            chatId:dataid,
        }
        $.ajax({
            url:'/OnlineCourseFronten/chat/createfavorite',//路径
            type:'post',
            cache:false,
            dataType:'json',
            data:data,
            success:function (data) {
            },
            error:function (e) {
                errBack();
            }
        });
    })
}
/*收藏*/