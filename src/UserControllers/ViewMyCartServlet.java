package UserControllers;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import DAOLayer.AdminDbDAO;
import Exceptions.MyException;
import Model.User;

/**
 * Servlet implementation class ViewMyCart
 */
@WebServlet("/ViewMyCartServlet")
public class ViewMyCartServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ViewMyCartServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	   
		
		String userId = request.getParameter("UserId");
		if(userId == null){
		 userId = (String)request.getSession().getAttribute("userSession");
	    }
		List<?> carts = null;
		if(userId != null && !(userId.equals(""))){	
			try {
				;
				carts = new AdminDbDAO().getCartById(userId);
				
			} catch (NumberFormatException e) {
				request.getSession().setAttribute("exception",e.getMessage());
			} catch (MyException e) {
				request.getSession().setAttribute("exception",e.getMessage());
			}
			
			request.getSession().setAttribute("mycart", carts);
			
			response.sendRedirect("userjsp/MyCart.jsp");
			
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
