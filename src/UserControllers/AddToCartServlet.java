package UserControllers;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import DAOLayer.AdminProductDAO;
import Exceptions.MyException;
import Model.Product;

@WebServlet("/AddToCartServlet")
public class AddToCartServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected static double totalPrice = 0;
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String[] productsId = request.getParameterValues("productBox");
		String[] productsQuantity = request.getParameterValues("productQ");
		List<Product> selectedProductsOld = (List<Product>)request.getSession().getAttribute("selectedProducts");
		String userName = (String)request.getSession().getAttribute("userSession");
		if (productsId != null) {
			if (selectedProductsOld == null) {
				if (productsId != null) {
					List<Product> selectedProducts = new ArrayList<Product>();
					AdminProductDAO productDao = new AdminProductDAO();
					AdminProductDAO productDao3 = new AdminProductDAO();
					Product product = null;
					int i=0;
					for (String productId : productsId) {
						product = new Product();
						try {
							product = productDao.getProductById(Integer
									.parseInt(productId));
							totalPrice = totalPrice + product.getProductPrice();
						} catch (NumberFormatException e) {
							e.printStackTrace();
						} catch (MyException e) {
							e.printStackTrace();
						}
						selectedProducts.add(product);
						try {
							productDao3.cartLog(product.getProductName(),product.getCategory().getCatgName(),1,2,0,Integer.parseInt(productsQuantity[i]),userName);
						} catch (MyException e) {
							// TODO Auto-generated catch block
							e.printStackTrace();
						}i++;
					}
					System.out.println("Total price is: " + totalPrice);

					request.getSession().setAttribute("selectedProducts",
							selectedProducts);
					request.getSession().setAttribute("totalPrice", totalPrice);
				}
			} else {
				if (productsId != null) {
					double totalPriceNew = 0;
					List<Product> selectedProductsNew = new ArrayList<Product>();
					AdminProductDAO productDao = new AdminProductDAO();
					AdminProductDAO productDao2 = new AdminProductDAO();
					Product product = null;
					int i=0;
					for (String productId : productsId) {
						product = new Product();
						try {
							product = productDao.getProductById(Integer
									.parseInt(productId));
							totalPriceNew = totalPriceNew
									+ product.getProductPrice();
						} catch (NumberFormatException e) {
							e.printStackTrace();
						} catch (MyException e) {
							e.printStackTrace();
						}
						selectedProductsNew.add(product);
						try {
							productDao2.cartLog(product.getProductName(),product.getCategory().getCatgName(),1,2,0,Integer.parseInt(productsQuantity[i]),userName);
						} catch (MyException e) {
							// TODO Auto-generated catch block
							e.printStackTrace();
						}
					}
					selectedProductsOld.addAll(selectedProductsNew);
					totalPrice = totalPrice + totalPriceNew;

					System.out.println("Total price is: " + totalPrice);

					request.getSession().setAttribute("selectedProducts",
							selectedProductsOld);
					request.getSession().setAttribute("totalPrice", totalPrice);
				}
			}
			response.sendRedirect("userjsp/SelectedProducts.jsp");
		}else{
			response.sendRedirect("userjsp/UserProductHome.jsp");
		}
	}
}
