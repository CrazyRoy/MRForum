package cn.cqut.edu.bean;

public class User {
	private int userID;
	private String name;
	private String account;
	private String password;
	private int type;
	private String email;
	private String gender;
	/**
	 * 用户的头像图片地址
	 */
	private String photo_address;
	
	public User(){}
	
	public User(String account, String pwd) {
		this.account = account;
		this.password = pwd;
	}
	
	public User(String account, String pwd, String name) {
		this.account = account;
		this.password = pwd;
		this.name = name;
	}
	
	public User(int userID, String name, String account, String password,
			int type, String email, String gender, String photo_address) {
		super();
		this.userID = userID;
		this.name = name;
		this.account = account;
		this.password = password;
		this.type = type;
		this.email = email;
		this.gender = gender;
		this.photo_address = photo_address;
	}

	public long getUserID() {
		return userID;
	}

	public void setUserID(int userID) {
		this.userID = userID;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getAccount() {
		return account;
	}

	public void setAccount(String account) {
		this.account = account;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public int getType() {
		return type;
	}

	public void setType(int type) {
		this.type = type;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	public String getPhoto_address() {
		return photo_address;
	}

	public void setPhoto_address(String photo_address) {
		this.photo_address = photo_address;
	}
}
