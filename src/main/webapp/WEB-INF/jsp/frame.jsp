
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>   <%--注意：需要放一个jstl.jar包到Tomcat的WEB-INF/lib下--%>

<!DOCTYPE html>
<head>
    <title>客户管理系统主界面</title>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta http-equiv ="Pragma" content = "no-cache"/>
    <meta http-equiv="Cache-Control" content="no cache" />
    <meta http-equiv="Expires" content="0" />
    <script type="text/javascript" src="../resources/layui/layui.all.js"></script>
    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
  <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js" integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy" crossorigin="anonymous"></script>
  
    <link rel="stylesheet" href="/customerM/resources/layui/css/layui.css">

</head>

<body class="layui-layout-body">
<div class="layui-layout layui-layout-admin">
    <div class="layui-header">
        <div class="layui-logo">Admin</div>
        <%-- 头部区域（可配合layui已有的水平导航） --%>
        <ul class="layui-nav layui-layout-left">
            <li class="layui-nav-item"><a href="">控制台</a>
                <dl class="layui-nav-child">
                    <dd><a href="">邮管理</a></dd>
                    <dd><a href="">消息管理</a></dd>
                    <dd><a href="">授权管理</a></dd>
                </dl>
            </li>
        </ul>
        <ul class="layui-nav layui-layout-right">
            <li class="layui-nav-item">
                <a href="javascript:;">
                    <img src="http://t.cn/RCzsdCq" class="layui-nav-img">
                    管理员
                </a>
                <dl class="layui-nav-child">
                    <dd><a href="">基本资料</a></dd>
                    <dd><a href="">安全设置</a></dd>
                </dl>
            </li>
            <!-- <li  class="layui-nav-item"><a href="/customerM/login"><button onclick="windows.alter('are you sure log out?')">注销</button></a></li> -->
            
            <li class="layui-nav-item" > <button onclick="logout()">注销</button></li>
            
        </ul>
    </div>

    <div class="layui-side layui-bg-black">
        <div class="layui-side-scroll">
            <%-- 左侧导航区域（可配合layui已有的垂直导航） --%>
            <ul class="layui-nav layui-nav-tree"  lay-filter="test">
                <li class="layui-nav-item layui-nav-itemed">
                    <a class="" href="javascript:;">基本操作</a>
                    <dl class="layui-nav-child">
                        <dd><a href="/customerM/allCustomerList/1" target="option">客户信息</a></dd>
                        <dd><a href="/customerM/add" target="option">添加客户</a></dd>
                        <dd><a href="/customerM/query" target="option">高级搜索</a></dd>
                    </dl>
                </li>
            </ul>
        </div>
    </div>
    
    
  <!--   <div class="d-flex align-items-center section-aquamarine py-5 cover" style="background-image: url(&quot;../resources/image/cover.jpg&quot;);" >
    <div class="container">
      <div class="row">
        <div class="col-lg-12 text-white mt-5">
          <h1 class="display-2 d-none d-md-block">登入成功</h1>
         
          <a href="" class="btn btn-lg mt-4 btn-outline-light">管理员</a><i class="d-block fa fa-angle-down pt-5 fa-3x"></i>
        </div>
      </div>
    </div>
  </div>
 -->
    <div class="layui-body">
        <%-- 内容主体区域 --%>
       <iframe id="option" name="option" width="100%" height="100%">
          </iframe>
       
    
    
    
</div>
<script>
function logout(){
	
	if( window.confirm("确定要退出系统吗？")){
		window.location.href="/customerM/login";
	}
	
	
}
</script>


</body>
</html>
