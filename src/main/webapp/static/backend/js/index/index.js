/* Page Loading */
$(window).load(function() {
    $(".loading").fadeOut(750);
})

/* Sidebar Menu*/
$(document).ready(function () {
    $('.nav > li > a').click(function(){
        if ($(this).attr('class') != 'active'){
            $('.nav li ul').slideUp();
            $(this).next().slideToggle();
            $('.nav li a').removeClass('active');
            $(this).addClass('active');
        }

    });
});



/*框架高度*/
$(document).ready(function () {
    loadiframe("#iframe");
})
function loadiframe(obj) {
    var connenctheight = $(obj).contents().height();//框架里body高度
    var height=document.documentElement.clientHeight;//浏览器可视高度
    if (connenctheight< height){
        $(obj).height(height)+50;
    }else {
        $(obj).height(connenctheight)+50;
    }
}

$("#iframe").load(function(){
    var connenctheight = $(this).contents().height();//框架里body高度
    var height=document.documentElement.clientHeight;//浏览器可视高度
    if (connenctheight< height){
        $(this).height(height)+50;
    }else {
        $(this).height(connenctheight)+50;
    }

});