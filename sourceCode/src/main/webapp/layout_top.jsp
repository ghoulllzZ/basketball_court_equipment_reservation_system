<%@ page language="java" pageEncoding="utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
            + path + "/";
%>


<!--头---------------------------------------------------------------------------------------------->

<div class="layui-header">

    <div class="layui-col-md11 layui-col-xs12 layui-col-sm12  ">
        <a href="#">
            <div class="logo_img  ">
                <img src="resources_web/images/logo.png">
            </div>
            <div class="logo_text  "> 篮球场实有人员动态监测</div>
        </a>

        <ul class="layui-nav   nav_menu" lay-filter="nav-menu-top" id="mainnav">


            <li class="layui-nav-item  "><a href="<%=basePath%>"> 首页 </a></li>


            <c:forEach items="${broadcast_kindsList}" var="broadcast_kinds" varStatus="status">

                <li class="layui-nav-item  ">
                    <a href="front/broadcast.do?broadcast_kindsid=${broadcast_kinds.broadcast_kindsid}"
                    > ${broadcast_kinds.broadcast_kindsname }</a>
                </li>


            </c:forEach>

 
            <li class="layui-nav-item  ">

                <a href="front/thinginfo.do">场地器材信息</a>
            </li>
            <li class="layui-nav-item  ">

                <a href="front/goodsinfo.do">商品信息</a>
            </li>


        </ul>

        <!-- 头部区域（可配合layui已有的水平导航） -->
        <ul class="layui-nav layui-layout-right" lay-filter="nav-menu-top" id="menu_right">

            <form action="front/broadcast.do" method="post" style="margin-top: 20px;float: left;     ">

                <input type="text" name="broadcastkeyword" lay-verify="required" placeholder="请输入关键词"
                       autocomplete="off"
                       class="layui-input" style=" border-radius: 60px !important;" value="">


            </form>
            <c:if test="${sessionScope.userid == null }">

                <li class="layui-nav-item">
                    <a href="front/preLogin.do">登录 </a>
                </li>
                <li class="layui-nav-item">
                    <a href="front/preReg.do">注册 </a>
                </li>
            </c:if>

            <c:if test="${sessionScope.userid != null }">


                <%-- 用户--%>
                <li class="layui-nav-item">
                    <a href="javascript:;">
                        <img src="${sessionScope.members.image}" class="layui-nav-img">
                        用户:${sessionScope.members.username}


                    </a>
                    <dl class="layui-nav-child  ">
                        <dd>
                            <a href="front/prePwd.do"> 修改密码</a>
                        </dd>
                        <dd>
                            <a href="front/preInfo.do"> 我的资料</a>
                        </dd>

                        <dd>
                            <a href="front/myPurchases.do">我的预约</a>
                        </dd>


                    </dl>
                </li>

                <li class="layui-nav-item">
                    <a href="front/exit.do">退出登录</a>
                </li>

            </c:if>
        </ul>


    </div>
</div>

<!--头---------------------------------------------------------------------------------------------->

