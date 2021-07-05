package com.DAO.Impl;

import com.DAO.IUserDAO;
import com.DatabaseConnection.DatabaseConnection;
import com.vo.User;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class UserDAOImpl implements IUserDAO {
    private Connection connection = null;
    private PreparedStatement pstmt = null;
    private ResultSet rs = null;

    @Override
    public User findByIdAndPassword(String userId, String userPassword) throws Exception {
        User user = null;
        this.connection = DatabaseConnection.getConnection();
        String sql = "select username from t_user where userid=? and password=?";
        this.pstmt = this.connection.prepareStatement(sql);
        this.pstmt.setString(1, userId);
        this.pstmt.setString(2,userPassword);
        this.rs = pstmt.executeQuery();
        if(rs.next()){
            user = new User();
            user.setUserId(userId);
            user.setUserPassword(userPassword);
            user.setUserName(rs.getString(1));
        }

        rs.close();
        pstmt.close();
        connection.close();

        return user;
    }

    @Override
    public boolean doCreate(User user) throws Exception {
        boolean flag = false;
        this.connection = DatabaseConnection.getConnection();
        String sql = "insert into t_user values(?,?,?)";
        this.pstmt = this.connection.prepareStatement(sql);
        this.pstmt.setString(1,user.getUserId());
        this.pstmt.setString(2,user.getUserName());
        this.pstmt.setString(3,user.getUserPassword());
        int i = this.pstmt.executeUpdate();
        if(i > 0){
            flag = true;
        }
        DatabaseConnection.closeStatement(this.pstmt);
        DatabaseConnection.closeConnection(this.connection);
        return flag;
    }
}