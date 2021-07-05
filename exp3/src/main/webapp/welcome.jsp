<%--
  Created by IntelliJ IDEA.
  User: 14220
  Date: 2021/4/16
  Time: 0:07
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Welcome</title>
</head>
<body>
<%
    if(session.getAttribute("flag") != null){   //防盗链
%>
    <h1>登陆成功! 欢迎<span style="color: red"> <%=session.getAttribute("username")%> </span> 来到本页面!</h1>
    <a href="logout.jsp">注销</a>
    <%
        Object count = application.getAttribute("count");
        if(count==null){//首先判断是否存在该全局变量
            application.setAttribute("count",1);
        }else{
            int co = Integer.parseInt(count.toString()) ; //定义变量并赋值
    %>
    <h2>自从应用服务器启动后，此页面已经访问了 <%=co++ %> 次！</h2>
    <%
            application.setAttribute("count", co) ;//写回applicaiton全局变量count
        }
    %>
<%
    }else{
        response.setHeader("refresh","2;URL=login.html"); //等待2秒后跳转
%>
    <h2>您还未登陆,请登陆！</h2>
<%
    }
%>
</body>
</html>
