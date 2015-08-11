
package dbAccess;

public class UserDetails {
	
	private String userid;
	private String usertype;
	private String password;
	private String email;
	private String firstName;
	private String lastName;
	private String dob;
	private String address;
	private int contactNum;
	private int secQ;
	private String secA;
	
	//for adminlogin
	public UserDetails(String userid, String usertype) {
		super();
		this.userid = userid;
		this.usertype = usertype;
	}
	
	//for userlogin
	public UserDetails(String email, String userid, String usertype) {
		super();
		this.email = email;
		this.userid = userid;
		this.usertype = usertype;
	}
	
	//for create user
	public UserDetails(String userid, String password,
			String email, String firstName, String lastName, String dob,
			String address, int contactNum, int secQ, String secA) {
		super();
		this.userid = userid;
		this.password = password;
		this.email = email;
		this.firstName = firstName;
		this.lastName = lastName;
		this.dob = dob;
		this.address = address;
		this.contactNum = contactNum;
		this.secQ = secQ;
		this.secA = secA;
	}
	
	//for update
	public UserDetails(String userid, String password, String firstName, String lastName, String dob, String address, int contactNum, String email) {
		super();
		this.userid = userid;
		this.password = password;
		this.firstName = firstName;
		this.lastName = lastName;
		this.dob = dob;
		this.address = address;
		this.contactNum = contactNum;
		this.email = email;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getFirstName() {
		return firstName;
	}

	public void setFirstName(String firstName) {
		this.firstName = firstName;
	}

	public String getLastName() {
		return lastName;
	}

	public void setLastName(String lastName) {
		this.lastName = lastName;
	}

	public String getDob() {
		return dob;
	}

	public void setDob(String dob) {
		this.dob = dob;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public int getContactNum() {
		return contactNum;
	}

	public void setContactNum(int contactNum) {
		this.contactNum = contactNum;
	}

	public int getSecQ() {
		return secQ;
	}

	public void setSecQ(int secQ) {
		this.secQ = secQ;
	}

	public String getSecA() {
		return secA;
	}

	public void setSecA(String secA) {
		this.secA = secA;
	}

	public UserDetails() {
		super();
	}

	public String getUserid() {
		return userid;
	}

	public void setUserid(String userid) {
		this.userid = userid;
	}

	public String getUsertype() {
		return usertype;
	}

	public void setUsertype(String usertype) {
		this.usertype = usertype;
	}
	
	
}
