<%--
  Created by IntelliJ IDEA.
  User: Yuu
  Date: 2018/11/13
  Time: 14:51
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>Yuu Blog | 管理登录</title>
    <meta name="description" content="这是一个 login 页面">
    <meta name="keywords" content="login">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="renderer" content="webkit">
    <meta http-equiv="Cache-Control" content="no-siteapp" />
    <link rel="icon" type="image/png" href="/static/assets/i/favicon.ico">
    <link rel="apple-touch-icon-precomposed" href="/static/assets/i/favicon.ico">
    <meta name="apple-mobile-web-app-title" content="Yuu Blog" />
    <link rel="stylesheet" href="/static/assets/css/amazeui.min.css" />
    <link rel="stylesheet" href="/static/assets/css/app.css">
    <script src="/static/assets/js/jquery.min.js"></script>
</head>

<body data-type="login">
<script src="/static/assets/js/theme.js"></script>
<div class="am-g tpl-g">
    <div class="tpl-login">
        <div class="tpl-login-content">
            <div class="tpl-login-logo">
            </div>
            <div class="am-alert am-alert-danger" data-am-alert ${message == null ? "style='display:none;'" : ""}>
                <button type="button" class="am-close">&times;</button>
                <p>${message}</p>
            </div>
            <form id="loginForm" class="am-form tpl-form-line-form" action="/login" method="post">
                <div class="am-form-group">
                    <input type="text" class="tpl-form-input" id="username" name="username" placeholder="请输入用户名" required>
                </div>

                <div class="am-form-group">
                    <input type="password" class="tpl-form-input" id="password" name="password" placeholder="请输入密码" required>
                </div>
                <div class="am-form-group">
                    <input type="submit" class="am-btn am-btn-primary  am-btn-block tpl-btn-bg-color-success  tpl-login-btn" value="提交"/>
                </div>
            </form>
        </div>
    </div>
</div>
<script src="/static/assets/js/amazeui.min.js"></script>
<script src="/static/assets/js/app.js"></script>
<!-- validation -->
<script src="/static/assets/app/validate.js"></script>
<%--<script type="text/javascript">
    $(function () {
       $("#loginForm").validate({
           errorElement: 'span',
           errorClass: 'error_tip',
           rules:{
               username:{
                   required:true
               },
               password:{
                   required:true
               }
           },
           messages:{
               username:{
                   required:"用户名不能为空"
               },
               password:{
                   required:"密码不能为空"
               }
           },
           errorPlacement: function (error, element) {
               element.attr("class", "am-field-error");
               error.insertAfter(element);
           }
       }) ;
    });
</script>--%>

</body>

</html>