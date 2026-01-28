<%@ page language="java" pageEncoding="utf-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
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
    <jsp:include page="layout_top.jsp"></jsp:include>
    <!--头---------------------------------------------------------------------------------------------->


    <!-- ------------------------------------------------------------------------------内容主体区域 -->
    <div class="page_body_box">
        <span>


            ${broadcast.title }

        </span>
    </div>
    <div class="layui-row    layout_page">


        <div class="layui-col-md12">

            <section class="demo_section demo_section_light  ">
                <div class="container">
                    
                    <div class="title2"> 发布时间：

                        <fmt:formatDate value="${broadcast.addtime}" pattern="MM月dd日"/>
                        &nbsp;&nbsp; &nbsp;&nbsp;查看${broadcast.hits }次&nbsp;
                    </div>

                    <h6 class="content">
                        <img alt="" src="${broadcast.image }" width="80%" style="text-align: center">
                        <p>
                            ${broadcast.contents }
                        </p>
                        <video width='90%' poster="${broadcast.image }" controls="controls"
                               src="${broadcast.videopath }"
                               data-ckin="default" data-overlay="1" data-title="${broadcast.title }"></video>
                    </h6>
                </div>
            </section>


        </div>

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


        });

    })(window.jQuery);
</script>
</body>
</html>
