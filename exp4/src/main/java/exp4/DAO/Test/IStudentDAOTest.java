package exp4.DAO.Test;

import java.rmi.server.ExportException;
import java.util.ArrayList;
import java.util.List;

import exp4.factory.DAOFactory;
import exp4.vo.Classes;
import exp4.vo.Students;
import org.junit.Test;

public class IStudentDAOTest {
    @Test
    public void testDoCreate() throws Exception {
        Students stu = new Students("2018110158", "赵云", "123", "男", 10201812);
        DAOFactory.getIStudentDAOInstance().doCreate(stu);
    }
    @Test
    public void testDeleteStudents() throws Exception{
        String stuId = "2018110158";
        DAOFactory.getIStudentDAOInstance().deleteStudents(stuId);
    }
    @Test
    public void testUpdateStudents() throws Exception{
        Students stu = new Students("2018110158","子龙", "12345", "男", 10201811);
        //String studentName = "赵子龙";
        //String studentId = "2018110158";
        System.out.println(DAOFactory.getIStudentDAOInstance().updateStudents(stu));
    }
    @Test
    public void testFindAll() throws Exception{
        String keyWord = "";
        List<Students> all = new ArrayList<>();
        all = DAOFactory.getIStudentDAOInstance().findAll(keyWord);
        for (Students s: all) {
            System.out.println(s.toString());
        }
    }
    @Test
    public void testGetAllStudents() throws Exception{
        List<Students> all = new ArrayList<>();
        all = DAOFactory.getIStudentDAOInstance().getAllStudents();
        for (Students s: all) {
            System.out.println(s.toString());
        }
    }
    @Test
    public void testGetAllClass() throws Exception{
        List<Classes> all = new ArrayList<>();
        all = DAOFactory.getIStudentDAOInstance().getAllClass();
        for (Classes c: all) {
            System.out.println(c.toString());
        }
    }
    @Test
    public void testFindByClassId() throws Exception{
        String stuId = "2018110116";
        System.out.println(DAOFactory.getIStudentDAOInstance().findByStudentId(stuId).toString());
    }
//    @Test
//    public void testCombinedQuery() throws Exception{
//        String stuId = "";
//        String stuName = "";
//        int classId = 102018;
//        List<Students> all = new ArrayList<>();
//        all = DAOFactory.getIStudentDAOInstance().combinedQuery(stuId, stuName, classId);
//        for (Students s: all) {
//            System.out.println(s.toString());
//        }
//    }
}
