package com.DAO;

import com.vo.User;

public interface IUserDAO {
    public User findByIdAndPassword(String userId, String userPassword) throws Exception;
    public boolean doCreate(User user) throws Exception;
}
