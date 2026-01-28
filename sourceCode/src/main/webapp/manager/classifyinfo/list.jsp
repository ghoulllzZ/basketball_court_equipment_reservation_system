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
    <meta charset="utf-8">
    <base href="<%=basePath%>"/>
    <title></title>
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport"
          content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=0">
    <link rel="stylesheet" href="resources_web/layui/css/layui.css">
    <link rel="stylesheet" href="resources_web/css/manager_css.css">
    <script src="resources_web/js/jquery-3.2.1.js"></script>
</head>
<body>
<form class="search_list layui-form " action="" method="post">
    <div class="layui-form-item">
        <div class="layui-input-inline">
            <input type="text" name="keyword" lay-verify="required" placeholder="请输入关键字 " value="${keyword}"
                   autocomplete="off"
                   class="layui-input">
        </div>
        <button class="layui-btn ">
            <i class="layui-icon">&#xe615;</i> 搜索
        </button>

    </div>
</form>
<table lay-filter="tabledata">
    <thead>
    <tr>
        <th lay-data="{escape:false,align:'center',field:'b' }">场地器材类型名称</th>
        <th lay-data="{escape:false,align:'center',field:'c' }">场地器材类型介绍</th>
        <th lay-data="{escape:false,align:'center',field:'d' }">添加日期</th>
        <th lay-data="{escape:false,align:'center',field:'e' }">联系方式</th>
        <th lay-data="{escape:false,align:'center',field:'g' }">操作</th>
    </tr>
    </thead>
    <tbody>
    <c:forEach items="${classifyinfoList}" var="classifyinfo">
        <tr>
            <td align="center">${classifyinfo.title}</td>
            <td align="center">${classifyinfo.slogan}</td>
            <td align="center">${classifyinfo.opendate}</td>
            <td align="center">${classifyinfo.contact}</td>
            <td align="center"><a
                    href="manager/classifyinfo/getById.do?id=${classifyinfo.classifyinfoid}"
                      class="layui-btn layui-btn-xs" >编辑</a>&nbsp;&nbsp;<a
                    href="manager/classifyinfo/delete.do?id=${classifyinfo.classifyinfoid}"
                    onclick="{if(confirm('确定要删除吗?')){return true;}return false;}"
                      class="layui-btn layui-btn-danger layui-btn-xs">删除</a></td>
        </tr>
    </c:forEach>

    </tbody>
</table>
<table width='98%' border='0' style="margin-top: 8px; margin-left: 5px;">
    <TR align="right">
        <TD>
            <form class="list_page" action="" method="get" name="formpage">
                <input type="hidden" name="pageCount" value="${pager.pageCount}"/>
                <!--//用于给上面javascript传值-->
                <input type="hidden" name="page" value="${pager.pageNumber}"/>
                <!--//用于给上面javascript传值-->
                <input type="hidden" name="jumpurl" value="manager/classifyinfo/getAll.do?"/>
                <!--//用于给上面javascript传值-->
                <a href="javascript:;" onClick="PageTop()"><strong>首页</strong></a>&nbsp;&nbsp;&nbsp;
                <a href="javascript:;" onClick='PagePre()'><strong>上一页</strong></a>&nbsp;&nbsp;&nbsp;

                共${pager.rowCountTotal}条记录, 共计${pager.pageCount}页,
                当前第${pager.pageNumber}页&nbsp;&nbsp;&nbsp;
                <a href="javascript:;" onClick="PageNext()"><strong>下一页</strong></a>&nbsp;&nbsp;&nbsp;

                <a href="javascript:;" onClick="PageLast()"><strong>尾页</strong></a>
            </form>
            <script type="text/javascript" src="resources_web/js/page.js"></script>
        </TD>
    </TR>
</table>
<script src="resources_web/layui/layui.js"></script>
<script type="text/html" id="toolbarDemo">

    分类信息列表

</script>
<script>
    layui.use(['table', 'element', 'layer', 'carousel', 'util', 'flow'], function () {
        var table = layui.table;


//转换静态表格
        table.init('tabledata', {

            even: true //开启隔行背景

        });
    });
</script>
</body>
</html>