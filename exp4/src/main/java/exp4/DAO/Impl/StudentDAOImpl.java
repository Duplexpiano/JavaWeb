package exp4.DAO.Impl;

import exp4.DAO.IStudentDAO;
import exp4.DatabaseConnection.ConnectionManager;
import exp4.vo.Classes;
import exp4.vo.Students;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class StudentDAOImpl implements IStudentDAO {
    private Connection connection = null;
    private PreparedStatement preparedStatement = null;
    private ResultSet resultSet = null;

    public List<Students> getAllStudents(){
        List<Students> allStudents=new ArrayList<Students>();
        try {
            this.connection = ConnectionManager.getConnection();//1.创建连接
            String sql = "select * from Students";
            this.preparedStatement = this.connection.prepareStatement(sql);//2.创建预处理语句总管
            this.resultSet = this.preparedStatement.executeQuery();//3.语句总管执行查询
            while (this.resultSet.next()) {
                String studentId = this.resultSet.getString(1);
                String studentName = this.resultSet.getString("studentName");
                String studentPwd = this.resultSet.getString(3);
                String sex = this.resultSet.getString("sex");
                int classId = this.resultSet.getInt(5);
                //构造方法组装成一个Students对象stu
                Students stu = new Students(studentId, studentName, studentPwd, sex, classId);
                allStudents.add(stu);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }finally{
            ConnectionManager.closeResultSet(this.resultSet);//5.关闭结果集 对象、语句总管、连接
            ConnectionManager.closeStatement(this.preparedStatement);
            ConnectionManager.closeConnection(this.connection);
        }
        return allStudents;
    }

    public int deleteStudents(String studentId){
        int i = 0;
        try {
            this.connection = ConnectionManager.getConnection();  //1.创建连接
            String strSql = "delete from students where studentId=?";
            this.preparedStatement = this.connection.prepareStatement(strSql);  //2.创建预处理语句总管
            this.preparedStatement.setString(1, studentId);
            i = this.preparedStatement.executeUpdate();  //3.语句总管执行SQL语句
//            System.out.println("成功删除"+i+"条数据！");
        } catch (SQLException sqlE) {
            sqlE.printStackTrace();
        } finally {
            ConnectionManager.closeStatement(this.preparedStatement);//4.关闭语句总管、连接
            ConnectionManager.closeConnection(this.connection);
        }
        return i;
    }

    public int updateStudents(Students stu) throws Exception{
        int i = 0;
        this.connection = ConnectionManager.getConnection();  //1.创建连接
        String strSql = "update students set studentName=?, studentPwd=?, sex=?, classId=? where studentId=?";
        this.preparedStatement = this.connection.prepareStatement(strSql);  //2.创建预处理语句总管
        this.preparedStatement.setString(1, stu.getStudentName());
        this.preparedStatement.setString(2, stu.getStudentPwd());
        this.preparedStatement.setString(3, stu.getSex());
        this.preparedStatement.setInt(4, stu.getClassId());
        this.preparedStatement.setString(5, stu.getStudentId());
        i = this.preparedStatement.executeUpdate();  //3.语句总管执行SQL语句
//            System.out.println("成功修改"+row+"条数据！");
        ConnectionManager.closeStatement(this.preparedStatement);//4.关闭语句总管、连接
        ConnectionManager.closeConnection(this.connection);
        return i;
    }

    @Override
    public boolean doCreate(Students stu) throws Exception {
        boolean flag = false;
        this.connection = ConnectionManager.getConnection();
        String sql = "insert into Students values(?, ?, ?, ?, ?)";
        this.preparedStatement = this.connection.prepareStatement(sql);
        this.preparedStatement.setString(1, stu.getStudentId());
        this.preparedStatement.setString(2, stu.getStudentName());
        this.preparedStatement.setString(3, stu.getStudentPwd());
        this.preparedStatement.setString(4, stu.getSex());
        this.preparedStatement.setInt(5, stu.getClassId());
        if(this.preparedStatement.executeUpdate() > 0){
            flag = true;
        }
        ConnectionManager.closeStatement(this.preparedStatement);
        ConnectionManager.closeConnection(this.connection);
        return flag;
    }

    @Override
    public List<Students> findAll(String keyWord) throws Exception {
        List<Students> allStu = new ArrayList<>();
        this.connection = ConnectionManager.getConnection();
        String sql = "select s.*, className from Students as s inner join classes as c on (s.classId = c.classId) where studentId like ? or studentName like ? or sex like ? or className like ?";
        this.preparedStatement = this.connection.prepareStatement(sql);
        this.preparedStatement.setString(1, "%" + keyWord + "%");
        this.preparedStatement.setString(2, "%" + keyWord + "%");
        this.preparedStatement.setString(3, "%" + keyWord + "%");
        this.preparedStatement.setString(4,"%" + keyWord + "%");
        this.resultSet = this.preparedStatement.executeQuery();
        Students stu = null;
        while(this.resultSet.next()){
            stu = new Students();
            stu.setStudentId(this.resultSet.getString(1));
            stu.setStudentName(this.resultSet.getString(2));
            stu.setStudentPwd(this.resultSet.getString(3));
            stu.setSex(this.resultSet.getString(4));
            stu.setClassId(this.resultSet.getInt(5));
            stu.setClassName(this.resultSet.getString(6));
            allStu.add(stu);
        }
        ConnectionManager.closeResultSet(this.resultSet);
        ConnectionManager.closeStatement(this.preparedStatement);
        ConnectionManager.closeConnection(this.connection);
        return allStu;
    }

    @Override
    public List<Classes> getAllClass() throws Exception {
        List<Classes> all = new ArrayList<>();
        Classes cls = null;
        this.connection = ConnectionManager.getConnection();
        String sql = "select classId, className from classes";
        this.preparedStatement = this.connection.prepareStatement(sql);
        this.resultSet =  this.preparedStatement.executeQuery();
        while(resultSet.next()){
            cls = new Classes();
            cls.setClassId(resultSet.getInt(1));
            cls.setClassName(resultSet.getString(2));
            all.add(cls);
        }
        ConnectionManager.closeResultSet(this.resultSet);
        ConnectionManager.closeStatement(this.preparedStatement);
        ConnectionManager.closeConnection(this.connection);
        return all;
    }

    @Override
    public Students findByStudentId(String studentId) throws Exception {
        this.connection = ConnectionManager.getConnection();
        String sql = "select studentId, studentName, studentPwd, sex, s.classId, className from Students as s, Classes as c where s.classId=c.classId and s.studentId=?";
        this.preparedStatement = this.connection.prepareStatement(sql);
        this.preparedStatement.setString(1, studentId);
        this.resultSet = this.preparedStatement.executeQuery();
        Students stu= null;
        if(resultSet.next()){
            stu = new Students();
            stu.setStudentId(resultSet.getString(1));
            stu.setStudentName(resultSet.getString(2));
            stu.setStudentPwd(resultSet.getString(3));
            stu.setSex(resultSet.getString(4));
            stu.setClassId(resultSet.getInt(5));
            stu.setClassName(resultSet.getString(6));
        }
        ConnectionManager.closeResultSet(this.resultSet);
        ConnectionManager.closeStatement(this.preparedStatement);
        ConnectionManager.closeConnection(this.connection);
        return stu;
    }
//    @Override
//    public List<Students> combinedQuery(String stuId, String stuName, int classId) throws Exception {
//        List<Students> allStu = new ArrayList<>();
//        this.connection = ConnectionManager.getConnection();
//        String sql = "select s.*, className from students as s inner join classes as c on(s.classId=c.classId) where studentId like ? and studentName like ? and classId like ?";
//        this.preparedStatement = this.connection.prepareStatement(sql);
//        this.preparedStatement.setString(1,stuId);
//        this.preparedStatement.setString(2, stuName);
//        this.preparedStatement.setInt(3, classId);
//        this.resultSet = this.preparedStatement.executeQuery();
//        Students stu = null;
//        while(this.resultSet.next()){
//            stu = new Students();
//            stu.setStudentId(this.resultSet.getString(1));
//            stu.setStudentName(this.resultSet.getString(2));
//            stu.setStudentPwd(this.resultSet.getString(3));
//            stu.setSex(this.resultSet.getString(4));
//            stu.setClassId(this.resultSet.getInt(5));
//            stu.setClassName(this.resultSet.getString(6));
//            allStu.add(stu);
//        }
//        ConnectionManager.closeResultSet(this.resultSet);
//        ConnectionManager.closeStatement(this.preparedStatement);
//        ConnectionManager.closeConnection(this.connection);
//        return allStu;
//    }
}
