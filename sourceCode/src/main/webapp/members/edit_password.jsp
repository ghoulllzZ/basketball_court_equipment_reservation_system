<%@ page language="java" pageEncoding="utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
            + path + "/";
%>


<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <base href="<%=basePath%>">
    <title>${title}</title>
    <link rel="stylesheet" href="resources_web/layui/css/layui.css">
    <link rel="stylesheet" href="resources_web/css/front_css.css">
    <script src="resources_web/js/jquery-3.2.1.js"></script>
    <script type="text/javascript">


        function check() {

            var repassword = document.myform.repassword.value;
            var repassword1 = document.myform.repassword1.value;
            if (repassword != repassword1) {
                alert('两次密码要一样');
                document.myform.password.focus();
                return false;
            }

        }
    </script>

    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">

</head>
<body>
<div class="layui-layout layui-layout-admin">


    <!--头---------------------------------------------------------------------------------------------->
    <jsp:include page="../layout_top.jsp"></jsp:include>
    <!--头---------------------------------------------------------------------------------------------->


    <!-- ------------------------------------------------------------------------------内容主体区域 -->
    <div class="page_body_box">
        <span>
修改密码
        </span>
    </div>
    <div class="layui-row    layout_page">


        <div class="layui-col-md12">

            <div>

                <div class="layui-anim layui-anim-up">
                    <form class="layui-form layui_form_web" action="front/edit_password.do" method="post" name="myform"
                          onSubmit="return check()">

                        <div class="layui-form-item">
                            <label class="layui-form-label">用户名:</label>
                            <div class="layui-input-block">
                                <div class="layui-form-mid">${sessionScope.members.username } </div>

                                <input
                                        type="hidden" name="username" style="width: 260px; height: 30px"
                                        id="username" value="${sessionScope.username }"/>
                            </div>
                        </div>
                        <div class="layui-form-item">
                            <label class="layui-form-label">旧密码:</label>
                            <div class="layui-input-block">
                                <input class="layui-input" type="password" name="password" id="password" required
                                       lay-verify="required"
                                       value=""
                                       placeholder="请输入密码" autocomplete="off" class="layui-input">
                            </div>
                        </div>

                        <div class="layui-form-item">
                            <label class="layui-form-label">新密码:</label>
                            <div class="layui-input-block">
                                <input class="layui-input" type="password" name="repassword" id="repassword"
                                       required
                                       lay-verify="required"
                                       value=""
                                       placeholder="请输入确认密码" autocomplete="off" class="layui-input">
                            </div>
                        </div>
                        <div class="layui-form-item">
                            <label class="layui-form-label"> 确认新密码:</label>
                            <div class="layui-input-block">
                                <input class="layui-input" type="password" name="repassword1"
                                       id="repassword1" required
                                       lay-verify="required"
                                       value=""
                                       placeholder="请输入确认密码" autocomplete="off" class="layui-input">
                            </div>
                        </div>

                        <div class="layui-form-item">
                            
                            <div class="layui-input-block">
                                <input type="submit" class="layui-btn layui-btn-normal  " name="Submit"
                                       value="提交"/>&nbsp;&nbsp;&nbsp;&nbsp;

                            </div>
                        </div>


                    </form>

                </div>
            </div>


        </div>


    </div>


    <!-- ------------------------------------------------------------------------底部固定区域 -->
    <jsp:include page="../layout_bottom.jsp"></jsp:include>

    <!-- ------------------------------------------------------------------------底部固定区域 -->


</div>
<script src="resources_web/layui/layui.js"></script>
<script>
    (function ($) {


        // 主方法
        layui.use(['element', 'layer', 'carousel', 'util', 'flow', 'form'], function () {


        });

    })(window.jQuery);
</script>
</body>
</html>
