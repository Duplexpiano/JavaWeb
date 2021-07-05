package exp4.DAO;

import exp4.vo.Classes;
import exp4.vo.Students;

import java.util.List;

public interface IStudentDAO {
    public List<Students> getAllStudents();
    public int deleteStudents(String studentId);
    public int updateStudents(Students stu) throws Exception;
    public boolean doCreate(Students stu) throws Exception;
    public List<Students> findAll(String keyWord) throws Exception;
    public List<Classes> getAllClass() throws Exception;
    public Students findByStudentId(String studentId) throws Exception;
//    public List<Students> combinedQuery(String stuId, String stuName, int classId) throws Exception;
}
