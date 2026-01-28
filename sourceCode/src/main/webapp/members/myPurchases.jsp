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
    <jsp:include page="../layout_top.jsp"></jsp:include>
    <!--头---------------------------------------------------------------------------------------------->


    <!-- ------------------------------------------------------------------------------内容主体区域 -->
    <div class="page_body_box">
        <span>

我的预约


        </span>
    </div>
    <div class="layui-row    layout_page">


        <div class="layui-col-md12">
            <table lay-filter="tabledata">
                <thead>
                <tr bgcolor="#FBFCE2" height="30">
                    <th lay-data="{escape:false,align:'center',field:'a1' }">场地器材名称</th>

                    <th lay-data="{escape:false,align:'center',field:'a2'   }">预约日期</th>
                    <th lay-data="{escape:false,align:'center',field:'a3'   }">状态</th>
                    <th lay-data="{escape:false,align:'center',field:'a4'   }">数量</th>
                    <th lay-data="{escape:false,align:'center',field:'a5'   }">操作(未完成可取消)</th>
                </tr>
                </thead>
                <c:forEach items="${purchasesList}" var="purchases">
                    <tr bgcolor="#FFFFFF" height="40">
                        <td align="left">
                                ${purchases.thinginfoname}


                        </td>
                        <td align="center">
                            <fmt:formatDate value="${purchases.purchase_time}" pattern="yyyy年MM月dd日"/>
                        </td>
                        <td align="left"><b>${purchases.status}</b>
                        </td>
                        <td align="left"> ${purchases.memo}
                        </td>
                        <td align="center">
                            <c:if test="${ purchases.status eq '已预约'}">
                                <a href="front/cancel_line.do?id=${purchases.purchasesid}"
                                   onclick="{if(confirm('确定要取消吗?')){return true;}return false;}"
                                   class="layui-btn layui-btn-danger layui-btn-xs">取消</a>
                            </c:if>
                        </td>


                    </tr>
                </c:forEach>
            </table>

        </div>

    </div>


    <!-- ------------------------------------------------------------------------底部固定区域 -->
    <jsp:include page="../layout_bottom.jsp"></jsp:include>

    <!-- ------------------------------------------------------------------------底部固定区域 -->


</div>
<script src="resources_web/layui/layui.js"></script>
<script type="text/html" id="toolbarDemo">

     

</script>
<script>


    layui.use(['form', 'element', 'layer', 'carousel', 'util', 'flow', 'table'], function () {
        var table = layui.table;


        //转换静态表格
        table.init('tabledata', {

            even: true //开启隔行背景

        });
    });


</script>
</body>
</html>
