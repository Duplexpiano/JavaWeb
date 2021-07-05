package com.service;

import com.Factory.DAOFactory;
import com.vo.Revert;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.util.*;

@WebServlet("/service")
public class ServiceServlet extends HttpServlet {
    public void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException{
        request.setCharacterEncoding("utf-8");
        String path = "error.jsp";
        String status = request.getParameter("status");
        if(status != null){
            if("selectById".equals(status)){
                int id = 0;
                id = Integer.parseInt(request.getParameter("id"));
                try {
                    request.setAttribute("message", DAOFactory.getMessageDAOInstance().queryByMessageId(id));
                    request.setAttribute("allRevert", DAOFactory.getRevertDAOInstance().queryByMessageId(id));
                } catch (Exception e) {
                    e.printStackTrace();
                }
                path = "messageDetail.jsp";
            }
            // 删除message的同时删除revert
            if("delete".equals(status)){
                boolean flag = false;
                List<Revert> allRevert = null;
                int id = 0;
                id = Integer.parseInt(request.getParameter("id"));
                try {
                    allRevert = new ArrayList<>();
                    allRevert = DAOFactory.getRevertDAOInstance().queryByMessageId(id);
                    if(allRevert != null){
                        for (Revert r: allRevert) {
                            DAOFactory.getRevertDAOInstance().deleteByRevertId(r.getRevertId());
                        }
                    }
                    if(DAOFactory.getMessageDAOInstance().deleteMessage(id)){
                        flag = true;
                    }
                } catch (Exception e) {
                    e.printStackTrace();
                }
                request.setAttribute("flag", flag);
                path = "doDeleteMessage.jsp";
            }
        }
        request.getRequestDispatcher(path).forward(request, response);
    }
    public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException{
        this.doPost(request, response);
    }
}
