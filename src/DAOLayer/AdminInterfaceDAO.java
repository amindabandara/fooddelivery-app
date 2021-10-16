package DAOLayer;

import java.util.List;

import Exceptions.MyException;

public interface AdminInterfaceDAO {
	public boolean add(Object newObject) throws MyException;
	public boolean remove(int id) throws MyException;
	public boolean update(Object newObject) throws MyException;
	public List<?> readAll() throws MyException;
	public boolean cartLog(String parm1,String parm2,int parm3,int parm4,int parm5,int parm6,String parm7) throws MyException;
	
}
