package com.DAO.Test;

import com.Factory.DAOFactory;
import com.vo.Message;
import org.junit.Test;

import java.text.SimpleDateFormat;
import java.time.LocalDateTime;
import java.util.Date;

public class MessageDAOTest {
    @Test
    public void addMessageTest() throws Exception{
        Message message = new Message();
        Date date = new Date();
//        message.setMessageId(2);
        message.setTitle("幻听");
        message.setContent("列表里的歌，随过往流动");
        message.setWriter("张飞");
        System.out.println(DAOFactory.getMessageDAOInstance().addMessage(message));
        System.out.println(message.toString());
    }
    @Test
    public void deleteMessageTest() throws  Exception{
        int messageId = 4;
        System.out.println(DAOFactory.getMessageDAOInstance().deleteMessage(messageId));
    }
    @Test
    public void queryByMessageIdTest() throws  Exception{
        int messageId = 2;
        Message message = new Message();
        message = DAOFactory.getMessageDAOInstance().queryByMessageId(messageId);
        System.out.println(message.toString());
    }
    @Test
    public void updateMessageTest() throws Exception{
        Message m = new Message();
        m.setMessageId(2);
        m.setTitle("干饭");
        m.setContent("中午十二点干饭，下午三点半下午茶，傍晚五点半干饭");
        m.setWriter("张飞");
        int i = DAOFactory.getMessageDAOInstance().updateMessage(m);
        if(i > 0){
            System.out.println("i: " + i + ">0, 修改成功");
        }else{
            System.out.println("i: " + i + "<0,修改失败" );
        }
    }
    /*
    * 占位符：
    *    G　　"公元"
    *    y　　四位数年份
    *    M　　月
    *    d　　日
    *    h　　时 在上午或下午 (1~12)
    *    H　　时 在一天中 (0~23)
    *    m　　分
    *    s　　秒
    *    S　　毫秒

    *    E　　一周中的周几
    *    D　　一年中的第几天
    *    w　　一年中第几个星期
    *    a　　上午 / 下午 标记符
    *    k 　 时(1~24)
    *    K 　 时 在上午或下午 (0~11)
    */
    @Test
    public void timeTest() throws Exception{
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        Date date = new Date();
        String t = sdf.format(date);
        // 使用SimpleDateFormat()输出战绩想要的格式
        System.out.println(t);
        // sql.Timestamp()输出日期、时间以及毫秒
        System.out.println(new java.sql.Timestamp(date.getTime()));
        // sql.Time()只输出时间
        System.out.println(new java.sql.Time(date.getTime()));
    }
}
