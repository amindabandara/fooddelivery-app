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
import Model.CartLog;
import Model.User;

/**
 * Servlet implementation class UpdateMyCartServlet
 */
@WebServlet("/UpdateMyCartServlet")
public class UpdateMyCartServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdateMyCartServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
PrintWriter out = response.getWriter();
		
		String cartid = request.getParameter("cartId");
		String type = request.getParameter("type");
		HttpSession adminSession = request.getSession(false);
		System.out.print(cartid);
		if(type.equals("1")){
			String quantity = request.getParameter("quantity");
	
			try{
				CartLog newCart = new CartLog();
				//newCart.setQuantity(Integer.parseInt(quantity));
		

				boolean isCartUpdated = AdminDbDAO.updateCartItem(Integer.parseInt(cartid),Integer.parseInt(quantity));
				
				response.setContentType("text/html");
				if(isCartUpdated == true){
					adminSession.setAttribute("message","You Have Succesfully Updated Item !!!" );			
					response.sendRedirect("ViewMyCartServlet");
				}
			}catch(Exception e){
				e.printStackTrace();
			}finally{
				out.close();
			}
	
		}else{
			
			try{
				
				boolean isCartUpdated = AdminDbDAO.removeCartItem(Integer.parseInt(cartid));
				
				response.setContentType("text/html");
				if(isCartUpdated == true){
					adminSession.setAttribute("message","You Have Succesfully Deleted Item !!!" );			
					response.sendRedirect("ViewMyCartServlet");
				}
			}catch(Exception e){
				e.printStackTrace();
			}finally{
				out.close();
			}
			
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		PrintWriter out = response.getWriter();
		
		String cartid = request.getParameter("cartId");
		HttpSession adminSession = request.getSession(false);
		System.out.print(cartid);
	    String quantity = request.getParameter("quantity");
	
			try{
				CartLog newCart = new CartLog();
				//newCart.setQuantity(Integer.parseInt(quantity));
		

				boolean isCartUpdated = AdminDbDAO.updateCartItem(Integer.parseInt(cartid),Integer.parseInt(quantity));
				
				response.setContentType("text/html");
				if(isCartUpdated == true){
					adminSession.setAttribute("message","You Have Succesfully Updated Item !!!" );			
					response.sendRedirect("ViewMyCartServlet");
				}
			}catch(Exception e){
				e.printStackTrace();
			}finally{
				out.close();
			}
			
		
	}

}
