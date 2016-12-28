/*创建话题*/
function submitComment() {
    var $title=$(".huati"), val;
    if (getRealLen((val=$.trim($title.val()))) < 0) {
        $('#feedback-error').css("display","block");
        $('#feedback-error').html('标题不能为空！');
        return false;
    } else {
        $('#feedback-error').css("display","none");
        $('#feedback-error').empty();
    }

    // 获取编辑器纯文本内容
    var content = editor.$txt.text().substr(0,126);
    // 获取编辑器区域完整html代码
    var html = editor.$txt.html();
    if (html.length < 0) {
        $('#feedback-error').css("display","block");
        $('#feedback-error').html('内容不能为空！');
        return false;
    } else {
        $('#feedback-error').css("display","none");
        $('#feedback-error').empty();
    }
    $.ajax({
        url:'/OnlineCourseFronten/createcomment/commentupload',//路径
        type:'post',
        cache:false,
        dataType:false,
        data:{
            title    :   $('#ques-title').val(),
            content  :   content,
            html     :   html
        },
        success:function (data) {
            alert("话题发表成功");
            window.location.href="/OnlineCourseFronten/chat/show";
        },
        error:function (e) {
            alert("话题发表失败");
        }
    });


}
/*创建话题end*/

/****** start: 富文本编辑器 ******/
// 阻止输出log
wangEditor.config.printLog = false;

// 获取元素
var div = document.getElementById('div1');
// 生成编辑器
var editor = new wangEditor(div);

// 普通的自定义菜单
editor.config.menus = [
    'bold',
    'underline',
    'italic',
    'strikethrough',
    'eraser',
    'forecolor',
    'bgcolor',
    '|',
    'quote',
    'fontfamily',
    'fontsize',
    'head',
    'unorderlist',
    'orderlist',
    'alignleft',
    'aligncenter',
    'alignright',
    '|',
    'link',
    'unlink',
    'table',
    '|',
    'img',
    'insertcode',
    '|',
    'undo',
    'redo',
    'fullscreen'
];

// 颜色
editor.config.colors = {
    '#880000': '暗红色',
    '#800080': '紫色',
    '#ff0000': '红色'
};

// 字体
editor.config.familys = [
    '宋体', '黑体', '楷体', '微软雅黑',
    'Arial', 'Verdana', 'Georgia'
];

// 字号
editor.config.fontsizes = {
    // 格式：'value': 'title'
    1: '10px',
    2: '13px',
    3: '16px',
    4: '19px',
    5: '22px',
    6: '25px',
    7: '28px'
};

// 将全屏时z-index修改为20000
editor.config.zindex = 20000;

// 插入代码时的默认语言
editor.config.codeDefaultLang = 'javascript'

// 上传图片
//服务器路径
editor.config.uploadImgUrl = '/OnlineCourseFronten/createcomment/upload/img';
// 设置 headers（举例）
editor.config.uploadHeaders = {
    'Accept' : 'text/x-json'
};
//设置上传imput的name
editor.config.uploadImgFileName = 'files';
// 隐藏掉插入网络图片功能。该配置，只有在你正确配置了图片上传功能之后才可用。
editor.config.hideLinkImg = true;
// 自定义load事件
editor.config.uploadImgFns.onload = function (resultText, xhr) {
    // resultText 服务器端返回的text
    // xhr 是 xmlHttpRequest 对象，IE8、9中不支持
    // 上传图片时，已经将图片的名字存在 editor.uploadImgOriginalName
    var originalName = editor.uploadImgOriginalName || '';
    // 如果 resultText 是图片的url地址，可以这样插入图片：
    editor.command(null, 'insertHtml', '<img src="/OnlineCourseFronten/file/get?url=' + resultText + '" alt="' + originalName + '" style="max-width:100%;"/>');
    // 如果不想要 img 的 max-width 样式，也可以这样插入：
    // editor.command(null, 'InsertImage', resultText);
};
// 自定义timeout事件
editor.config.uploadImgFns.ontimeout = function (xhr) {
    // xhr 是 xmlHttpRequest 对象，IE8、9中不支持
    alert('上传超时');
};
// 自定义error事件
editor.config.uploadImgFns.onerror = function (xhr) {
    // xhr 是 xmlHttpRequest 对象，IE8、9中不支持
    alert('上传错误');
};

editor.create();

/****** end: 富文本编辑器 ******/


// 初始化编辑器的内容
//editor.$txt.html('<p>要初始化的内容</p>');
