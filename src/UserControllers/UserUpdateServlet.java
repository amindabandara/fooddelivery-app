package UserControllers;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import DAOLayer.AdminDbDAO;
import Model.User;

/**
 * Servlet implementation class UserUpdateServlet
 */
@WebServlet("/UserUpdateServlet")
public class UserUpdateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UserUpdateServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		PrintWriter out = response.getWriter();
		String formUsername = request.getParameter("form-username");
		String formUserid = request.getParameter("form-userid");
		String formPassword = request.getParameter("form-password");
		String formEmail = request.getParameter("form-email");
		String formMobno = request.getParameter("form-mobno");
		String formAddress = request.getParameter("form-address");
		String btname = request.getParameter("form-bt");
		HttpSession adminSession = request.getSession(false);
		if(btname.equals("Update Profile")){
		
		if(formUsername != null && formPassword != null && formEmail != null && formMobno != null){
			try{
				User newUser = new User();
				newUser.setUsername(formUsername);
				newUser.setPassword(formPassword);
				newUser.setEmailid(formEmail);
				newUser.setMobno(formMobno);
				newUser.setAddress(formAddress);
				newUser.setUserid(Integer.parseInt(formUserid));

				boolean isUserRegistered = AdminDbDAO.update(newUser);
				
				response.setContentType("text/html");
				if(isUserRegistered == true){
					adminSession.setAttribute("message","You Have Succesfully Updated Profile !!!" );			
					response.sendRedirect("userjsp/UserHome.jsp");
				}
			}catch(Exception e){
				e.printStackTrace();
			}finally{
				out.close();
			}
		}else{
			response.sendRedirect("Login.jsp");
		}
		}else{
			
			try{
				User newUser = new User();
				newUser.setUsername(formUsername);
				newUser.setPassword(formPassword);
				newUser.setEmailid(formEmail);
				newUser.setMobno(formMobno);
				newUser.setAddress(formAddress);
				newUser.setUserid(Integer.parseInt(formUserid));

				boolean isUserRegistered = AdminDbDAO.removeUser(Integer.parseInt(formUserid));
				
				response.setContentType("text/html");
				if(isUserRegistered == true){
					adminSession.setAttribute("message","You Have Succesfully Deleted Profile !!!" );			
					response.sendRedirect("Login.jsp");
				}
			}catch(Exception e){
				e.printStackTrace();
			}finally{
				out.close();
			}
			
		}
	}

}
