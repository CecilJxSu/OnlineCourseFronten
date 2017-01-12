<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="renderer" content="webkit">
    <title>test</title>
    <link  rel="stylesheet" href="${pageContext.request.contextPath}/static/public/css/createcomment/common_less.css">
</head>
<body>
<%--头部--%>
<jsp:include page="include/header.jsp"></jsp:include>
<%--头部end--%>
<div class="main">
    <%--顶部--%>
    <div class="test" style="text-align: -webkit-center;">
        <%--显示小测名称--%>
        <h1>小测名称</h1>
        <%--显示小测名称end--%>
    </div>
    <%--顶部end--%>
    <%--内容--%>
    <div class="content">
        <form action="" method="">
            <%--小测显示内容--%>
            <div class="test_content">
                <p>1.选择题</p>
            </div>
            <%--小测显示内容end--%>
            <div class="test_col" style="padding-top:20px;">
                <a id="test_btn-success" href="javascript:void (0);" class="test_btn test_btn-success" style=" border-left-width: 12px;border-right-width: 12px;color: #fff; margin-left: 48%;">
                    提交
                </a>
            </div>
        </form>
    </div>
    <%--内容--%>
</div>
<%--尾部--%>
<jsp:include page="include/footer.jsp"></jsp:include>
<%--尾部end--%>
<!--加载js-->
<script src="${pageContext.request.contextPath}/static/backend/js/jquery-1.11.2.min.js"></script>
<script type="text/javascript">
    $(function () {
        var height=document.documentElement.clientHeight;
        if ($('.main').height()< height){
            $('.main').css('height',height);
        }
    });
</script>
</body>
</html>
