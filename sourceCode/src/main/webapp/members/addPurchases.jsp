<%@ page language="java" import="java.text.SimpleDateFormat" pageEncoding="utf-8" %>
<%@ page import="java.util.Date" %>
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


</head>
<body>
<div class="layui-layout layui-layout-admin">


    <!--头---------------------------------------------------------------------------------------------->
    <jsp:include page="../layout_top.jsp"></jsp:include>
    <!--头---------------------------------------------------------------------------------------------->


    <!-- ------------------------------------------------------------------------------内容主体区域 -->
    <div class="page_body_box">
        <span>

确认信息


        </span>
    </div>
    <div class="layui-row   layout_page">


        <div class="layui-col-md12">
           

            <form class="layui-form layui_form_web" method="post" action="front/addPurchases.do"
                  name="myform">
                <div class="layui-form-item">
                    <label class="layui-form-label">场地器材名称:</label>
                    <div class="layui-form-mid">
                        ${thinginfo.thinginfoname }

                        <input type="hidden" name="thinginfoid"
                               value="${thinginfo.thinginfoid }">

                    </div>
                </div>
                <div class="layui-form-item">
                    <label class="layui-form-label">单价:</label>
                    <div class="layui-form-mid">
                        ${thinginfo.thingprice }


                    </div>
                </div>


                <div class="layui-form-item">
                    <label class="layui-form-label">预约日期:</label>
                    <div class="layui-input-block">
                        <script language="javascript" type="text/javascript"
                                src="<%=basePath%>resources_web/My97DatePicker/WdatePicker.js"
                                charset="utf-8"></script>
                        <input readonly="readonly" type="text" name="purchase_time" required="required"
                               lay-verify="date"
                               value="<%=new SimpleDateFormat("yyyy-MM-dd").format(new Date()) %>"
                               onfocus="WdatePicker({dateFmt:'yyyy-MM-dd',minDate:'%y-%M-%d'})"
                               autocomplete="off"
                               class="layui-input   Wdate">


                    </div>
                </div>
                <div class="layui-form-item">
                    <label class="layui-form-label">数量:</label>
                    <div class="layui-input-block">

                        <input class="layui-input" type="number" name="memo"
                               value="1">


                    </div>
                </div>


                <div class="layui-form-item">
                    <label class="layui-form-label"></label>
                    <div class="layui-input-block">
                        <input type="submit" name="submit"
                               class="layui-btn layui-btn-normal  "
                               onclick="{if(confirm('确定以上信息吗?')){return true;}return false;}"
                               value="提交"/>
                    </div>
                </div>

            </form>


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
        layui.use(['element', 'layer', 'carousel', 'util', 'flow'], function () {


        });

    })(window.jQuery);
</script>
</body>
</html>
