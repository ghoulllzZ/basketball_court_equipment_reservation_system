<%@ page language="java" import="java.text.SimpleDateFormat" pageEncoding="utf-8" %>
<%@ page import="java.util.Date" %>
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
        function selimage() {

            layer.open({
                type: 2,
                title: '上传图片',
                area: ['500px', '100px'],
                offset: '250px',
                content: '<%=basePath%>upload_images.jsp'
            });
        }

        function check() {

            var password = document.myform.password.value;
            var password1 = document.myform.password1.value;
            if (password != password1) {
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
    <jsp:include page="layout_top.jsp"></jsp:include>
    <!--头---------------------------------------------------------------------------------------------->


    <!-- ------------------------------------------------------------------------------内容主体区域 -->
    <div class="page_body_box">


        <span>用户注册</span>


    </div>
    <div class="layui-row    layout_page">


                    <form class="layui-form layui_form_web" action="front/register.do" method="post" name="myform"
                    >

                        <div class="layui-form-item">
                            <label class="layui-form-label">用户名:</label>
                            <div class="layui-input-block">
                                <input class="layui-input" type="text" name="username" required value=""
                                       placeholder="请输入用户名" autocomplete="off">
                            </div>
                        </div>
                        <div class="layui-form-item">
                            <label class="layui-form-label">密码:</label>
                            <div class="layui-input-block">
                                <input class="layui-input" type="password" name="password" id="password" required

                                       value=""
                                       placeholder="请输入密码" autocomplete="off">
                            </div>
                        </div>

                        <div class="layui-form-item">
                            <label class="layui-form-label">确认密码:</label>
                            <div class="layui-input-block">
                                <input class="layui-input" type="password" name="password1" id="password1" required

                                       value=""
                                       placeholder="请输入确认密码" autocomplete="off">
                            </div>
                        </div>
                        <div class="layui-form-item">
                            <label class="layui-form-label">姓名:</label>
                            <div class="layui-input-block">
                                <input class="layui-input" type="text" name="realname" required value=""
                                       placeholder="请输入用户名" autocomplete="off">
                            </div>
                        </div>
                        <div class="layui-form-item">
                            <label class="layui-form-label">QQ:</label>
                            <div class="layui-input-block">
                                <input class="layui-input" type="text" name="qq" required value=""
                                       placeholder="请输入" autocomplete="off">
                            </div>
                        </div>
                        <div class="layui-form-item">
                            <label class="layui-form-label">身份证号:</label>
                            <div class="layui-input-block">
                                <input class="layui-input" type="text" name="idcard" required value=""
                                       placeholder="请输入" autocomplete="off">
                            </div>
                        </div>
                        <div class="layui-form-item">
                            <label class="layui-form-label">邮件:</label>
                            <div class="layui-input-block">
                                <input class="layui-input" type="text" name="email" required value=""
                                       placeholder="请输入" autocomplete="off">
                            </div>
                        </div>


                        <input type="hidden" name="iscooled" value="0">
                        <input type="hidden" name="college" value="">
                        <input type="hidden" name="major" value="">
                        <input type="hidden" name="grades0" value="0">
                        <input type="hidden" name="grades1" value="">
                        <input type="hidden" name="grades2" value="">
                        <input type="hidden" name="grades3" value="">
                        <input type="hidden" name="grades4" value="">
                        <input type="hidden" name="grades5" value="">
                        <input type="hidden" name="grades6" value="">

                        <div class="layui-form-item">
                            <label class="layui-form-label">性别:</label>
                            <div class="layui-input-block">
                                <input type="radio" name="sex" value="男" checked="checked" title="男">
                                <input type="radio" name="sex" value="女" title="女">

                            </div>
                        </div>
                        <div class="layui-form-item">
                            <label class="layui-form-label">出生日期:</label>
                            <div class="layui-input-block">
                                <script language="javascript" type="text/javascript"
                                        src="<%=basePath%>resources_web/My97DatePicker/WdatePicker.js"
                                        charset="utf-8"></script>
                                <input readonly="readonly" type="text" name="birthday" required="required"
                                       lay-verify="date"
                                       value="<%=new SimpleDateFormat("yyyy-MM-dd").format(new Date()) %>"
                                       onfocus="WdatePicker({dateFmt:'yyyy-MM-dd',maxDate:'%y-%M-%d'})"
                                       autocomplete="off"
                                       class="layui-input   Wdate">
                            </div>
                        </div>
                        <div class="layui-form-item">
                            <label class="layui-form-label">联系手机:</label>
                            <div class="layui-input-block">
                                <input class="layui-input" type="tel" placeholder="请输入手机" name="contact"
                                       lay-verify="required|phone"
                                       autocomplete="off"
                                >
                            </div>
                        </div>
                        <div class="layui-form-item">
                            <label class="layui-form-label">联系地址:</label>
                            <div class="layui-input-block">
                                <input class="layui-input" type="text" placeholder="请输入地址" name="address"
                                       autocomplete="off"
                                >
                            </div>
                        </div>
                        <div class="layui-form-item">
                            <label class="layui-form-label">头像:</label>
                            <div class="layui-input-block">
                                <input class="layui-input" type="text" name="image" id="image"
                                       placeholder="选择图片" onclick="selimage();"
                                       readonly="readonly">
                            </div>
                        </div>
                        <div class="layui-form-item">
                            <label class="layui-form-label"></label>
                            <div class="layui-input-block">
                                <input type="submit" onclick="return check()" class="layui-btn layui-btn-normal  "
                                       name="Submit" value="注册"/>&nbsp;&nbsp;&nbsp;&nbsp;

                            </div>
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
        layui.use(['element', 'layer', 'carousel', 'util', 'flow', 'form'], function () {


        });

    })(window.jQuery);
</script>
</body>
</html>
