<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">

<title>Login page</title>
 <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css" type="text/css">
 <link rel="stylesheet" href="/customerM/resources/pingendo/theme.css" type="text/css">

</head>
<body>
  <div class="text-center section-fade-in-out text-dark py-5" style="background-image: url(&quot;/customerM/resources/image/cover.jpg&quot;);">
    <div class="container py-5 ">
      <div class="row">
        <div class="col-md-12">
          <h1 class="display-4 mb-0 text-muted" style="">客户关系管理系统</h1>
          <h5 class="text-muted my-2 mb-0" style="" contenteditable="true">管理员登入</h5>
          <div class="col-lg-5  mx-auto   " style="">
            <form class="p-2" method="post" action="/customerM/validateLogin" >
              <div class="form-group text-light shadow-none" > <label class="text-dark"><b>账号</b></label>
                <input class="form-control"  required="required" name="account" placeholder="请输入管理员账号"> </div>
              <div class="form-group text-light shadow-none"> <label class="text-dark"><b>密码</b></label>
                
                
                
                <div class="input_block">
                		<!-- <img id="vi_img" onclick="hideShowPassword()" src="../resources/image/visible.png"> -->
                 	<input id="vi_password" type="password" required="required" class="form-control" name="password" placeholder="请输入密码"> </div>
                </div>
              <button type="submit" class="btn mt-4 btn-block p-2 shadowed btn-primary" >登入</button>
               
               
            </form>
          </div>
        </div>
      </div>
    </div>
  </div>
  <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
  <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js" integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy" crossorigin="anonymous"></script>
 </body>
 	<script type="text/javascript">
 	
 	
 	</script>
 
</html>