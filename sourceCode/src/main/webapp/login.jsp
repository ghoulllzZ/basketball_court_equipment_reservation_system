<%@ page language="java" pageEncoding="utf-8" %>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://"
            + request.getServerName() + ":" + request.getServerPort()
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

    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <style type="text/css">


        .login-box_aa {
            width: 356px;
            margin: 0 auto;
            min-height: 550px;
            padding-top: 190px;

        }


        .login-title {
            padding-bottom: 20px;
        }

        .login-title h2 {
            text-align: center;
            padding-bottom: 10px;
            font-size: 36px;
            color: #FFFFFF;
            font-weight: bold;
        }

        .layui-btn {
            border: medium none;
            border-radius: 2px;

            width: 100%;
        }


    </style>
</head>
<body>

<div class="layui-layout layui-layout-admin">


    <!--头---------------------------------------------------------------------------------------------->
    <jsp:include page="layout_top.jsp"></jsp:include>
    <!--头---------------------------------------------------------------------------------------------->


    <!-- ------------------------------------------------------------------------------内容主体区域 -->


        <div class=" login-box_aa">
        <div class="login-title"><h2>用户登录</h2></div>
                <form class="layui-form" action="front/login.do" method="post" name="myform">
                    <div class="layui-form-item layui-input-wrap">
                        <div class="layui-input-prefix  layui-input-split">
                            <i class="layui-icon layui-icon-username"></i>
                        </div>
                <input autocomplete="off" class="layui-input" lay-verify="required"  name="username" id="username"
                       placeholder="请输入用户名"
                       required type="text" value="">
            </div>
            <div class="layui-form-item layui-input-wrap">
                <div class="layui-input-prefix layui-input-split">
                    <i class="layui-icon layui-icon-password"></i>
                </div>
                <input autocomplete="off" class="layui-input" lay-verify="required"  name="password"  id="password"
                       placeholder="请输入密码"
                       required type="password"  value="" >
            </div>
            <div class="layui-form-item" id="login_code_em">
                <div class="layui-input-inline layui-input-wrap">
                    <div class="layui-input-prefix layui-input-split">
                        <i class="layui-icon layui-icon-vercode"></i>
                    </div>
                    <input style="width:180px" autocomplete="off" class="layui-input" lay-verify="required"
                            name="code" id="code"
                           placeholder="请输入验证码"
                           required type="text"  value=""
                           onbeforepaste="clipboardData.setData('text',clipboardData.getData('text').replace(/[^\d]/g,''))"
                           onkeyup="value=value.replace(/[\W]/g,'')"

                    >
                </div>
                        <div class=" layui-word-aux">
                            <img id="cpacha-img" title="点击切换验证码"
                                 style="cursor:pointer;width: 100px;height:38px;border-radius: 8px;border: 1px solid #d2d2d2  ;margin-left: 5px"
                                 src="system/getCpacha.do?vl=4&w=100&h=38&type=loginCpacha"
                                 onclick="changeCpacha()">
                </div>
            </div>
            <div class="layui-form-item">
                <button class="layui-btn     "
                        lay-filter="register-form-commit"
                        lay-submit>登录
                </button>
            </div>
        </form>


    </div>


    <!-- ------------------------------------------------------------------------底部固定区域 -->
    <jsp:include page="layout_bottom.jsp"></jsp:include>

    <!-- ------------------------------------------------------------------------底部固定区域 -->


</div>
<script src="resources_web/layui/layui.js"></script>
<script>
    (function ($) {


        // 主方法
        layui.use(['element', 'layer', 'carousel', 'util', 'flow'], function () {

            var carousel = layui.carousel;


            // 常规轮播
            carousel.render({
                elem: '#carousel-ad',
                width: '100%',
                height: '300px',
                interval: 3000
            });


        });

    })(window.jQuery);

    function changeCpacha() {
        $("#cpacha-img").attr("src", 'system/getCpacha.do?vl=4&w=100&h=38&type=loginCpacha&t=' + new Date().getTime());
    }



    window.addEventListener('load', function () {
        $.get('system/get_login_set.do', function (response) {
            var auto_fill_login_username = response.auto_fill_login_username
            var login_code = response.login_code
            var is_login_code = response.is_login_code

            if (auto_fill_login_username) {
                document.getElementById("username").value = "test";
                document.getElementById("password").value = "111111";
                document.getElementById("code").value = login_code;

            }
            if (!is_login_code) {
                document.getElementById("login_code_em").style.display = "none";
                document.getElementById("code").value = login_code;
            }
        });
    });
</script>
</body>
</html>


