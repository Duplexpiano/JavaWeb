package com.DAO.Impl;

import com.DAO.IRevertDAO;
import com.DatabaseConnection.ConnectionManager;
import com.vo.*;
import java.sql.*;
import java.util.*;
import java.util.Date;

public class RevertDAOImpl implements IRevertDAO {
    private Connection con = null;
    private PreparedStatement pstmt = null;
    private ResultSet res = null;

    @Override
    public List<Revert> queryByMessageId(int messageId) throws Exception {
        List<Revert> all = new ArrayList<>();
        Revert revert = null;
        con = ConnectionManager.getConnection();
        String sql = "select * from revert where messageId=?";
        pstmt = con.prepareStatement(sql);
        pstmt.setInt(1, messageId);
        res = pstmt.executeQuery();
        while(res.next()){
            revert = new Revert();
            revert.setRevertId(res.getInt(1));
            revert.setMessageId(res.getInt(2));
            revert.setContent(res.getString(3));
            revert.setWriter(res.getString(4));
            revert.setWriteDate(res.getDate(5));
            all.add(revert);
        }
        ConnectionManager.closeResultSet(res);
        ConnectionManager.closeStatement(pstmt);
        ConnectionManager.closeConnection(con);
        return all;
    }

    @Override
    public boolean addRevertByMessageId(Revert revert) throws Exception {
        boolean flag = false;
        con = ConnectionManager.getConnection();
        String sql = "insert into revert values(?,?,?,?,?)";
        pstmt = con.prepareStatement(sql);
        pstmt.setInt(1, revert.getRevertId());
        pstmt.setInt(2, revert.getMessageId());
        pstmt.setString(3, revert.getContent());
        pstmt.setString(4, revert.getWriter());
        pstmt.setDate(5, new java.sql.Date(new Date().getTime()));//实例化为sql语句中的日期格式
        if(pstmt.executeUpdate() > 0){
            flag = true;
        }
        ConnectionManager.closeStatement(pstmt);
        ConnectionManager.closeConnection(con);
        return flag;
    }

    @Override
    public boolean deleteByRevertId(int revertId) throws Exception {
        boolean flag = false;
        con = ConnectionManager.getConnection();
        String sql = "delete from revert where revertId=?";
        pstmt = con.prepareStatement(sql);
        pstmt.setInt(1, revertId);
        if(pstmt.executeUpdate() > 0){
            flag = true;
        }
        ConnectionManager.closeStatement(pstmt);
        ConnectionManager.closeConnection(con);
        return flag;
    }
}
