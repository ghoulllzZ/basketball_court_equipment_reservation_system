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
        <legend>添加</legend>
    </fieldset>
    <form class="layui-form layui_form_web" method="post" action="manager/thinginfo/add.do"
          name="myform" onsubmit="return check()">

        <div class="layui-form-item">
            <label class="layui-form-label">分类 </label>
            <div class="layui-input-inline">
                <style>
                    .layui-form-select dl {
                        z-index: 9999999;
                    }
                </style>
                <select name="classifyinfolid"
                        style="width: 160px;z-index: 999999" id="classifyinfolid">
                    <c:forEach items="${classifyinfoList}" var="var">
                        <option value="${var.classifyinfoid}">${var.title }</option>
                    </c:forEach>
                </select>
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">场地器材名称</label>
            <div class="layui-input-block"><input type="text" lay-verify="required" required="required"
                                                  class="layui-input" placeholder="请输入场地器材名称"
                                                  name="thinginfoname" style="width: 160px" id="thinginfoname"/>
            </div>
        </div>

        <div class="layui-form-item">
            <label class="layui-form-label">图片</label>
            <div class="layui-input-block">
                <input type="text" lay-verify="required" required="required"
                       class="layui-input" placeholder="请选择图片"
                       name="image" style="width: 160px" id="image"
                       onclick="selimage();" readonly="readonly"/></div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">场地器材信息</label>
            <div class="layui-input-block">

                <script id="remark" name="remark" type="text/plain"></script>
                <script type='text/javascript' src='resources_web/ueditor/ueditor.config_simple.js'></script>
                <script type='text/javascript' src='resources_web/ueditor/ueditor.all.js'></script>
                <script type='text/javascript' src='resources_web/ueditor/lang/zh-cn/zh-cn.js'></script>
                <script type='text/javascript'>  ue = UE.getEditor('remark');</script>
            </div>
        </div>


        <div class="layui-form-item">
            <label class="layui-form-label">数量</label>
            <div class="layui-input-block">
                <input type="number" lay-verify="required" required="required"
                       class="layui-input" placeholder="请输入数量"
                       name="countrequire" style="width: 160px" id="countrequire"/>
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">单价</label>
            <div class="layui-input-block">
                <input type="number" lay-verify="required" required="required"
                       class="layui-input" placeholder="请输入 "
                       name="thingprice" style="width: 160px" id="thingprice"/>
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