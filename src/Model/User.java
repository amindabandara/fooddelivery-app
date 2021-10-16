package Model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity        
@Table(name="USER")
public class User {
	
	@Id             
	@GeneratedValue(strategy=GenerationType.AUTO)
	@Column(name="USERID")
	private int userid;
	
	@Column(name="USERNAME", nullable=false, unique=true)
	private String username;
	
	@Column(name="PASSWORD", nullable=false)
	private String password;
	
	@Column(name="EMAILID" , nullable=false)
	String emailid ;
	
	@Column(name="MOBILENO", nullable=false)
	private String mobno;
	
	@Column(name="ADDRESS", nullable=false)
	private String address;

	public User(){	}

	/*public User(int userid, String username, String password,
			String emailid, String mobno) {
		super();
		this.userid = userid;
		this.username = username;
		this.password = password;
		this.emailid = emailid;
		this.mobno = mobno;
	}*/
	
	public int getUserid() {
		return userid;
	}

	public void setUserid(int userid) {
		this.userid = userid;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getEmailid() {
		return emailid;
	}

	public void setEmailid(String emailid) {
		this.emailid = emailid;
	}

	public String getMobno() {
		return mobno;
	}

	public void setMobno(String mobno) {
		this.mobno = mobno;
	}
	
	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}
	
}
