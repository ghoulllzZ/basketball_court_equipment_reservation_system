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


            ${classifyinfo.title }

        </span>
    </div>
    <div class="layui-row   layout_page">


        <div class="layui-col-md12">
            <section class="demo_section demo_section_light  ">
                <div class="container">
                     
                    <div class="layui-row ">
                        <div class="layui-col-md8" style="text-align: center;min-height: 300px">

                            <img src="${classifyinfo.image}" height="360px"
                                 style="text-align: center;min-height: 350px;width: 90% ">

                        </div>
                        <div class="layui-col-md4">
                            <div class="layui-form" lay-filter="component-form-group">

                                <div class="layui-form-item">
                                    <label class="layui-form-label  " style="color: #c2c2c2">添加日期</label>

                                    <div class="layui-input-block">
                                        <div class="layui-inline">
                                            <div class="layui-form-mid ">
                                                ${classifyinfo.opendate }
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="layui-form-item">
                                    <label class="layui-form-label  " style="color: #c2c2c2">场地器材类型介绍</label>

                                    <div class="layui-input-block">
                                        <div class="layui-inline">
                                            <div class="layui-form-mid ">${classifyinfo.slogan }

                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="layui-form-item">
                                    <label class="layui-form-label  " style="color: #c2c2c2">联系方式</label>

                                    <div class="layui-input-block">
                                        <div class="layui-inline">
                                            <div class="layui-form-mid ">${classifyinfo.contact }

                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="layui-tab layui-tab-brief" lay-filter="docDemoTabBrief">
                        <ul class="layui-tab-title">
                            <li class="layui-this">详细信息</li>
                            <li>包含的场地器材</li>

                        </ul>
                        <div class="layui-tab-content">
                            <div class="layui-tab-item    layui-show  " style="text-indent: 2em;min-height: 400px">

                                <p>
                                    ${classifyinfo.contents }
                                </p>
                            </div>
                            <div class="layui-tab-item">

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
                                                       value="front/classifyinfoDetail.do?id=${classifyinfo.classifyinfoid}&"/>
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
                    </div>

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
