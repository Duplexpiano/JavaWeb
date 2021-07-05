<%@ page import="exp4.DAO.Impl.StudentDAOImpl" %>
<%@ page import="exp4.vo.Students" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="exp4.factory.DAOFactory" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>显示所有学生信息</title>
</head>
<body>
<jsp:useBean id="stu" class="exp4.vo.Students"/>
<table border="2" align="center" align="70">
    <caption>
        <h2>显示所有学生信息</h2>
        <h3>
            <form action="findStu.jsp" method="post">
                <input type="text" name="keyWord" placeholder="学号/姓名/性别/班级名">
                <input type="submit" name="submit" value="查找">
                <a href="createStu.jsp" shape="circle">
                    <input type="button" name="add" value="+" style="font-size: 25px; font-weight: bold;">
                </a>
            </form>
        </h3>
    </caption>
    <tr><th>学号</th><th>姓名</th><th>密码</th><th>性别</th><th>班级号</th><th>修改</th><th>删除</th></tr>
    <%
        List<Students> all = new ArrayList<Students>();
        all= DAOFactory.getIStudentDAOInstance().getAllStudents();
        if(all.size()!=0){
            for(int i = 0;i < all.size();i++){
                stu = (Students)all.get(i);
    %>
    <tr>
        <td><%=stu.getStudentId() %></td>
        <td><%=stu.getStudentName() %></td>
        <td><%=stu.getStudentPwd() %></td>
        <td><%=stu.getSex() %></td>
        <td><%=stu.getClassId() %></td>
        <td><a href="updateStudents.jsp?studentId=<%=stu.getStudentId() %>">修改</a></td>
        <td><a href="deleteStudents.jsp?studentId=<%=stu.getStudentId() %>">删除</a></td>
    </tr>
    <%
            } //end for
        }//end if
    %>
</table>
</body>
</html>
