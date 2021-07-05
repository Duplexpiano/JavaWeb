package com.DAO.Test;

import com.Factory.DAOFactory;
import com.vo.User;
import org.junit.Test;

public class UserDAOTest {
    @Test
    public void testFindByIdAndPassword() throws Exception{
        String userId = "2018110116";
        String password = "123";
        System.out.println(DAOFactory.getIUserDAOInstance().findByIdAndPassword(userId, password));
    }
    @Test
    public void testDoCreate() throws Exception{
        User user = new User();
        user.setUserId("2018110120");
        user.setUserName("李四");
        user.setUserPassword("123");
        if(DAOFactory.getIUserDAOInstance().doCreate(user)){
            System.out.println("注册成功");
        }else{
            System.out.println("注册失败");
        }
    }
}
