/*
    仿照教程
    1、main()方法是ajax的入口，主要用于配置请求路径url和参数数据data；
    2、jsonToHtml(data)是成功回掉时将数据在页面显示的方法，需要自己实现，data是回掉的数据。
 */

//默认当前页(不可动)
var nowPage = 1;
//默认最大页数(不可动)
var maxPage = 1;

//ajax入口
function main() {
    var url = '/OnlineCourseFronten/course/get';
    var search = $('.search-input').val();
    var hot_new = $('.sort-item,.active').attr('name');
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
        hot_new = $(this).attr('name');
        return false;
    } else {
        $('.sort-item,.active').removeClass('active');
        $(this).addClass('active');
        hot_new = $(this).attr('name');
        nowPage = 1;
        //触发ajax
        main();
    }
});

//将回传的数据转成html，放进相应位置(自己实现)
function jsonToHtml(data) {
    var html = '';
    $.each( data.courses, function(index, content)
    {
        html += '<div class="moco-course-wrap">';
        html += '<a href="/OnlineCourseFronten/learn/show?id='+content.id+'" target="_blank">';
        html += '<div class="moco-course-box">';
        html += '<img alt="'+content.name+'" src="/OnlineCourseFronten/static/staticWEB/img/home/580d752500019ca805400300-360-202.jpg" height="124" width="100%">';
        html += '<div class="moco-course-intro">';
        html += '<h3><i>中</i>'+content.name+'</h3>';
        html += '<p>'+content.introduction+'</p>';
        html += '</div>';
        html += '<div class="moco-course-bottom">';
        html += '<span class="l">综合:'+content.complex+'</span>';
        html += '<span class="r">'+content.numOfPeople+'人在学</span>';
        html += '</div></div></a></div>';
    });
    $('.moco-course-list').html(html);
}

//错误回掉
function errBack() {
    $('.moco-course-list').html('<div style="text-align:center; width:100%;">暂无数据</div>');
}

//发送前触发
function beforeSend() {
    $('.moco-course-list').html('<div style="text-align:center; width:100%;"><img style="height: 80px;" src="/OnlineCourseFronten/static/staticWEB/img/box.gif"></div>');
}