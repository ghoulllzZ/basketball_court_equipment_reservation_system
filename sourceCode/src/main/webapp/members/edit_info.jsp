<%@ page language="java" pageEncoding="utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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

    <script type="text/javascript">


        function selimage() {

            layer.open({
                type: 2,
                title: '上传图片',
                area: ['500px', '100px'],
                offset: '250px',
                content: '<%=basePath%>upload_images.jsp'
            });
        }

    </script>

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
修改资料
        </span>
    </div>
    <div class="layui-row    layout_page">


        <div class="layui-col-md12">

            <div>

                <div class="layui-anim layui-anim-up">
            <form class="layui-form layui_form_web" action="front/edit_info.do" method="post" name="myform"
                  onSubmit="return check()">

                <div class="layui-form-item">
                    <label class="layui-form-label">用户名:</label>
                    <div class="layui-input-block">
                        <div class="layui-form-mid ">${members.username } </div>
                    </div>
                </div>

                <div class="layui-form-item">
                    <label class="layui-form-label">姓名:</label>
                    <div class="layui-input-block">
                        <input class="layui-input" type="text" name="realname" required
                               lay-verify="required"
                               autocomplete="off" class="layui-input"
                               value="${members.realname }">
                    </div>
                </div>
                <div class="layui-form-item">
                    <label class="layui-form-label">QQ:</label>
                    <div class="layui-input-block">
                        <input class="layui-input" type="text" name="qq" required
                               value="${members.qq }"
                               placeholder="请输入" autocomplete="off">
                    </div>
                </div>
                <div class="layui-form-item">
                    <label class="layui-form-label">身份证号:</label>
                    <div class="layui-input-block">
                        <input class="layui-input" type="text" name="idcard" required
                               value="${members.idcard }"
                               placeholder="请输入" autocomplete="off">
                    </div>
                </div>
                <div class="layui-form-item">
                    <label class="layui-form-label">邮件:</label>
                    <div class="layui-input-block">
                        <input class="layui-input" type="text" name="email" required
                               value="${members.email }"
                               placeholder="请输入" autocomplete="off">
                    </div>
                </div>


                <input type="hidden" name="grades1" value="">
                <input type="hidden" name="grades2" value="">
                <input type="hidden" name="grades3" value="">
                <input type="hidden" name="grades4" value="">
                <input type="hidden" name="grades5" value="">
                <input type="hidden" name="grades6" value="">
                <input type="hidden" name="college" value="">
                <input type="hidden" name="major" value="">


                <div class="layui-form-item">
                    <label class="layui-form-label">性别:</label>
                    <div class="layui-input-block">
                        <input type="radio" name="sex" id="sex" title="男" value="男"
                                <c:if test="${members.sex=='男'}"> checked="checked"</c:if>
                        />
                        <input type="radio" name="sex" id="sex" value="女" title="女"
                                <c:if test="${members.sex=='女'}"> checked="checked"</c:if>/>


                    </div>
                </div>
                <div class="layui-form-item">
                    <label class="layui-form-label">出生日期:</label>
                    <div class="layui-input-block">
                        <script language="javascript"
                                type="text/javascript"
                                src="<%=basePath%>resources_web/My97DatePicker/WdatePicker.js"
                                charset="utf-8"></script>
                        <input readonly="readonly"
                               type="text"
                               name="birthday"
                               required="required"
                               lay-verify="date"
                               value="${members.birthday}"
                               onfocus="WdatePicker({dateFmt:'yyyy-MM-dd',maxDate:'%y-%M-%d'})"
                               autocomplete="off"
                               class="layui-input Wdate">
                    </div>
                </div>
                <div class="layui-form-item">
                    <label class="layui-form-label">联系手机:</label>
                    <div class="layui-input-block">
                        <input class="layui-input" type="tel" placeholder="请输入手机" name="contact"
                               lay-verify="required|phone"
                               autocomplete="off" value="${members.contact}"
                               class="layui-input">
                    </div>
                </div>
                <div class="layui-form-item">
                    <label class="layui-form-label">联系地址:</label>
                    <div class="layui-input-block">
                        <input class="layui-input" type="text" placeholder="请输入地址" name="address"
                               value="${members.address}"
                               autocomplete="off"
                        >
                    </div>
                </div>
                <div class="layui-form-item">
                    <label class="layui-form-label">头像:</label>
                    <div class="layui-input-block">
                        <input class="layui-input" type="text" name="image" id="image"
                               autocomplete="off"
                               value="${members.image}"
                               class="layui-input" placeholder="选择图片" onclick="selimage();"
                               readonly="readonly">
                    </div>
                </div>
                <div class="layui-form-item">
                    <label class="layui-form-label"></label>
                    <div class="layui-input-block">
                        <input type="submit" class="layui-btn layui-btn-normal  " name="Submit" value="提交"/>&nbsp;&nbsp;&nbsp;&nbsp;

                    </div>
                </div>


            </form>

                </div>
            </div>

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
        layui.use(['element', 'layer', 'carousel', 'util', 'flow', 'form'], function () {


        });

    })(window.jQuery);
</script>
</body>
</html>
