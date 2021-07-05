<%--
  Created by IntelliJ IDEA.
  User: 14220
  Date: 2021/5/7
  Time: 9:16
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Welcome</title>
</head>
<body>
<%
    if(session.getAttribute("name") != null)
    {
%>
<div style="margin: 40px 30px 0px 0px; color: dimgray; float: right"><a href="logout.jsp">注销</a></div>
<div style="margin: 30px 0px 0px 30px; float: left">
    <h2>登陆成功 </h2>
    <h2>欢迎
        <span style="color: red;size: 12px">
            <%=session.getAttribute("name")%>
        </span>光临JMU-CEC留言程序
    </h2>
    <h3><a href="message?status=selectAll">留言板</a></h3>
</div>
<%
    }else{
        // 用户未登陆，提示用户登陆，并跳转
        response.setHeader("refresh","2;URL=login.jsp") ;
%>
    <p>
        您还未登陆，请先登陆！！！<br/>
        两秒后跳转到登陆页面！！！<br/>
        如果没有跳转，请按<a href="login.jsp">这里 </a>！！！<br/>
    </p>
<%
    }
%>
</body>
</html>
