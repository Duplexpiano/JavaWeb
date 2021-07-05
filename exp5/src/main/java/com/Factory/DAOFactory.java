package com.Factory;

import com.DAO.*;
import com.DAO.Impl.*;

public class DAOFactory {
    public static IPersonDAO getPersonDAOInstance() throws Exception{
        return new PersonDAOImpl();
    }
    public static IMessageDAO getMessageDAOInstance() throws Exception{
        return new MessageDAOImpl();
    }
    public static IRevertDAO getRevertDAOInstance() throws Exception{
        return new RevertDAOImpl();
    }
}
