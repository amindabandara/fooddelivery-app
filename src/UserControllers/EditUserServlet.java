package UserControllers;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import DAOLayer.AdminDbDAO;
import DAOLayer.AdminProductDAO;
import Exceptions.MyException;
import Model.Product;
import Model.User;

/**
 * Servlet implementation class EditUserServlet
 */
@WebServlet("/EditUserServlet")
public class EditUserServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public EditUserServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String userId = request.getParameter("UserId");
		User user = new User();
		
		if(userId != null && !(userId.equals(""))){	
			try {
				user = new AdminDbDAO().getUserById(userId);
				
			} catch (NumberFormatException e) {
				request.getSession().setAttribute("exception",e.getMessage());
			} catch (MyException e) {
				request.getSession().setAttribute("exception",e.getMessage());
			}
			
			request.getSession().setAttribute("userupdate", user);
			
			response.sendRedirect("userjsp/EditUser.jsp");
		}else{
			request.getSession().setAttribute("message", "Error !!!! oh !!!!!!");
			response.sendRedirect("userjsp/UserHome.jsp");
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

}
