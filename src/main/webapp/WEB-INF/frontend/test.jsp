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
        <h1><c:out value="${question.name}"/></h1>
        <span style="color: #f01414;text-align: center;font-size: 1.3em;">
            总分: <c:out value="${question.total}"/>
        <c:if test="${answer != null}">
             | 成绩: <c:out value="${answer.total}"/>
        </c:if>
        </span>
        <%--显示小测名称end--%>
    </div>
    <%--顶部end--%>
    <%--内容:还未进行小测--%>
    <c:if test="${answer == null && userStatus == 'student'}">
    <div class="content" style="margin-left: 10%;">
        <form action="" method="post">
            <input hidden name="id" id="id" value="${question.id}">
            <%--小测显示内容--%>
            <c:forEach var="testUnit" items="${test}">
                <br>
                <div class="test_content">
                    <p><b><c:out value="${testUnit.type}"/></b>(共 <c:out value="${testUnit.score}"/> 分)</p>
                </div>
                <c:set var="num" value="0"/>
                <c:set var="name" value=""/>
                <c:forEach var="question" items="${testUnit.questions}">
                    <c:set var="num" value="${num+1}"/>
                    <div class="test_content">
                        <p><c:out value="${num}"/>、<c:out value="${question.question}"/></p>
                        <c:if test="${question.type == '单选题'}">
                            <c:set var="name" value="单选题"/>
                            <c:forEach var="item" items="${question.item}">
                                <input type="radio" name="单选题<c:out value="${num}"/>" value="<c:out value="${item.key}"/>">
                                <c:out value="${item.value}"/>
                                <br>
                            </c:forEach>
                        </c:if>
                        <c:if test="${question.type == '多选题'}">
                            <c:set var="name" value="多选题"/>
                            <c:forEach var="item" items="${question.item}">
                                <input type="checkbox" name="多选题<c:out value="${num}"/>" value="<c:out value="${item.key}"/>">
                                <c:out value="${item.value}"/>
                                <br>
                            </c:forEach>
                        </c:if>
                        <c:if test="${question.type == '判断题'}">
                            <c:set var="name" value="判断题"/>
                            <c:forEach var="item" items="${question.item}">
                                <input type="radio" name="判断题<c:out value="${num}"/>" value="<c:out value="${item.key}"/>">
                                <c:out value="${item.value}"/>
                                <br>
                            </c:forEach>
                        </c:if>
                    </div>
                </c:forEach>
                <span class="test-count" id="<c:out value="${name}"/>" value="<c:out value="${num}"/>"/>
            </c:forEach>
            <%--小测显示内容end--%>
            <div class="test_col" style="padding-top:20px;">
                <a id="test_btn-success" href="javascript:void (0);" class="test_btn test_btn-success" style=" border-left-width: 12px;border-right-width: 12px;color: #fff; margin-left: 48%;">
                    提交
                </a>
            </div>
        </form>
    </div>
    </c:if>
    <%--内容:还未进行小测--%>
    <%--内容:已进行小测--%>
    <c:if test="${answer != null}">
        <div class="content" style="margin-left: 10%;">
            <form action="" method="post">
                    <%--小测显示内容--%>
                <c:forEach var="testUnit" items="${test}">
                    <c:forEach var="answerVO" items="${answerVOs}">
                        <c:if test="${answerVO.type == testUnit.type}">
                            <br>
                            <div class="test_content">
                                <p><b><c:out value="${testUnit.type}"/></b> ( 共 <c:out value="${testUnit.score}"/> 分, 得分: <c:out value="${answerVO.totalScore}"/> )</p>
                            </div>
                            <c:set var="index" value="0"/>
                            <c:forEach var="question" items="${testUnit.questions}">
                                <div class="test_content">
                                    <p><c:out value="${index+1}"/>、<c:out value="${question.question}"/></p>
                                    <c:forEach var="item" items="${question.item}">
                                        <c:out value="${item.key}"/>、<c:out value="${item.value}"/>
                                        <br>
                                    </c:forEach>
                                    <p>你的答案: <c:out value="${answerVO.answers[index]}"/></p>
                                    <p>正确答案: <c:out value="${question.answer}"/></p>
                                    <p style="color: #f01414">解析: <c:out value="${question.explains}"/></p>
                                </div><br>
                                <c:set var="index" value="${index+1}"/>
                            </c:forEach>
                        </c:if>
                    </c:forEach>
                </c:forEach>
                    <%--小测显示内容end--%>
            </form>
        </div>
    </c:if>
    <%--内容:已进行小测--%>
    <%--内容:非学生--%>
    <c:if test="${userStatus != 'student'}">
        <div class="content" style="margin-left: 10%;">
            <form action="" method="post">
                    <%--小测显示内容--%>
                <c:forEach var="testUnit" items="${test}">
                    <br>
                    <div class="test_content">
                        <p><b><c:out value="${testUnit.type}"/></b> ( 共 <c:out value="${testUnit.score}"/> 分 )</p>
                    </div>
                    <c:forEach var="question" items="${testUnit.questions}">
                        <div class="test_content">
                            <p><c:out value="${index+1}"/>、<c:out value="${question.question}"/></p>
                            <c:forEach var="item" items="${question.item}">
                                <c:out value="${item.key}"/>、<c:out value="${item.value}"/>
                                <br>
                            </c:forEach>
                            <p>正确答案: <c:out value="${question.answer}"/></p>
                            <p style="color: #f01414">解析: <c:out value="${question.explains}"/></p>
                        </div><br>
                        <c:set var="index" value="${index+1}"/>
                    </c:forEach>
                </c:forEach><%--小测显示内容end--%>
            </form>
        </div>
    </c:if>
    <%--内容:非学生--%>
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

//    提交按钮
    var obj = new Array();
    $('#test_btn-success').on('click',function () {
        var checkInput = true;
        $('.test-count').each(function () {
            var s = $(this).attr("id");
            var unit = {type:s,totalScore:0};
            unit.answers = new Array();
            for (var e=1;e<=$(this).attr("value");e++){
                if ($("input[name='"+s+e+"']:checked").val()==null){
                    alert("请先完成小测！");
                    checkInput =  false;
                    return false;
                } else {
                    if ($("input[name='"+s+e+"']:checked").length < 2){
                        var tmp = new Array();
                        tmp.push($("input[name='"+s+e+"']:checked").val());
                        unit.answers.push(tmp);
                    } else {
                        var tmp = new Array();
                        $("input[name='"+s+e+"']:checked").each(function () {
                            tmp.push($(this).val());
                        });
                        unit.answers.push(tmp);
                    }
                }
            }
            obj.push(unit);
        });
        //提交表单
        if (checkInput)
            $.StandardPost('/OnlineCourseFronten/test/exam',{id:$('#id').val(),answers:JSON.stringify(obj)});
    });
    //模拟表单Post提交
    $.extend({
        StandardPost:function(url,args){
            var body = $(document.body), form = $("<form method='post'></form>"), input;
            form.attr({"action":url});
            $.each(args,function(key,value){
                input = $("<input type='hidden'>");
                input.attr({"name":key});
                input.val(value);
                form.append(input);
            });
            form.appendTo(document.body);
            form.submit();
            document.body.removeChild(form[0]);
        }
    });
</script>
</body>
</html>
