
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>编辑客户信息</title>
    	<script type="text/javascript" src="https://cdn.bootcss.com/jquery/3.2.1/jquery.min.js"></script> 
    <script type="text/javascript" src="/customerM/resources/layui/layui.js"></script>
    <link rel="stylesheet" href="/customerM/resources/layui/css/layui.css">

</head>

<body>
    <!--<h3 align="center">编辑客户</h3>-->
    <form class="layui-form" action="/customerM/editCustomerSubmit" method="post">
        <input type="hidden" name="id" value="${customer.id}">
        <div class="layui-form-item">
            <label class="layui-form-label">姓名</label>
            <div class="layui-input-inline">
                <input class="layui-input" type="text" name="name" required lay-verify="required" value="${customer.name}"/>
            </div>
        </div>

        <div class="layui-form-item">
            <label class="layui-form-label">性别</label>
            <div class="layui-input-block">
                <input type="radio" name="gender" title="男" value="男" <c:if test="${customer.gender eq '男'}">checked</c:if>/>
                <input type="radio" name="gender" title="女" value="女" <c:if test="${customer.gender eq '女'}">checked</c:if> />
            </div>
        </div>

        <div class="layui-form-item">
            <label class="layui-form-label">手机</label>
            <div class="layui-input-inline">
            <input class="layui-input" type="text" name="phone" lay-verify="phone" value="${customer.phone}"/>
            </div>
        </div>

        <div class="layui-form-item">
            <label class="layui-form-label">邮箱</label>
            <div class="layui-input-inline">
                <input class="layui-input" type="text" name="email" id="email" lay-verify="email" value="${customer.email}"/>
            </div>
        </div>

        <div class="layui-form-item layui-form-text">
            <label class="layui-form-label">个人描述</label>
            <div class="layui-input-block">
                <textarea class="layui-textarea" name="description">${customer.description}</textarea>
            </div>
        </div>

        <div class="layui-form-item">
            <div class="layui-input-block">
                <button class="layui-btn" type="submit">编辑客户</button>
                <button type="reset" class="layui-btn layui-btn-primary">重置</button>
            </div>
        </div>
    </form>
    <script>
        layui.use('form', function () {
            var form = layui.form;
            form.render('radio');
        });
    </script>
</body>
</html>
