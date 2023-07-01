/*
 * Gabriel Avinaz
 * 5/29/2020
 * Assignment 9.3
 *
 *This Class is the Bean for User entries, including String method constructing and insert statement for the Bean
 * 
 */
package sqlServices;

import java.io.Serializable;


public class UserBean implements Serializable{
	enum AccessLvl{A, R, U}
	
	private AccessLvl usrMode = AccessLvl.A;
	private String id;
	private String fName;
	private String lName;
	private String email;
	
	public UserBean(){
		
	}
	
	public UserBean(String id, AccessLvl usrMode, String fName, String lName, String email) {
		this.usrMode = usrMode;
		this.id = id;
		this.fName = fName;
		this.lName = lName;
		this.email = email;
	}

	public String getUsrMode() {
		
		return usrMode.name();
	}

	public void setUsrMode(String AccessLvlString) {
		//sets string to enum value, otherwise sets to U (for User)
		AccessLvl usrMode = AccessLvl.U;
		try {
			usrMode = AccessLvl.valueOf(AccessLvlString.toUpperCase());
		} catch (Exception e) {
			System.out.print(e);
		}
		
		this.usrMode = usrMode;
	}
	
	public String toSQLInsertString(){
		
		StringBuffer insertBuffer = new StringBuffer("INSERT INTO USER_INFO VALUES (seq_user.nextval, ");
		insertBuffer.append("'" + usrMode.name() + "', ");
		insertBuffer.append("'" + fName + "', ");
		insertBuffer.append("'" + lName + "', ");
		insertBuffer.append("'" + email + "')");
		
		return insertBuffer.toString();
	}
	
	
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getfName() {
		return fName;
	}
	public void setfName(String fName) {
		this.fName = fName;
	}
	public String getlName() {
		return lName;
	}
	public void setlName(String lName) {
		this.lName = lName;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	
}
