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
/*$(document).ready(function () {
    loadiframe("#iframe");
})
function loadiframe(obj) {
    var connenctheight = $(obj).contents().find("body").height();//框架里body高度
    var height=document.documentElement.clientHeight;//浏览器可视高度
    if (connenctheight< height){
        $(obj).height(height)+1400;
    }else {
        $(obj).height(connenctheight)+1400;
    }
}

$("#iframe").load(function(){
    var connenctheight = $(this).contents().find("body").height();//框架里body高度
    var height=document.documentElement.clientHeight;//浏览器可视高度
    if (connenctheight< height){
        $(this).height(height)+1400;
    }else {
        $(this).height(connenctheight)+1400;
    }

});*/
function reinitIframe(){
    var iframe = document.getElementById("iframe");
    try{
        var clientheight=document.documentElement.clientHeight;//浏览器可视高度
        var bHeight = iframe.contentWindow.document.body.scrollHeight;
        var dHeight = iframe.contentWindow.document.documentElement.scrollHeight;
        var height = Math.max(bHeight, dHeight);
        if(height<clientheight){
            iframe.height = clientheight;
        }else {
            iframe.height = height;
        }
        /*console.log(height);*/
    }catch (ex){}
}
window.setInterval("reinitIframe()", 200);