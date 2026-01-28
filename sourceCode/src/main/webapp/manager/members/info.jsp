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
    <script src="resources_web/js/jquery-3.2.1.js"></script>


    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <style>
        .layui-row {
            background-color: #f2f2f2;
            border: 1px solid #CCCCCC;

        }

        .layui-form-item {
            border: 1px solid #CCCCCC;
            margin-bottom: 0;
            /* padding: 15px;*/
        }

        .layui-form-label {
            color: #2a2a2a;
            font-weight: bold;
            width: 30%;
            border-right: 1px solid #CCCCCC;

            padding: 15px;


        }

        .layui-form-mid {


            padding: 15px !important;


        }
    </style>
</head>
<body>


<!-- ------------------------------------------------------------------------------内容主体区域 -->

<div style="text-align: center;font-size: 24px;font-weight: bold;padding: 30px">


    用户资料


</div>

<div style="width: 50%;margin: 0 auto;">
    <div class="layui-row    ">

        <div class="layui-col-md6">
            <div class="layui-form-item">
                <label class="layui-form-label">用户名:</label>
                <div class="layui-input-block">
                    <div class="layui-form-mid ">${members.username } </div>
                </div>
            </div>

            <div class="layui-form-item">
                <label class="layui-form-label">姓名:</label>
                <div class="layui-input-block">

                    <div class="layui-form-mid ">${members.realname } </div>
                </div>
            </div>
            <div class="layui-form-item">
                <label class="layui-form-label">性别:</label>
                <div class="layui-input-block">
                    <div class="layui-form-mid ">${members.sex }</div>
                </div>
            </div>

            <div class="layui-form-item">
                <label class="layui-form-label">出生日期:</label>
                <div class="layui-input-block">
                    <div class="layui-form-mid ">${members.birthday}</div>
                </div>
            </div>
            <div class="layui-form-item">
                <label class="layui-form-label">QQ:</label>
                <div class="layui-input-block">
                    <div class="layui-form-mid ">${members.qq }</div>
                </div>
            </div>
            <div class="layui-form-item">
                <label class="layui-form-label">身份证号:</label>
                <div class="layui-input-block">

                    <div class="layui-form-mid ">${members.idcard }</div>
                </div>
            </div>
            <div class="layui-form-item">
                <label class="layui-form-label">邮件:</label>
                <div class="layui-input-block">
                    <div class="layui-form-mid ">${members.email }</div>
                </div>
            </div>
            

        </div>

        <div class="layui-col-md6">
            <div class="layui-form-item">
                <div class="layui-input-block" style="margin-left: 0">
                    <img style="display: block;width: 250px;height: 258px;text-align: center;margin: 0 auto"
                         src="${members.image}" class="layui-nav-img">

                </div>

            </div>
            
            <div class="layui-form-item">
                <label class="layui-form-label">联系手机:</label>
                <div class="layui-input-block">
                    <div class="layui-form-mid ">${members.contact}</div>
                </div>
            </div>
            <div class="layui-form-item">
                <label class="layui-form-label">联系地址:</label>
                <div class="layui-input-block">
                    <div class="layui-form-mid "> ${members.address}</div>
                </div>
            </div>
             


        </div>
    </div>


</div>

<script src="resources_web/layui/layui.js"></script>
<script>


    // 主方法
    layui.use(['form', 'element', 'layer', 'carousel', 'util', 'flow'], function () {

        var form = layui.form; //只有执行了这一步，部分表单元素才会自动修饰成功

        //……

        //但是，如果你的HTML是动态生成的，自动渲染就会失效
        //因此你需要在相应的地方，执行下述方法来进行渲染
        form.render();
    });


</script>
</body>
</html>
