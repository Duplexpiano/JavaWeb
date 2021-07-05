package com.DAO.Test;

import com.Factory.DAOFactory;
import com.vo.Revert;
import  org.junit.Test;
import java.util.*;

public class RevertDAOTest {
    @Test
    public void queryByMessageIdTest() throws Exception{
        int messageId = 1;
        List<Revert> all = new ArrayList<>();
        all = DAOFactory.getRevertDAOInstance().queryByMessageId(messageId);
        for (Revert r: all) {
            System.out.println(r.toString());
        }
    }
    @Test
    public void addRevertByMessageIdTest() throws Exception{
        Revert revert = new Revert();
//        revert.setRevertId(1);
        revert.setMessageId(1);
        revert.setContent("wow!!");
        revert.setWriter("张飞");
        revert.setWriteDate(new java.sql.Date(new Date().getTime()));
        System.out.println(DAOFactory.getRevertDAOInstance().addRevertByMessageId(revert));
        System.out.println(revert.toString());
    }
    @Test
    public void deleteByRevertId() throws Exception{
        int revertId = 1;
        System.out.println(DAOFactory.getRevertDAOInstance().deleteByRevertId(revertId));
    }
}
