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
        <span>    场地器材        </span>
    </div>

    <div class="layui-row   layout_page">


        <div class="layui-col-md12">

            <form class="search_list layui-form " action="" method="post">
                <div class="layui-form-item">
                    <div class="layui-input-inline">
                        <input type="text" name="thinginfokeyword" id="thinginfokeyword" lay-verify="required"
                               placeholder="请输入关键字 "
                               value="${thinginfokeyword}"
                               autocomplete="off"
                               class="layui-input">
                    </div>

                    <button class="layui-btn ">
                        <i class="layui-icon">&#xe615;</i> 搜索
                    </button>

                </div>
            </form>

            <ul class="pic_ul_css ">

                        <c:forEach items="${thinginfoList}" var="thinginfo" varStatus="status">
                            <li>
                                <a href="front/thinginfoDetail.do?id=${thinginfo.thinginfoid }">
                                    <img src="${thinginfo.image }" class="project-img"/>
                                </a>
                                <p class="name">


                                    <a
                                            href="front/thinginfoDetail.do?id=${thinginfo.thinginfoid }"
                                    > ${thinginfo.thinginfoname } </a>

                                </p>

                            </li>

                        </c:forEach>
            </ul>


            <table width='98%' border='0' style="margin-top: 8px; margin-left: 5px;">
                <TR align="right">
                    <TD>
                        <form class="list_page" action="" method="get" name="formpage">
                            <input type="hidden" name="pageCount" value="${pager.pageCount}"/>
                            <!--//用于给上面javascript传值-->
                            <input type="hidden" name="page" value="${pager.pageNumber}"/>
                            <!--//用于给上面javascript传值-->
                            <input type="hidden" name="jumpurl"
                                   value="front/thinginfo.do?"/>
                            <!--//用于给上面javascript传值-->
                            <a href="javascript:;" onClick="PageTop()"><strong>首页</strong></a>&nbsp;&nbsp;&nbsp;
                            <a href="javascript:;" onClick='PagePre()'><strong>上一页</strong></a>&nbsp;&nbsp;&nbsp;

                            共${pager.rowCountTotal}条记录, 共计${pager.pageCount}页,
                            当前第${pager.pageNumber}页&nbsp;&nbsp;&nbsp;
                            <a href="javascript:;" onClick="PageNext()"><strong>下一页</strong></a>&nbsp;&nbsp;&nbsp;

                            <a href="javascript:;" onClick="PageLast()"><strong>尾页</strong></a>
                        </form>
                        <script type="text/javascript" src="resources_web/js/page.js"></script>
                    </td>
                </tr>
            </table>
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
