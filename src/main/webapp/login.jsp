<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>登录界面</title>
    <link rel="stylesheet" href="/statics/css/bootstrap.css">
</head>
<body>
<div class="container">
    <div class="row">
        <div class="text-center table table-hover">
            <tr class="table-striped">
                <td><label><h2>欢迎登录</h2></label></td>
            </tr>
            <form class="form-inline" action="javaScript:void(0);" method="post">
                <label>用户名：</label><input class="form-control" name="userCode" placeholder="请输入用户名"/>
                <br>
                <br>
                <label>密&nbsp;&nbsp;&nbsp;码：</label><input class="form-control " type="password" name="userPassword"
                                                           placeholder="请输入密码"/>
                <div class="form-inline" style="margin-top: 10px;">
                    <button class="btn btn-success" style="width: 11%;" type="submit">登录</button>
                    <button class="btn btn-danger"style="width: 11%"  onclick="window.location.href='/index.html'">返回</button>
                </div>
                <br>
                <p><a href="/userLogin.html">没有注册吗？点击注册！！！</a></p>
            </form>
        </div>
    </div>
</div>

</body>

<script src="/statics/js/jquery-1.12.4.js"></script>
<script src="/statics/js/bootstrap.js"></script>
<script type="text/javascript">
    $(function () {
        $("button[type='submit']").click(function () {
            var userCode = $("input[name='userCode']").val();
            var userPassword = $("input[name='userPassword']").val();

            if (userCode == null || userCode == '') {
                alert("用户名不能为空！！！");
                return false;
            } else if (userPassword == null || userPassword == '') {
                alert("密码不能为空！！！");
                return false;
            } else if (userPassword.length < 6) {
                alert("密码不能低于6位数！！！");
                return false;
            }
            $.get("/doLogin", {userCode: userCode, userPassword: userPassword}, function (result) {
                // if ("erorrs"==result){
                //     alert("用户名或密码错误！！！");
                //     return false;
                // }
                if (result != false) {
                    window.location.href = "/index.html";
                }else{
                    alert("用户名或密码错误！！！");
                }
            }, "JSON");
            return true;

        });
    });

</script>
</html>
