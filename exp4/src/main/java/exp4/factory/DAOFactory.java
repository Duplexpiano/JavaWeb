package exp4.factory;

import exp4.DAO.IStudentDAO;
import exp4.DAO.Impl.StudentDAOImpl;

public class DAOFactory {
    public static IStudentDAO getIStudentDAOInstance() throws Exception{
        return new StudentDAOImpl();
    }
}
