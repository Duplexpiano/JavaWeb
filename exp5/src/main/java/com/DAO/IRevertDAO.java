package com.DAO;

import com.vo.*;
import java.util.*;

public interface IRevertDAO {
    public List<Revert> queryByMessageId(int messageId) throws Exception;
    public boolean addRevertByMessageId(Revert revert) throws Exception;
    public boolean deleteByRevertId(int revertId) throws Exception;
}
