<%@ page language="java" pageEncoding="utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
            + path + "/";
%>


<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta content="text/html; charset=UTF-8" http-equiv="Content-Type">
    <base href="<%=basePath%>">
    <title>${title}</title>
    <link rel="stylesheet" href="resources_web/layui/css/layui.css">
    <link rel="stylesheet" href="resources_web/css/front_css.css">

    <script src="resources_web/js/jquery-3.2.1.js"></script>
    <script src="resources_web/js/main.js"></script>

    <link rel="stylesheet" type="text/css" href="resources_web/css/carousel.css"/>
    <meta content="webkit" name="renderer">
    <meta content="IE=edge,chrome=1" http-equiv="X-UA-Compatible">
    <meta content="width=device-width, initial-scale=1, maximum-scale=1" name="viewport">

</head>
<body>

<div class="layui-layout layui-layout-admin">


    <!--头---------------------------------------------------------------------------------------------->
    <jsp:include page="layout_top.jsp"></jsp:include>
    <!--头---------------------------------------------------------------------------------------------->


    <!-- ------------------------------------------------------------------------------内容主体区域 -->
    <div class="carousel_images">

        <div class="swiper-container">
            <div class="swiper-wrapper">
                    <c:forEach items="${favList}" var="var" varStatus="status" begin="0" end="3">
                           <div class="swiper-slide swiper-slide-center none-effect">
                            <a href="front/broadcastDetail.do?id=${var.broadcastid }">
                                <img src="${var.image }" style="width:100%;height:460px"/>
                            </a>
                        <div class="layer-mask"></div>
                    </div>


                </c:forEach>
            </div>
            <div class="button">
                <div class="swiper-button-prev"></div>
                <div class="swiper-button-next"></div>
            </div>
        </div>


    </div>

    <div class="layui-row  layout_page ">

        <div class="new-wrap layui-col-md12 layui-col-xs12 layui-col-sm12">


            <ul class="pic_ul_css ">


            <c:forEach items="${thinginfoList}" var="thinginfo" varStatus="status">
                <li>

                    <a href="front/thinginfoDetail.do?id=${thinginfo.thinginfoid }">
                        <img src="${thinginfo.image }"/>

                        <span>

                                ${  thinginfo.thinginfoname }
                        </span>
                    </a>

                </li>
            </c:forEach>


        </ul>

    </div>
    

    </div>
    <!-- ------------------------------------------------------------------------底部固定区域 -->
    <jsp:include page="layout_bottom.jsp"></jsp:include>

    <!-- ------------------------------------------------------------------------底部固定区域 -->
</div>
<script src="resources_web/layui/layui.js"></script>
<script src="resources_web/js/swiper.min.js"></script>
<script type="text/javascript">

    window.onload = function () {
        var swiper = new Swiper('.swiper-container', {
            autoplay: false,
            speed: 2000,
            autoplayDisableOnInteraction: false,
            loop: true,
            centeredSlides: true,
            slidesPerView: 2,
            pagination: '.swiper-pagination',
            paginationClickable: true,
            prevButton: '.swiper-button-prev',
            nextButton: '.swiper-button-next',
            onInit: function (swiper) {
                swiper.slides[2].className = "swiper-slide swiper-slide-active";
            },
            breakpoints: {
                668: {
                    slidesPerView: 1,
                }
            }
        });
    }


</script>
<script>

    (function ($) {

        // 主方法
        layui.use(['form', 'table', 'element', 'layer', 'carousel', 'util', 'flow'], function () {

            var carousel = layui.carousel;


            var table = layui.table;


//转换静态表格
            table.init('tabledata', {

                toolbar: '#toolbarDemo' //开启头部工具栏，并为其绑定左侧模板


                , even: true //开启隔行背景
            });


        });

    })(window.jQuery);
</script>
</body>
</html>
