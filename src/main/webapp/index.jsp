<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Title</title>
</head>
<link rel="stylesheet" href="/statics/css/bootstrap.css">
<body>

<table class="table" style="width: 70%;" align="center" border="1">
    <caption class="text-center"><h1><label>用户信息</label></h1></caption>
    <tr>
        <th class="text-center">编号</th>
        <th class="text-center">别名</th>
        <th class="text-center">名称</th>
        <th class="text-center">密码</th>
        <th class="text-center">职位编号</th>
        <th class="text-center" colspan="2">操作</th>
    </tr>
    <c:forEach items="${list}" var="li">
        <tr class="text-center">
            <td>${li.id}</td>
            <td>${li.userCode}</td>
            <td>${li.userName}</td>
            <td>${li.userPassword}</td>
            <td>${li.userRole}</td>
            <td colspan="2">
                <a class="btn btn-primary" href="${li.id}">修改</a>
                <a class="btn btn-primary" href="javaScript:void(0);" onclick="del(${li.id},this);">删除</a>
            </td>
        </tr>
    </c:forEach>

</table>

</body>
<script type="text/javascript" src="/statics/js/jquery-1.12.4.js"></script>
<script type="text/javascript" src="/statics/js/bootstrap.js"></script>
<script type="text/javascript">
    $(function () {
        setInterval("setInter()", 1000);
    });
    del = function (id, obj) {
        if (confirm("确定删除么?")) {
            $.post("/delUser/" + id, function (result) {
                if (result > 0) {
                    alert("删除成功!");
                    $(obj).parent().parent().remove();
                }
            }, "JSON");
        }
    }

    function setInter() {
        var indeed = ["yellow", "red", "blue", "green", "#c0be00", "fuchsia", "aqua", "#dce7ff", "orange", "#70f500"];
        var number1 = Math.random() + "";
        var number2 = Math.random() + "";

        var s1 = number1.substring(2, 3);
        var s2 = number2.substring(2, 3);
        $("tr:odd").css("background", indeed[s1]);
        $("td:even").css("background", indeed[s2]);
        //$("tr:even").css("background", indeed[s2]);
    }
</script>
</html>
