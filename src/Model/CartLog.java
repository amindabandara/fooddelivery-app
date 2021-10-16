package Model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity        
@Table(name="cart_log")
public class CartLog {
	
	@Id             
	@GeneratedValue(strategy=GenerationType.AUTO)
	@Column(name="product_id")
	private String productid;
	
	@Column(name="id", nullable=false, unique=true)
	private int cartid;
	
	@Column(name="category_id")
	private String category_id;
	
	@Column(name="quantity")
	private int quantity;
	
	@Column(name="user_id")
	private String userid;
	
	@Column(name="added_date")
	private String addeddate;
	
	@Column(name="status")
	private int status;
	
	public CartLog(){	}

	public String getProductid() {
		return productid;
	}

	public void setProductid(String productid) {
		this.productid = productid;
	}

	public int getCartid() {
		return cartid;
	}

	public void setCartid(int cartid) {
		this.cartid = cartid;
	}

	public String getCategory_id() {
		return category_id;
	}

	public void setCategory_id(String category_id) {
		this.category_id = category_id;
	}

	public int getQuantity() {
		return quantity;
	}

	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}

	public String getUserid() {
		return userid;
	}

	public void setUserid(String userid) {
		this.userid = userid;
	}

	public String getAddeddate() {
		return addeddate;
	}

	public void setAddeddate(String addeddate) {
		this.addeddate = addeddate;
	}

	public int getStatus() {
		return status;
	}

	public void setStatus(int status) {
		this.status = status;
	}

	/*public User(int userid, String username, String password,
			String emailid, String mobno) {
		super();
		this.userid = userid;
		this.username = username;
		this.password = password;
		this.emailid = emailid;
		this.mobno = mobno;
	}*/
	
	
	
	
	
	
	
}
