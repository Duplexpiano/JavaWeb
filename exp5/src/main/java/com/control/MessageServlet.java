package com.control;

import com.Factory.DAOFactory;
import com.vo.Message;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.util.Date;

@WebServlet("/message")
public class MessageServlet extends HttpServlet {
    public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException{
        this.doPost(request, response);
    }
    public void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException{
        request.setCharacterEncoding("utf-8");
        String path = "error.jsp";
        // 1、接收传递的参数
        String status = request.getParameter("status");
        if(status != null){
            // 留言板
            if("selectAll".equals(status)){
                try {
                    request.setAttribute("all", DAOFactory.getMessageDAOInstance().queryAll());
                } catch (Exception e) {
                    e.printStackTrace();
                }
                path = "messageBoard.jsp";
            }
            // 插入
            if("insert".equals(status)){
                boolean flag = false;
                String title = request.getParameter("title");
                String content = request.getParameter("content");
                String writer = request.getParameter("writer");
                // s实例化vo对象
                Message message = new Message();
                message.setTitle(title);
                message.setContent(content);
                message.setWriter(writer);
                try {
                    if(DAOFactory.getMessageDAOInstance().addMessage(message)){
                        flag = true;
                    }
                } catch (Exception e) {
                    e.printStackTrace();
                }
                request.setAttribute("flag", flag);
                path = "doAdd.jsp";
            }
            // 删除
//            if("delete".equals(status)){
//                boolean flag = false;
//                int id = 0;
//                id = Integer.parseInt(request.getParameter("id"));
//                try {
//                    if(DAOFactory.getMessageDAOInstance().deleteMessage(id)){
//                        flag = true;
//                    }
//                } catch (Exception e) {
//                    e.printStackTrace();
//                }
//                request.setAttribute("flag", flag);
//                path = "doDeleteMessage.jsp";
//            }
        }else{
            // 则表示无参数，非法的客户请求
        }
        request.getRequestDispatcher(path).forward(request, response);
    }
}
