package com.control;

import com.Factory.DAOFactory;
import com.vo.Revert;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/revert")
public class RevertServlet extends HttpServlet {
    public void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        request.setCharacterEncoding("utf-8");
        String path = "error.jsp";
        String status = request.getParameter("status");
        if(status != null){
            if("insert".equals(status)){
                int messageID = 0;
                boolean flag = false;
                // 接受传递值
                messageID = Integer.parseInt(request.getParameter("messageID"));
                String content = request.getParameter("content");
                String writer = request.getParameter("writer");
                // 将准传递值组成vo对象
                Revert revert = new Revert();
                revert.setMessageId(messageID);
                revert.setContent(content);
                revert.setWriter(writer);
                // 测试
//                System.out.println(revert.toString());
                // 执行操作
                try {
                    DAOFactory.getRevertDAOInstance().addRevertByMessageId(revert);
                    flag = true;
                } catch (Exception e) {
                    e.printStackTrace();
                }
                request.setAttribute("flag", flag);
                request.setAttribute("messageID", messageID);
                path = "doInsertRevert.jsp";
            }
            if("delete".equals(status)){
                int id = 0, messageID = 0;
                id = Integer.parseInt(request.getParameter("id"));
                messageID = Integer.parseInt(request.getParameter("mID"));
                boolean flag = false;
                try {
                    if(DAOFactory.getRevertDAOInstance().deleteByRevertId(id));
                    flag = true;
                } catch (Exception e) {
                    e.printStackTrace();
                }
                request.setAttribute("flag", flag);
                request.setAttribute("messageID", messageID);
                path = "doDelRevert.jsp";
            }
        }else{
            // status为空，不做处理
        }
        request.getRequestDispatcher(path).forward(request, response);
    }
    public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException{
        this.doPost(request, response);
    }
}
