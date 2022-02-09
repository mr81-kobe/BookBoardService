/*package com.toy.biz.user;

public class UserVO {

	public UserVO() {
		// TODO Auto-generated constructor stub
	}
	private String name ;
	private String id;
	private String emaill; 
	private String password;
	private String address;
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getEmaill() {
		return emaill;
	}
	public void setEmaill(String emaill) {
		this.emaill = emaill;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}




}
*/


package com.toy.biz.user;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class UserVO {

	public UserVO() {
		// TODO Auto-generated constructor stub
	}
	private int no;
	private String name ;
	private String email; 
	private String password;
	private String address;
	private String lat;
	private String lon;
	private String addr;
	private String authority;

}
