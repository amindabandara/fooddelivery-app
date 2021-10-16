package DAOLayer;

import java.util.List;

import org.hibernate.HibernateException;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;

import Exceptions.MyException;
import Model.Admin;
import Model.CartLog;
import Model.Product;
import Model.User;

public class AdminDbDAO {
	public  static boolean status ;
	private static SessionFactory factory = null;
	private static Session dbSession = null;
	private static Transaction getTransaction = null;
	private static Session session;
	public static boolean getUserAuthenticate(String formUsername, String formPassword){
		status = false;

		try {
			factory = HibernateUtil.getSessionFactory();

			dbSession = factory.openSession();

			Query getVerifyData = dbSession.createQuery("from User where username like '"+ formUsername+"' and password like '"+formPassword+"'");
		
			User userData =  (User) getVerifyData.uniqueResult();
			
			if(userData != null){
				
				if(userData.getUsername().equals(formUsername) && userData.getPassword().equals(formPassword)){
					System.out.println("true ....");   // debugging statement 
					status = true;
				}	
			}else{
				return status=false;
			}

		} catch (HibernateException he) {
			he.printStackTrace();
		}finally{
			try {
				dbSession.close();
				factory.close();
			} catch (HibernateException he) {
				he.printStackTrace();
			}
		}
		return status;
	}

	public static boolean getAdminAuthenticate(String adminUsername,String adminPassword) {
		

			try {
				factory = HibernateUtil.getSessionFactory();

				dbSession = factory.openSession();

				Query getVerifyData = dbSession.createQuery("from Admin where ADMINUSERNAME like '"+ adminUsername+"' and ADMINPASSWORD like '"+adminPassword+"'");
			
				Admin userData =  (Admin) getVerifyData.uniqueResult();
				
				if(userData != null){
					
					if(userData.getAdminUsername().equals(adminUsername) && userData.getAdminPassword().equals(adminPassword)){
						System.out.println("true ....");   // debugging statement 
						status = true;
					}	
				}else{
					return status=false;
				}

			} catch (HibernateException he) {
				he.printStackTrace();
			}finally{
				try {
					dbSession.close();
					factory.close();
				} catch (HibernateException he) {
					he.printStackTrace();
				}
			}
			return status;
	}
	

	public static boolean addNewUser(User newUser){
		try {
			status =false;
			factory = HibernateUtil.getSessionFactory();
			dbSession = factory.openSession();
			getTransaction = dbSession.beginTransaction();
			dbSession.save(newUser);
			getTransaction.commit();
			status = true;
		} catch (HibernateException he) {
			he.printStackTrace();
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			dbSession.close();
			factory.close();
		}
		return status;
	}
	
	

	
	public static boolean update(Object newObject) throws MyException {
		User updateUser = new User();
		status = false;
		System.out.println("updating the user .....into database");
		updateUser = (User)newObject;
		try {
			status =false;
			session = HibernateUtil.getSessionFactory().openSession();
			getTransaction = session.beginTransaction();
			session.get(User.class, updateUser.getUserid());
			session.merge(updateUser);
			getTransaction.commit();
			status = true;
		} catch (HibernateException he) {
			throw new MyException(he);
		}catch(final Exception e){
			e.printStackTrace();
		}finally{
			session.close();
		}
		System.out.println("return true from user addition in table updating....");
		return status;
	}
	
	
	public static boolean updateCartItem(int id,int quantity) throws MyException {
		try {
			status =false;
			session = HibernateUtil.getSessionFactory().openSession();
			getTransaction = session.beginTransaction();
			Query query = session.createQuery("UPDATE  CartLog SET quantity="+quantity+" WHERE cartid="+id);
			int i = query.executeUpdate();
			getTransaction.commit();
			if(i>0){
				status = true;
			}
		} catch (HibernateException he) {
			throw new MyException(he);
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			session.close();
		}
		return status;
	}
	
	
	
	public static boolean removeUser(int id) throws MyException {
		try {
			status =false;
			session = HibernateUtil.getSessionFactory().openSession();
			getTransaction = session.beginTransaction();
			Query query = session.createQuery("delete from User where USERID="+id);
			int i = query.executeUpdate();
			getTransaction.commit();
			if(i>0){
				status = true;
			}
		} catch (HibernateException he) {
			throw new MyException(he);
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			session.close();
		}
		return status;
	}
	
	public static boolean removeCartItem(int id) throws MyException {
		try {
			status =false;
			session = HibernateUtil.getSessionFactory().openSession();
			getTransaction = session.beginTransaction();
			Query query = session.createQuery("delete from CartLog where cartid="+id);
			int i = query.executeUpdate();
			getTransaction.commit();
			if(i>0){
				status = true;
			}
		} catch (HibernateException he) {
			throw new MyException(he);
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			session.close();
		}
		return status;
	}
	
	
	public User getUserById(String userId) throws MyException {
		User user = null;
		try {
				
			session = HibernateUtil.getSessionFactory().openSession();
			getTransaction = session.beginTransaction();
			Query query = session.createQuery("FROM User where USERNAME like '"+userId+"' ");
			
			user = (User)query.uniqueResult();
			
		} catch (HibernateException he) {
			throw new MyException(he);
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			session.close();
		}
		return user;
	}
	
	public List<?> getCartById(String userId) throws MyException {
		
		List<?> carts = null;
	
			try {
				
			session = HibernateUtil.getSessionFactory().openSession();
			getTransaction = session.beginTransaction();System.out.print("hio");
			Query query = session.createQuery("FROM CartLog where user_id like '"+userId+"' ");
			
			carts = query.list();
			
		} catch (HibernateException he) {
			throw new MyException(he);
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			session.close();
		
		}
			return carts;
	}
	
	
	
	
	public static boolean addNewAdmin(Admin newAdmin){
		try {
			status =false;
			factory = HibernateUtil.getSessionFactory();
			dbSession = factory.openSession();
			getTransaction = dbSession.beginTransaction();
			dbSession.save(newAdmin);
			getTransaction.commit();
			status = true;
		} catch (HibernateException he) {
			he.printStackTrace();
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			dbSession.close();
			factory.close();
		}
		return status;
	}

	
}
