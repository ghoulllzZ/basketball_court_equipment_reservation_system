<%@ page language="java" import="java.util.*" pageEncoding="utf-8" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
            + path + "/";
%>


<!-- ------------------------------------------------------------------------底部固定区域 -->


<div class="bottom_box">
    Copyright
    <br> 版权所有 篮球场实有人员动态监测 © All right rederved
    <br>
    <a href="<%=basePath%>manager/login_manager.jsp">管理员登录</a>


</div>

<!-- ------------------------------------------------------------------------底部固定区域 -->
<script src="resources_web/layui/layui.js"></script>
