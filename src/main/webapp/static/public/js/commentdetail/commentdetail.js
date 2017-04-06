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
            type    :  'chat',
            id      :   $('#chatTitleId').attr('data-qid'),
            content :   $('#js-pl-textarea').val()
        },
        success:function (data) {
            $('#js-pl-textarea').empty();
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
        type    :'chat',
        id      :$('#chatTitleId').attr('data-qid')
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
        html +='<div class="commentdetailcontent">\n';
        html +='<div class="qa-comment js-qa-comment" data-cid="282305" id="id_282305">\n';
        html +='<div class="qa-comment-wrap clearfix ">\n';
        html +='<div class="qa-comment-author">\n';
        html +='<a href="javascript:void(0);" title="'+content.user.username+'">\n';
        if (content.user_profile==null || content.user_profile=='')
         html += '<img src="/OnlineCourseFronten/static/staticWEB/img/default.png" width="40" height="40">\n';
         else
         html += '<img src="/OnlineCourseFronten/file/get?url='+content.user_profile.iconUrl+'" width="40" height="40">\n';
        html +='<span class="qa-comment-nick">'+content.user.username+'</span>\n';
        html +='</a>\n';
        html +='</div>\n';
        html +='<div class="qa-comment-d ">\n';
        html +='<div class="qa-comment-inner">\n';
        html +='<div class="qa-comment-c imgPreview">\n';
        html +='<div class="rich-text">\n';
        html +='<p>'+content.comment_content+'<br></p>\n';
        html +='</div>\n';
        html +='</div>\n';
        html +='<div class="dianzan qa-comment-addon">\n';
        html +='<span class="qa-comment-time">'+content.time+'</span>\n';
        html +='<div class="qa-comment-addon-r">\n';
        html +='<span class="qa-total-reply js-reply-item-reply">\n';
        html +='<i class="icon-msg"></i>\n';
        html +='<a href="/OnlineCourseFronten/reply/show?id='+content.comment_id+'" target="_blank" class="js-qa-tr-num">回复</a>\n';
        html +='</span>\n';
        html +='<a title="赞" href="javascript:;"class="js-pl-praise js-qa-comment-support qa-comment-support  js-qacom-supported-user"data-ids="187799-282305" onclick="like(this,'+content.comment_id+')">\n';
        html +='<i class="icon-thumb-revert "></i>\n';
        html +='<span>'+content.like_count+'</span>\n';
        html +='</a>\n';
        html +='</div>\n';
        html +='</div>\n';
        html +='</div>\n';
        html +='</div>\n';
        html +='</div>\n';
        html +='<div class="qa-reply">\n';
        html +='<div class="qa-reply-header"></div>\n';
        html +='<div class="qa-replies">\n';
        html +='<div class="qa-reply-c">\n';
        html +='</div>\n';

        /*回复框*/
        html +='<div class="js-qa-reply-ibox qa-reply-ibox  clearfix" style="display:none">\n';
        html +='<div class="qa-reply-iavator l">\n';
        html +='<a href="/u/1361691/id" title="哈米的小宇宙">\n';
        html +='<img src="http://img.mukewang.com/user/552133900001743101800180-40-40.jpg"width="40" height="40">\n';
        html +='</a>\n';
        html +='</div>\n';
        html +='<div class="qa-reply-iwrap">\n';
        html +='<div class="qa-reply-iarea">\n';
        html +='<textarea name="" id="" class="js-reply-ipt-default ipt"placeholder="写下你的评论..."></textarea>\n';
        html +='</div>\n';
        html +='</div>\n';
        html +='<div class="qa-reply-ifoot clearfix">\n';
        html +='<div class="qa-reply-footright r">\n';
        html +='<span class="qa-tips"></span>\n';
        html +='<button class="btn-normal btn-mini js-ipt-cancel"onclick="closetextarea(this)">取消 </button>\n';
        html +='<button class="btn-mini btn-green  js-ipt-submit">提交</button>\n';
        html +='</div>\n';
        html +='</div>\n';
        html +='</div>\n';
        html +='</div>\n';
        html +='</div>\n';
        html +='</div>\n';
        html +='</div>\n';
    });
    $('.commentdetailcontent').html(html);
}




//错误回掉
function errBack() {
    $('.commentdetailcontent').html('<div style="text-align:center; width:100%;">暂无数据</div>');
}

//发送前触发
function beforeSend() {
    $('.commentdetailcontent').html('<div style="text-align:center; width:100%;"><img style="height: 80px;" src="/OnlineCourseFronten/static/staticWEB/img/box.gif"></div>');
}
/************** end：评论分页列表***********/

//点赞或取消点赞
function like(e,comment_id) {
    $.ajax({
        url:'/OnlineCourseFronten/comment/like',//路径
        type:'post',
        cache:false,
        dataType:'json',
        data:{
            id  : comment_id
        },
        success:function (data) {
            $(e).children('span').html(data);
        },
        error:function (e) {
            ;
        }
    });
}