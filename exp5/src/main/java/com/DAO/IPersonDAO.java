package com.DAO;

import com.vo.Person;

public interface IPersonDAO {
    public boolean loginCheck(Person person) throws Exception;
}
