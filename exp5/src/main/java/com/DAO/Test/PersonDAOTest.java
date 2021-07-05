package com.DAO.Test;

import com.Factory.DAOFactory;
import com.vo.Person;
import org.junit.Test;

public class PersonDAOTest {
    @Test
    public void loginCheckTest() throws Exception{
        Person person = new Person();
        person.setId("2018110116");
        person.setPassword("123");
        System.out.println(DAOFactory.getPersonDAOInstance().loginCheck(person));
        System.out.println(person.toString());
    }
}
