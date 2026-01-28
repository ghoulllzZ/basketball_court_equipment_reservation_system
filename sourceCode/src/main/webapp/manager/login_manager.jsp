<%@ page language="java" pageEncoding="utf-8" %>
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
    <base href="<%=basePath%>"/>
    <title> 后台管理系统</title>
    <link rel="stylesheet" href="resources_web/layui/css/layui.css">

    <script src="resources_web/js/jquery-3.2.1.js"></script>


</head>
<body>
<div class="layui-anim layui-anim-scaleSpring signin">

    <div class="box1">
        <div class="middle1">
            <div class="middle_aaaaaaaaaa">
                <div class='content'>
                    <h1>篮球场实有人员动态监测</h1>

                    <p style="line-height: 32px">

                        信息系统（Information system）<br>是由计算机硬件、网络和通信设备、计算机软件、信息资源、信息用户
                        <br>和规章制度组成的以处理信息流为目的的
                        人机一体化系统。

                    </p>

                </div>
            </div>
            <div class="middle_bbbbbbbb">
                <div class="mr_box">
                    <h2>欢迎登录</h2>

        <form class="layui-form" action="<%=basePath%>manager/login/login.do" id="login-form">
                        <div class="layui-form-item">
                            <div class="layui-input-block">
                                <input type="text"  name="username" id="username" required
                                       lay-verify="required" placeholder="请输入账号" autocomplete="off"  value=""
                                       class="layui-input">
                            </div>
                        </div>
                        <div class="layui-form-item">
                            <div class="layui-input-block">
                                <input type="password"  name="password"  id="password"  required
                                       lay-verify="required" placeholder="请输入账号密码" autocomplete="off"  value=""
                                       class="layui-input">
                            </div>
                        </div>
        <div class="layui-form-item  " id="login_code_em">
            <div class="layui-input-inline">


                <input type="text"   name="code" id="code"  maxlength="4" required
                       class="layui-input"
                       lay-verify="required"
                       placeholder="验证码"
                                       onbeforepaste="clipboardData.setData('text',clipboardData.getData('text').replace(/[^\d]/g,''))"
                                       onkeyup="value=value.replace(/[\W]/g,'')"
                                        value=""
                                >
                            </div>


                            <img id="cpacha-img" title="点击切换验证码"
                                 style="cursor:pointer; border-radius: 35px;width:100px;height: 47px "
                                 src="system/getCpacha.do?vl=4&w=130&h=47&type=loginCpacha"
                                 onclick="changeCpacha()">


                        </div>


                        <div class="layui-form-item">
                <div class="layui-input-block">
                    <button class="layui-btn layui-btn-normal  " lay-submit
                            lay-filter="login-form-commit" style="width: 100%;">登录
                    </button>
                </div>
            </div>
                            <div style="color: #ff0000;font-weight: bold;text-shadow: 0 0 5px rgba(255, 255, 255, .9);">${message}</div>
                </form>

                </div>
            </div>
        </div>
    </div>


</div>
<div class="loginTip">

    <a href="<%=path%>">回到首页</a>
    <br>篮球场实有人员动态监测 版权所有
</div>
<script src="resources_web/layui/layui.js"></script>
<script type="text/javascript">
    function checkLogin() {
        var username = document.form1.username.value;
        var password = document.form1.password.value;
        if (username == '') {
            alert('请输入用户名');
            document.form1.username.focus();
            return false;
        }
        /* if (password == '') {
             alert('请输入密码');
             document.form1.password.focus();
             return false;
         }*/
    }


</script>

<script>
    layui.use('form', function () {
        var form = layui.form; //只有执行了这一步，部分表单元素才会自动修饰成功

        //……

        //但是，如果你的HTML是动态生成的，自动渲染就会失效
        //因此你需要在相应的地方，执行下述方法来进行渲染
        form.render();
    });

    function changeCpacha() {
        $("#cpacha-img").attr("src", 'system/getCpacha.do?vl=4&w=150&h=40&type=loginCpacha&t=' + new Date().getTime());
    }



    window.addEventListener('load', function () {
        $.get('system/get_login_set.do', function (response) {
            var auto_fill_login_username = response.auto_fill_login_username
            var login_code = response.login_code
            var is_login_code = response.is_login_code

            if (auto_fill_login_username) {
                document.getElementById("username").value = "manager";
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
<style type="text/css">
    .layui-input-block {
        margin-left: 0;
    }


    body {
        background-image: url(resources_web/images/bg.jpg);
        background-size: 100% 100%;
        background-repeat: no-repeat;
        background-attachment: fixed;
    }

    h1 {
        font-size: 45px;
        line-height: 45px;
        letter-spacing: 15px;
        text-transform: uppercase;
    }

    h2 {
        text-shadow: 0 0 5px rgba(255, 255, 255, 1.29);
    }

    h1, p {
        margin: 30px 0;
    }


    .signin {
        height: 100%;
        color: rgba(255, 255, 255, .95);
        padding-top: 10%;
        padding-right: auto;
    }


    .signin .box1 {
        width: 1156px;
        margin: 1% auto 0;
        overflow: hidden;
        box-shadow: 0px 0px 13px 5px rgba(14, 25, 80, .9);
        border-radius: 20px;

    }


    .signin .box1 .middle1 {
        overflow: hidden;
    }

    .signin .box1 .middle1 .middle_aaaaaaaaaa {
        float: right;
        width: 716px;
    }


    @-webkit-keyframes slide_in {
        100% {
            -webkit-transform: translate(0px, 150px);
            transform: translate(0px, 150px);
            opacity: 1;
        }
    }

    @keyframes slide_in {
        100% {
            -webkit-transform: translate(0px, 150px);
            transform: translate(0px, 150px);
            opacity: 1;
        }
    }

    .signin .box1 .middle1 .middle_aaaaaaaaaa .content {
        position: relative;
        top: 20%;

        width: 100%;
        max-width: 716px;
        text-align: center;
        -webkit-transform: translate(-40%, 50vh);
        transform: translate(-40%, 50vh);
        opacity: 0;
        -webkit-animation: 0.75s 0.75s forwards slide_in;
        animation: 0.75s 0.75s forwards slide_in;


    }


    .signin .box1 .middle1 .middle_bbbbbbbb {
        width: 440px;
        float: left;
        background-color: rgba(0, 0, 0, 0.5);

    }

    .signin .box1 .middle1 .middle_bbbbbbbb .mr_box {
        width: 318px;
        margin: 0 auto;
        margin-top: 60px;
        margin-bottom: 60px;
    }

    .signin .box1 .middle1 .middle_bbbbbbbb .mr_box form {
        text-align: center;
    }

    .signin .box1 .middle1 .middle_bbbbbbbb .mr_box h2 {
        letter-spacing: 2px;
        margin-bottom: 50px;
        display: block;
        text-align: center;
        color: #0092e7;
        font-size: 30px;
        font-weight: bold;
    }

    input::-webkit-input-placeholder {
        color: #c1c1c1;
    }


    .layui-input {
        border: 1px solid rgba(255, 255, 255, 0.3);
        background: rgba(0, 0, 0, 0.1);
        border-radius: 35px;
        color: #ffffff;
        margin-bottom: 15px;

        padding: 12px 5px 12px 15px;

        height: 47px;
        box-shadow: 0 0 10px 0 rgba(255, 255, 255, .4);
    }

    ::-webkit-input-placeholder { /* WebKit browsers */
        color: #cccccc;

    }

    .layui-btn {
        border-radius: 35px;
        height: 47px;
        font-size: 22px;
        letter-spacing: 20px;
        box-shadow: 0 0 10px 0 rgba(255, 255, 255, .4);

    }

    .loginTip {
        position: fixed;
        left: 50%;
        transform: translate(-50%, -50%);
        margin: 0 auto;
        bottom: 0;
        color: rgba(230, 230, 230, .4);
        text-align: center;
    }

    .loginTip a {
        color: #6E1E36;
        text-shadow: 0 0 5px rgba(255, 255, 255, .9);
        font-weight: bold;
        display: block;
        font-size: 18px;
    }
</style>

</body>
</html>

