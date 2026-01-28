<%@ page language="java" pageEncoding="utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%><!DOCTYPE html>
<html>
<head>
    <base href="<%=basePath%>">

    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <title></title>
    <link rel="stylesheet" href="resources_web/layui/css/layui.css">

    <script src="resources_web/js/jquery-3.2.1.js"></script>
</head>
<body>
<div id="nav_bar_aa" class="nav_bar_aa">


    <img src='resources_web/images/logo.png' class="img_logo">

    <div class=" layui-layout-left layui-logo11">篮球场实有人员动态监测</div>


    <ul class="  layui-layout-right layui-info11">

        <a href="javascript:void(0);" id="manager/home_page.jsp" class="link">
            <i class="layui-icon layui-icon-home"> </i>
            首页
        </a>
        <a class="link" href="javascript:void(0);" id='manager/edit_password.jsp'>
            <i class="layui-icon layui-icon-password"></i>
            修改密码
        </a>
        <a href="javascript:void(0);" onclick="logout()">
            <i class="layui-icon layui-icon-logout"></i>
            退出登录
        </a>
        <span>欢迎您：管理员 ${sessionScope.managername}</span>
    </ul>
</div>

<div id="nav_bar" class="nav_bar">

    <ul class="layui-nav  " lay-filter="nav-menu-top">

        <li class="layui-nav-item "><a href="javascript:;"><i class="layui-icon layui-icon-vercode"> </i>管理员</a>
                    <dl class="layui-nav-child">

                        <c:if test="${sessionScope.managerid eq '1' }">
                            <dd>
                                <a class="link" href="javascript:void(0);" id="manager/manager/create.do">新增管理员</a>
                            </dd>
                        </c:if>


                        <dd><a class="link" href="javascript:void(0);" id='manager/manager/getAll.do'>管理员用户</a></dd>


                    </dl>
                </li>
                <li class="layui-nav-item "><a href="javascript:;"><i class="layui-icon layui-icon-vercode"> </i>商品管理</a>
                    <dl class="layui-nav-child">
                        <dd><a class="link" href="javascript:void(0);" id='manager/goodsinfo/create.do'>新增商品</a>
                        </dd>
                        <dd><a class="link" href="javascript:void(0);" id='manager/goodsinfo/getAll.do'>商品管理</a></dd>


                    </dl>
                </li>
                <li class="layui-nav-item layui-nav-itemed">
                    <a class="link" href="javascript:void(0);"
                                                               id="manager/purchases/getAll.do"><i class="layui-icon layui-icon-vercode"> </i>预约处理</a>
                </li>



                <li class="layui-nav-item">
                    <a href="javascript:;"><i class="layui-icon layui-icon-vercode"> </i>场地器材</a>
                    <dl class="layui-nav-child">
                        <dd><a class="link" href="javascript:void(0);" id="manager/classifyinfo/create.do"
                        >新增场地器材类型</a>
                        </dd>
                        <dd><a class="link" href="javascript:void(0);" id="manager/classifyinfo/getAll.do">场地器材类型列表</a>
                        </dd>
                        <dd><a class="link" href="javascript:void(0);" id="manager/thinginfo/create.do"
                        >新增场地器材</a>
                        </dd>
                        <dd><a class="link" href="javascript:void(0);" id="manager/thinginfo/getAll.do"
                        >场地器材列表</a>
                        </dd>

                    </dl>
                </li>


                <li class="layui-nav-item">
                    <a href="javascript:;"><i class="layui-icon layui-icon-vercode"> </i>新闻通知</a>
                    <dl class="layui-nav-child">

                        <dd>
                            <a class="link" href="javascript:void(0);" id='manager/broadcast_kinds/create.do'>新增分类</a>
                        </dd>
                        <dd>
                            <a class="link" href="javascript:void(0);" id='manager/broadcast_kinds/getAll.do'>分类列表</a>
                        </dd>

                        <dd>
                            <a class="link" href="javascript:void(0);" id='manager/broadcast/create.do'>新增新闻通知</a>
                        </dd>
                        <dd>
                            <a class="link" href="javascript:void(0);" id='manager/broadcast/getAll.do'>新闻通知列表</a>
                        </dd>

                    </dl>
                </li>




                <li class="layui-nav-item">
                    <a href="javascript:;"><i class="layui-icon layui-icon-vercode"> </i>用户管理</a>
                    <dl class="layui-nav-child">

                        <dd>
                            <a class="link" href="javascript:void(0);" id='manager/members/getAll.do'> 用户列表</a>

                        </dd>


                    </dl>
                </li>


    </ul>

</div>

<div class="layui-row">
    <!-- 内容主体区域 -->
    <iframe id="mainFrame" src="manager/home_page.jsp" width="100%" frameborder="0" onload="changeFrameHeight()">
    </iframe>


</div>

<script src="resources_web/layui/layui.js"></script>
<script>
    function changeFrameHeight() {
        var ifm = document.getElementById("mainFrame");
        var hh = document.documentElement.clientHeight - $("#nav_bar").height() - $("#nav_bar_aa").height() - 5;

        ifm.height = hh;//(nav_bar顶部高度)
    }

    /*点击菜单后,从这里跳转*/
    $(".link").each(function () {
        $(this).on("click", function () {
            var url = "";
            var id = $(this).attr("id");

            $("#mainFrame").attr("src", id);
        });
    });  //JavaScript代码区域
    layui.use('element', function () {
        var element = layui.element;

    });

    (function ($) {


        var ItemType = '';

        // 主方法
        layui.use(['element', 'table', 'layer', 'form'], function () {

            var table = layui.table, element = layui.element, layer = layui.layer, form = layui.form;


        });

    })(window.jQuery);


    function logout() {
        layer.confirm('确定退出?', function (index) {

            layer.close(index);
            parent.location.href = '<%=basePath%>manager/login/exit.do';


        });
    }


</script>

<style>


    .nav_bar_aa {
        background: url(resources_web/images/bg.jpg) no-repeat center fixed;
        -webkit-background-size: cover;
        -moz-background-size: cover;
        -o-background-size: cover;
        background-size: cover;
        color: rgba(255, 255, 255, .95);
        height: 40px;
        line-height: 40px;
        border-bottom: 1px solid rgba(255, 255, 255, 0.26);
        box-shadow: 0 1px 12px 0 rgba(0, 0, 0, 10.55);

    }

    .nav_bar {
        background: url(resources_web/images/bg.jpg) no-repeat center fixed;
        -webkit-background-size: cover;
        -moz-background-size: cover;
        -o-background-size: cover;
        background-size: cover;
        color: rgba(255, 255, 255, .95);
        border-bottom: 1px solid rgba(255, 255, 255, 0.26);
        box-shadow: 0 1px 12px 0 rgba(0, 0, 0, .55);
    }

    .img_logo {
        height: 80%;
        position: relative;
        top: 5px;
        margin-right: 10px;
        margin-left: 10px;
        opacity: 0.9;
        vertical-align: center;
        filter: drop-shadow(10px 10px 10px rgba(255, 255, 255, .3));
    }


    .layui-logo11 {
        font-weight: bold;
        font-size: 18px;
        color: rgba(255, 255, 255, .7);

        margin-right: 30px;
        top: 0;
        left: 80px;


        line-height: 40px;
        text-align: center;
        text-shadow: #cccccc 0 1px 0;
    }

    .layui-info11 {

        color: rgba(255, 255, 255, .7);

        margin-right: 20px;
        top: 0;


        line-height: 40px;
        text-align: center;
        text-shadow: #cccccc 0 1px 0;

    }

    .layui-info11 span {
        font-weight: bold;
        font-size: 14px;


        line-height: 40px;
        text-align: center;


    }

    .layui-info11 a {
        color: rgba(255, 255, 255, .7);
        margin-right: 20px;
    }

    .layui-info11 a:hover {
        color: #ffffff;
    }


    .layui-nav {
        padding: 0 20px;
        background-color: transparent;
        text-align: center;
    }

    .layui-nav .layui-nav-item {
        line-height: 30px
    }

    .layui-nav .layui-nav-item a {
        font-weight: bold;
        padding: 0 30px;
        color: #ffffff !important;
    }

    /*下拉菜单 颜色*/
    .layui-nav .layui-nav-child a {
        color: #333 !important;
    }

    .layui-nav .layui-nav-child a:hover {
        background-color: #f2f2f2;
        color: #333 !important;
    }

    .layui-nav-bar, .layui-nav-itemed:after, .layui-nav .layui-this:after {
        background-color: #BDBAAF;
    }


    .layui-nav-itemed > .layui-nav-child {
        padding: 0;
    }

    .layui-nav .layui-nav-item .layui-icon {
        display: block;
        margin: 0 auto 2px;
        font-size: 28px;
        width: 28px;
        height: 28px;
        margin-top: 5px;
    }

    .layui-nav .layui-nav-mored,
    .layui-nav-itemed > a .layui-nav-more,
    .layui-nav .layui-nav-more {
        font-size: 14px !important;
        top: 10px !important;
        /*
        left: 90px !important;
        */
    }

</style>

</body>
</html>

