package com.Factory;

import com.DAO.IUserDAO;
import com.DAO.Impl.UserDAOImpl;

public class DAOFactory {
    public static IUserDAO getIUserDAOInstance() throws Exception{
        return new UserDAOImpl();
    }
}
