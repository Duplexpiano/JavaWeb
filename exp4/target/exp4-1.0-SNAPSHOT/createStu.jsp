<%@ page import="java.util.*" %>
<%@ page import="exp4.vo.Students" %>
<%@ page import="exp4.factory.DAOFactory" %>
<%@ page import="exp4.vo.Classes" %><%--
  Created by IntelliJ IDEA.
  User: 14220
  Date: 2021/4/22
  Time: 13:22
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>注册</title>
</head>
<body>
<form action="doCreate.jsp" method="post">
    <table border="2" align="center" align="70">
        <caption>注册</caption>
        <tr><td>学号</td><td><input type="text" name="stuId" required/></td></tr>
        <tr><td>姓名</td><td><input type="text" name="stuName" required/></td></tr>
        <tr><td>密码</td><td><input type="password" name="stuPwd" required/></td></tr>
        <tr><td>性别</td>
            <td>
                <input type="radio" name="sex" value="男" required/>男
                <input type="radio" name="sex" value="女" required/>女
            </td>
        </tr>
        <%
            List<Classes> all = new ArrayList<>();
            all = DAOFactory.getIStudentDAOInstance().getAllClass();
        %>
        <tr><td>班级</td>
            <td>
                <select name="class">
                    <%
                        for (Classes c: all) {
                    %>
                        <option value="<%=c.getClassId()%>"><%=c.getClassName()%></option>
                    <%
                        }
                    %>
                </select>
            </td>
        </tr>
        <tr>
            <td><input type="submit" name="submit" value="提交"></td>
            <td><input type="reset" name="reset" value="重置"></td>
        </tr>
    </table>
</form>
</body>
</html>
