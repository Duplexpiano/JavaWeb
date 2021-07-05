package com.control;

import com.Factory.DAOFactory;
import com.vo.*;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;

@WebServlet("/login")
public class LoginServlet extends HttpServlet {
    public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        this.doPost(request, response);
    }
    public void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        String path = "login.jsp";
        // 1、接收传递的参数
        String id = request.getParameter("id");
        String password = request.getParameter("password");
        // 2、将请求的内容赋值给VO类
        Person person = new Person();
        person.setId(id);
        person.setPassword(password);
        try {
            if(DAOFactory.getPersonDAOInstance().loginCheck(person)){
                // 如果为真，则表示用户ID和密码合法
                // 设置用户姓名到session范围之中
                request.getSession().setAttribute("name", person.getName());
//                System.out.println(person.toString());
                // 修改跳转路径
                path = "welcome.jsp";
            }else{
                request.setAttribute("err", "账号或密码匹配错误，请重新输入");
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        // 跳转
        request.getRequestDispatcher(path).forward(request, response);
    }
}
