<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="exp4.DAO.Impl.StudentDAOImpl" %>
<%@ page import="exp4.factory.DAOFactory" %>
<%@ page import="java.util.*" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="exp4.vo.Classes" %>
<%@ page import="exp4.vo.Students" %><%--
  Created by IntelliJ IDEA.
  User: 14220
  Date: 2021/4/8
  Time: 11:23
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>update</title>
</head>
<body>
<%
    List<Classes> all = new ArrayList<>();
    Students stu = DAOFactory.getIStudentDAOInstance().findByStudentId(request.getParameter("studentId"));
    all = DAOFactory.getIStudentDAOInstance().getAllClass();
%>
<form action="doUpdateStu.jsp" method="post">
    <table border="2" align="center" align="70">
        <caption>修改学生信息</caption>
        <tr><td>学号</td><td><input type="hidden" name="stuId" value="<%=request.getParameter("studentId")%>"/><%=request.getParameter("studentId")%></td></tr>
        <tr><td>姓名</td><td><input type="text" name="stuName" value="<%=stu.getStudentName()%>"/></td></tr>
        <tr><td>密码</td><td><input type="password" name="stuPwd" value="<%=stu.getStudentPwd()%>"/></td></tr>
        <tr><td>性别</td>
            <td>
                <%
                    if(stu.getSex() != null){
                %>
                    <%
                        if(stu.getSex().equals("男")){
                    %>
                        <input type="radio" name="sex" value="<%=stu.getSex()%>" checked/> <%=stu.getSex()%>
                        <input type="radio" name="sex" value="女"/> 女
                    <%
                        }else{
                    %>
                        <input type="radio" name="sex" value="男"/> 男
                        <input type="radio" name="sex" value="<%=stu.getSex()%>" checked/> <%=stu.getSex()%>
                <%
                        }
                    }else{
                %>
                        <input type="radio" name="sex" value="男"/> 男
                        <input type="radio" name="sex" value="女"/> 女
                <%
                    }
                %>
            </td>
        </tr>
        <tr><td>
                班级
            </td>
            <td>
                <select name="class">
                    <%
                        for (Classes c: all) {
                            if(c.getClassName().equals(stu.getClassName())){
                    %>
                                <option value="<%=c.getClassId()%>" selected><%=c.getClassName()%></option>
                    <%
                            }else{
                    %>
                                <option value="<%=c.getClassId()%>"><%=c.getClassName()%></option>
                    <%
                            }
                        }
                    %>
                </select>
            </td>
        </tr>
        <tr>
            <td><input type="submit" name="submit" value="提交"/></td>
            <td><input type="reset" name="reset" value="重置"/></td>
        </tr>
    </table>
</form>
</body>
</html>
