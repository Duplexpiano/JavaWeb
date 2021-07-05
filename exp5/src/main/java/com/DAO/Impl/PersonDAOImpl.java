package com.DAO.Impl;

import com.DAO.IPersonDAO;
import com.DatabaseConnection.ConnectionManager;
import com.vo.Person;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class PersonDAOImpl implements IPersonDAO {
    private Connection con = null;
    private PreparedStatement pstmt = null;
    private ResultSet res = null;
    @Override
    public boolean loginCheck(Person person) throws Exception {
        boolean flag = false;
        con = ConnectionManager.getConnection();
        String sql = "select name from person where id=? and password=?";
        pstmt = con.prepareStatement(sql);
        pstmt.setString(1, person.getId());
        pstmt.setString(2, person.getPassword());
        res = pstmt.executeQuery();
        if(res.next()){
            person.setName(res.getString(1));
            flag = true;
        }
        ConnectionManager.closeResultSet(res);
        ConnectionManager.closeStatement(pstmt);
        ConnectionManager.closeConnection(con);
        return flag;
    }
}
