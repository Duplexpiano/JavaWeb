package com.DAO;

import com.vo.Message;
import java.util.*;

public interface IMessageDAO {
    public boolean addMessage(Message message) throws Exception;
    public boolean deleteMessage(int messageId) throws Exception;
    public Message queryByMessageId(int messageId) throws Exception;
    public List<Message> queryAll() throws Exception;
    public int updateMessage(Message message) throws Exception;
}
