
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>客户列表</title>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta http-equiv ="Pragma" content = "no-cache"/>
    <meta http-equiv="Cache-Control" content="no cache" />
    <meta http-equiv="Expires" content="0" />
<!--     <script type="text/javascript" src="../resources/layui/lay/modules/jquery.js"></script> --><!-- 
	<script type="text/javascript" src="https://cdn.bootcss.com/jquery/3.2.1/jquery.min.js"></script> -->
    <!-- <script type="text/javascript" src="../resources/layui/layui.all.js"></script>
   <link rel="stylesheet" href="../resources/layui/css/layui.css"> -->
   
   <!-- bootstrap -->
     <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css" type="text/css">
 	 <link rel="stylesheet" href="https://static.pingendo.com/bootstrap/bootstrap-4.1.3.css">
   
   
</head>
<body>
    <!-- 建表 -->
    <!--<h3 align="center">客户列表</h3>-->
    <!-- <table class="layui-table" > -->
    <div >
     <table class="table table-bordered">
        <colgroup>
            <col width="150">
            <col width="150">
            <col width="150">
            <col width="150">
            <col width="150">
            <col width="150">
        </colgroup>
        <thead>
            <tr>
                <th scope="col" class="table-primary">姓名</th>
                <th scope="col" class="table-primary">性别</th>
                <th scope="col" class="table-primary">电话</th>
                <th scope="col" class="table-primary">邮箱</th>
                <th scope="col" class="table-primary">个人描述</th>
                <th scope="col" class="table-primary">操作</th>
            </tr>
        </thead>
        <tbody>
            <!-- JSP中使用JSTL的c标签 -->
            <c:forEach items="${pb.beanList}" var="cstm">
                <tr>
                    <td>${cstm.name}</td>
                    <td>${cstm.gender}</td>
                    <td>${cstm.phone}</td>
                    <td>${cstm.email}</td>
                    <td>${cstm.description}</td>
                    <td>
                        <a  href="/customerM/edit/${cstm.id}">
                        	 <button class="btn btn-outline-primary btn-sm">
                       		 编辑
                       	 </button>
                            
                        </a>
                        <a  href="/customerM/delete/${cstm.id}">
                        	 <button class="btn btn-outline-primary btn-sm">
                        	 	删除
                        	 </button>
                            
                        </a>
                        <%--<button class="layui-btn layui-btn-danger layui-btn-sm" id="delete" value="${cstm.id}">--%>
                            <%--删除--%>
                        <%--</button>--%>
                    </td>
                </tr>
            </c:forEach>
        </tbody>

    </table>
    </div>
    <br/>
    

    <%-- 分页 --%>
    <div class="col-md-12 " style="text-align: center">
        第${pb.pageNum}页/共${pb.totalPage}页
        
        
         <ul class="pagination " style="text-align: center">
      <!--   <a href="/customerM/list/1">
            <button class="btn btn-outline-primary">
                首页
            </button>
        </a> -->
        
        <li class="page-item" > <a class="page-link" href="/customerM/list/1">首页</a> </li>
      
        <c:if test="${pb.pageNum>1}">
        <li class="page-item" > <a class="page-link" href="/customerM/list/${pb.pageNum-1}">上一页</a> </li>
        
        </c:if>
        
        
        
        
        
        
       <%--  
        <c:if test="${pb.pageNum>1}">
            <a href="/customerM/list/${pb.pageNum-1}">
                <button class="btn btn-outline-primary">
                    上一页
                </button>
            </a>
        </c:if>
 --%>
        <%-- 计算页数，赋给变量begin和end --%>
        <c:choose>
            <%-- 如果总页数不超过10页，则将所有页数都显示出来 --%>
            <c:when test="${pb.totalPage<=10}">
                <c:set var="begin" value="1"/>
                <c:set var="end" value="${pb.totalPage}"/>
            </c:when>

            <%-- 当总页数超过10时，通过公式计算begin和end的值 --%>
            <c:otherwise>
                <c:set var="begin" value="${pb.pageNum-5}"/>
                <c:set var="end" value="${pb.pageNum+4}"/>
                <%-- 头溢出 --%>
                <c:if test="${begin<1}">
                    <c:set var="begin" value="1"/>
                    <c:set var="end" value="10"/>
                </c:if>
                <%-- 尾溢出 --%>
                <c:if test="${end>pb.totalPage}">
                    <c:set var="begin" value="${pb.totalPage-9}"/>
                    <c:set var="end" value="${pb.totalPage}"/>
                </c:if>
            </c:otherwise>
        </c:choose>

        <%-- 循环遍历页码列表 --%>
        <c:forEach var="i" begin="${begin}" end="${end}">
            <c:choose>
                <c:when test="${i eq pb.pageNum}">  <%-- 在方框中显示当前页码 --%>
                   <%--  <button class="btn btn-outline-primary active">
                        ${i}
                    </button> --%>
                    
                    <li class="page-item active" > <a class="page-link" href="/customerM/list/${i}">${i}</a> </li>
                </c:when>
                <c:otherwise>
                <%--     <a href="/customerM/list/${i}">
                        <button class="btn btn-outline-primary">
                            ${i}
                        </button>
                    </a> --%>
                    
                    <li class="page-item " > <a class="page-link" href="/customerM/list/${i}">${i}</a> </li>
                    
                    
                </c:otherwise>
            </c:choose>
        </c:forEach>
 
        <%-- 给出下一页以及尾页链接 --%>
        <c:if test="${pb.pageNum<pb.totalPage}">
           <%--  <a href="/customerM/list/${pb.pageNum+1}">
                <button class="layui-btn layui-btn-sm">
                    <i class="layui-icon"> &#xe65b;</i>
                </button>
            </a> --%>
            <li class="page-item" > <a class="page-link" href="/customerM/list/${pb.pageNum+1}">下一页</a> </li>
            
        </c:if>
        <%-- <a href="/customerM/list/${pb.totalPage}">
            <button class="layui-btn">
                尾页
            </button> --%>
            
            <li class="page-item" > <a class="page-link" href="/customerM/list/${pb.totalPage}">尾页</a> </li>
      <!--   </a> -->
      </ul>
    </div>
  
    <script>
		
        //注意啊，使用layui.js时，要引入layer弹出层时要写下面三句话啊
        layui.use(['jquery','layer'],function () {
            var $=layui.jquery;
            var layer=layui.layer;

             <%--//删除客户信息--%>
            $(document).on("click","#delete",function(){
                var id = $(this).attr("value");
                var v = '${pageContext.request.contextPath}/customer/delete/' + id;
                console.log(v);
                layer.alert('确定要删除吗',{
                    icon:3,
                    btn:['确定','取消'],
                    yes:function(){
                        window.location.href = '${pageContext.request.contextPath}/customer/delete/' + id;
                        console.log(id);
                        layer.msg('操作成功',{
                            icon:1,
                            time:3000
                        });
                        // 提交表单后关闭弹出层窗口
                        layer.close();
                        // 刷新页面
                        location.reload();
                    }
                });
            }) 
        })

    </script>
</body>
</html>
