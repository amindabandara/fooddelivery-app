package AdminController;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import DAOLayer.AdminDbDAO;
import Model.Admin;
import Model.User;

/**
 * Servlet implementation class AdminRegisterServlet
 */
@WebServlet("/AdminRegisterServlet")
public class AdminRegisterServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdminRegisterServlet() {
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
		String formPassword = request.getParameter("form-password");
		String confirmPassword = request.getParameter("confirm-password");
	
		HttpSession adminSession = request.getSession(false);
		if(formPassword.equals(confirmPassword)){

		if(formUsername != null && formPassword != null ){
			try{
				Admin newUser = new Admin();
				newUser.setAdminUsername(formUsername);
				newUser.setAdminPassword(formPassword);
		
				boolean isUserRegistered = AdminDbDAO.addNewAdmin(newUser);
				
				response.setContentType("text/html");
				if(isUserRegistered == true){
					out.print("<h3>You are Registered Successfully!!!!!!</h3>");
					out.print("<a href='AdminLogin.jsp'>Go To Login Page</a>");
				}
			}catch(Exception e){
				e.printStackTrace();
			}finally{
				out.close();
			}
		}else{
			response.sendRedirect("RegisterAdmin.jsp");
		}
		}else{
			adminSession.setAttribute("message","Entered Password Mismatched !!!" );
			response.sendRedirect("RegisterAdmin.jsp");
		}
	}

}
