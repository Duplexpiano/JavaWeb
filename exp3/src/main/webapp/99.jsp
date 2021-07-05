<%--
  Created by IntelliJ IDEA.
  User: 14220
  Date: 2021/4/9
  Time: 8:14
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>MulTable</title>
</head>
<body>
<h2 align="center">九九乘法表</h2>
<table border="1px" bgcolor="#fa8072" cellpadding="1px" cellspacing="0px" align="center">
    <%
        for(int i = 1; i < 10; i++){
    %>
    <tr>
    <%
            for(int j = 1; j < 10; j++){
                if(i >= j){
    %>
            <td bgcolor="#7fffd4">
                <%=j%>*<%=i%>=<%=(i*j)%>
            </td>
    <%
                }
            }
    %>
    </tr>
    <%
        }
    %>
</table>
</body>
</html>