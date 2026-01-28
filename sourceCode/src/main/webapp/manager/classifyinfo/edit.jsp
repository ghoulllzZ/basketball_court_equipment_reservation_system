<%@ page language="java" pageEncoding="utf-8" %>
<%@ taglib
        prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
    <script language="javascript" type="text/javascript"
            src="<%=basePath%>resources_web/My97DatePicker/WdatePicker.js" charset="utf-8"></script>
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport"
          content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=0">
    <link rel="stylesheet" href="resources_web/layui/css/layui.css">
    <link rel="stylesheet" href="resources_web/css/manager_css.css">
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
    </script>
</head>
<body>


<div class="layui-row">
    <fieldset class="layui-elem-field layui-field-title" style="margin-top: 20px;">
        <legend>编辑</legend>
    </fieldset>
    <form class="layui-form layui_form_web" method="post" action="manager/classifyinfo/update.do"
          name="myform" onsubmit="return check()">
        <input type="hidden" name="classifyinfoid" value="${classifyinfo.classifyinfoid}"/>
        <input type="hidden" name="password" id="password" value="${classifyinfo.password}"/>


        <div class="layui-form-item">
            <label class="layui-form-label">场地器材类型名称</label>
            <div class="layui-input-block">
                <input type="text" lay-verify="required" required="required"
                       class="layui-input" name="title"
                       style="width: 160px" id="title" value="${classifyinfo.title}"/>
            </div>
        </div>

        <div class="layui-form-item">
            <label class="layui-form-label">图片</label>
            <div class="layui-input-block">
                <input type="text" lay-verify="required" required="required" class="layui-input"
                       value="${classifyinfo.image}"
                       name="image" style="width: 160px" id="image"
                       onclick="selimage();" readonly="readonly"/>
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">场地器材类型介绍</label>
            <div class="layui-input-block">

                <input type="text" name="slogan" class="layui-input" style="width: 160px" id="slogan"
                       value="${classifyinfo.slogan}"/>

            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">添加日期</label>
            <div class="layui-input-block">

                <input style="width: 160px" type="text" name="opendate" required="required"

                       value="${classifyinfo.opendate}"

                       class="layui-input">


            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">联系方式</label>
            <div class="layui-input-block">
                <input type="text" lay-verify="required" required="required" class="layui-input" name="contact"
                       style="width: 160px" id="contact" value="${classifyinfo.contact}"/></div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">分类介绍</label>
            <div class="layui-input-block">


                <script id="contents" name="contents" type="text/plain">${classifyinfo.contents}</script>
                <script type='text/javascript' src='resources_web/ueditor/ueditor.config_simple.js'></script>
                <script type='text/javascript' src='resources_web/ueditor/ueditor.all.js'></script>
                <script type='text/javascript' src='resources_web/ueditor/lang/zh-cn/zh-cn.js'></script>
                <script type='text/javascript'>  ue = UE.getEditor('contents');</script>


            </div>
        </div>
        <div class="layui-form-item">
            <div class="layui-input-block">
                <input type="submit" class="layui-btn" lay-submit="" name="Submit"
                       value="提交"/>&nbsp;&nbsp;&nbsp;&nbsp;
            </div>
        </div>
    </form>
</div>
<script src="resources_web/layui/layui.js"></script>
<script>
    function check() {
        /* if (document.myform.username.value == '') {
             alert('请输入用户名');
             return false;
         }
         if (document.myform.password.value == '') {
             alert('请输入密码');
             return false;
         }*/
        if (document.myform.title.value == '') {
            alert('请输入场地器材类型名称');
            return false;
        }
        if (document.myform.slogan.value == '') {
            alert('请输入场地器材类型介绍');
            return false;
        }
        if (document.myform.opendate.value == '') {
            alert('请输入添加日期');
            return false;
        }
        if (document.myform.contact.value == '') {
            alert('请输入联系方式');
            return false;
        }

        /* if (document.myform.contents.value == '') {
             alert('请输入分类介绍');
             return false;
         }*/
    }

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