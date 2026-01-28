<%@ page language="java" pageEncoding="utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
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


             ${thinginfo.thinginfoname }

        </span>
    </div>
    <div class="layui-row   layout_page">


        <div class="layui-col-md12">
            <section class="demo_section demo_section_light  ">
                <div class="container">
                     
                    <div class="layui-row ">
                        <div class="layui-col-md8" style="text-align: center;min-height: 300px">

                            <img src="${thinginfo.image}" height="360px"
                                 style="text-align: center;min-height: 350px;width: 90% ">

                        </div>
                        <div class="layui-col-md4">
                            <div class="layui-form" lay-filter="component-form-group">

                                <div class="layui-form-item">
                                    <label class="layui-form-label  " style="color: #c2c2c2">发布日期</label>

                                    <div class="layui-input-block">
                                        <div class="layui-inline">
                                            <div class="layui-form-mid ">
                                                ${thinginfo.createdate }
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="layui-form-item">
                                    <label class="layui-form-label  " style="color: #c2c2c2">可预约数量</label>

                                    <div class="layui-input-block">
                                        <div class="layui-inline">
                                            <div class="layui-form-mid ">${thinginfo.countrequire }

                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="layui-form-item">
                                    <label class="layui-form-label  " style="color: #c2c2c2">场地器材类型名称</label>

                                    <div class="layui-input-block">
                                        <div class="layui-inline">
                                            <div class="layui-form-mid ">
                                                <a
                                                        href="front/classifyinfoDetail.do?id=${thinginfo.classifyinfoid }">${thinginfo.classifyinfotitle }</a>

                                            </div>
                                        </div>
                                    </div>
                                </div>

                                <div class="layui-form-item">
                                    <label class="layui-form-label  " style="color: #c2c2c2"></label>

                                    <div class="layui-input-block">
                                        <div class="layui-inline">
                                            <div class="layui-form-mid ">
                                                <c:if test="${sessionScope.userid != null }">
                                                    <a   class="layui-btn  "
                                                       href="front/prePurchases.do?id=${thinginfo.thinginfoid }">点击预约</a>
                                                </c:if>
                                                <c:if test="${sessionScope.userid == null }">
                                                    <button class="layui-btn layui-btn-disabled " style="font-weight: bold"
                                                    >
                                                        登录后可预约
                                                    </button>
                                                </c:if>




                                            </div>
                                        </div>
                                    </div>
                                </div>


                            </div>


                        </div>

                    </div>
                    <h6 class="content" style="text-indent: 8px">

                        <p>
                            ${thinginfo.remark }
                        </p>
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
