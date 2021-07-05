package com.DAO.Impl;

import com.DAO.IMessageDAO;
import com.DatabaseConnection.ConnectionManager;
import com.mysql.cj.result.LocalDateTimeValueFactory;
import com.vo.Message;
import java.sql.*;
import java.text.SimpleDateFormat;
import java.util.*;
import java.util.Date;

public class MessageDAOImpl implements IMessageDAO {
    private Connection con = null;
    private PreparedStatement pstmt = null;
    private ResultSet res = null;
    private static SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");

    @Override
    public boolean addMessage(Message message) throws Exception {
        boolean flag = false;
        con = ConnectionManager.getConnection();
        String sql = "insert into message values(?,?,?,?,?)";
        pstmt = con.prepareStatement(sql);
        pstmt.setInt(1, message.getMessageId());
        pstmt.setString(2, message.getTitle());
        pstmt.setString(3, message.getContent());
        pstmt.setString(4, message.getWriter());
        pstmt.setDate(5, new java.sql.Date(new Date().getTime()));//实例化为sql语句中的日期格式
        if(pstmt.executeUpdate() > 0){
            flag = true;
        }
        ConnectionManager.closeStatement(pstmt);
        ConnectionManager.closeConnection(con);
        return flag;
    }

    @Override
    public boolean deleteMessage(int messageId) throws Exception {
        boolean flag = false;
        con = ConnectionManager.getConnection();
        String sql = "delete from message where messageID=?";
        pstmt = con.prepareStatement(sql);
        pstmt.setInt(1, messageId);
        if(pstmt.executeUpdate() > 0){
            flag = true;
        }
        ConnectionManager.closeStatement(pstmt);
        ConnectionManager.closeConnection(con);
        return flag;
    }

    @Override
    public Message queryByMessageId(int messageId) throws Exception {
        Message message = null;
        con = ConnectionManager.getConnection();
        String sql = "select * from message where messageId=?";
        pstmt = con.prepareStatement(sql);
        pstmt.setInt(1, messageId);
        res = pstmt.executeQuery();
        if(res.next()){
            message = new Message();
            message.setMessageId(res.getInt(1));
            message.setTitle(res.getString(2));
            message.setContent(res.getString(3));
            message.setWriter(res.getString(4));
            message.setWriteDate(res.getDate(5));
        }
        ConnectionManager.closeResultSet(res);
        ConnectionManager.closeStatement(pstmt);
        ConnectionManager.closeConnection(con);
        return message;
    }

    @Override
    public List<Message> queryAll() throws Exception {
        List<Message> all = new ArrayList<>();
        Message message = null;
        con = ConnectionManager.getConnection();
        String sql = "select * from message";
        pstmt = con.prepareStatement(sql);
        res = pstmt.executeQuery();
        while(res.next()){
            message = new Message();
            message.setMessageId(res.getInt(1));
            message.setTitle(res.getString(2));
            message.setContent(res.getString(3));
            message.setWriter(res.getString(4));
            message.setWriteDate(res.getDate(5));
            all.add(message);
        }
        ConnectionManager.closeResultSet(res);
        ConnectionManager.closeStatement(pstmt);
        ConnectionManager.closeConnection(con);
        return all;
    }

    @Override
    public int updateMessage(Message message) throws Exception {
        int i = 0;
        con = ConnectionManager.getConnection();
        String sql = "update message set title=?, content=?, writeDate=? where messageID=?";
        pstmt = con.prepareStatement(sql);
        pstmt.setString(1, message.getTitle());
        pstmt.setString(2, message.getContent());
        pstmt.setDate(3, new java.sql.Date(System.currentTimeMillis()));
        pstmt.setInt(4, message.getMessageId());
        i = pstmt.executeUpdate();
        ConnectionManager.closeStatement(pstmt);
        ConnectionManager.closeConnection(con);
        return i;
    }
}
