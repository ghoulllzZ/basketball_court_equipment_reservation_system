<%@ page language="java" pageEncoding="utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
            + path + "/";
%><!DOCTYPE html>
<html>

<head>
    <title></title>
    <base href="<%=basePath%>"/>
    <meta http-equiv="Content-Type" content="text/html; charset=utf8"/>

    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport"
          content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=0">
    <link rel="stylesheet" href="resources_web/layui/css/layui.css">
    <link rel="stylesheet" href="resources_web/css/manager_css.css">
    <script src="resources_web/js/jquery-3.2.1.js"></script>
    <script type="text/javascript">


        function check() {

            var repassword = $("#repassword").val();
            var newpassword = $("#newpassword").val();
            if (repassword != newpassword) {
                alert('两次密码要一样');
                return false;
            }

        }
    </script>
</head>
<body>


<div class="layui-row">
    <fieldset class="layui-elem-field layui-field-title" style="margin-top: 20px;">
        <legend>修改密码 ${message}</legend>
    </fieldset>
    <form class="layui-form layui_form_web" method="post" action="manager/manager/edit_password.do" name="myform"
          onsubmit="return check()">
        <div class="layui-form-item">
            <label class="layui-form-label">用户名</label>
            <div class="layui-input-block">
                <div class="layui-form-mid">
                    <%=session.getAttribute("managername")%>
                </div>
                <%--  <input
                          type="hidden" name="username" style="width: 160px" id="username"
                          value="<%=session.getAttribute("managername")%>"/>--%>
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">密码</label>
            <div class="layui-input-block">
                <input type="password" name="password" lay-verify="required" required="required"
                       class="layui-input"
                       style="width: 160px" id="password"/>
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">新密码</label>
            <div class="layui-input-block">
                <input type="password" name="newpassword" lay-verify="required" required="required"
                       class="layui-input"
                       style="width: 160px" id="newpassword"/>
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">确认密码</label>
            <div class="layui-input-block">
                <input type="password" name="repassword" lay-verify="required" required="required"
                       class="layui-input"
                       style="width: 160px" id="repassword"/>
            </div>
        </div>

        <div class="layui-form-item">
            <div class="layui-input-block">
                <input type="submit" name="Submit" class="layui-btn" lay-submit=""
                       value="提交"/> &nbsp;

            </div>
        </div>

    </form>
</div>

<script src="resources_web/layui/layui.js"></script>
<script>
    layui.use('form', function () {
        var form = layui.form; //只有执行了这一步，部分表单元素才会自动修饰成功

        //……

        //但是，如果你的HTML是动态生成的，自动渲染就会失效
        //因此你需要在相应的地方，执行下述方法来进行渲染
        form.render();
    });
</script>
</body>
</html>