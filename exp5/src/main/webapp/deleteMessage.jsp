<%--
  Created by IntelliJ IDEA.
  User: 14220
  Date: 2021/5/18
  Time: 11:28
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>删除结果</title>
</head>
<body>
<%
    response.setHeader("refresh","2;URL=message?status=selectAll") ;
    boolean b = ((Boolean)request.getAttribute("flag")).booleanValue() ;
    if(b){
%>
留言删除成功，两秒后返回<br/>
如果没有跳转，请按 <a href="message?status=selectAll">这里</a>
<%
}else{
%>
留言删除失败，两秒后返回<br/>
如果没有跳转，请按 <a href="message?status=selectAll">这里</a>
<%
    }
%>
</body>
</html>
