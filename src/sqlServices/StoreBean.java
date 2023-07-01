/*
 * Gabriel Avinaz
 * 5/29/2020
 * Assignment 9.3
 *
 *This Class is the Bean for Store entries, including String method constructing and insert statement for the Bean
 * 
 */
package sqlServices;

import java.io.Serializable;

public class StoreBean implements Serializable{
	private String id;
	private String name;
	private String usrId;
	
	
	public StoreBean() {
		// TODO Auto-generated constructor stub
	}


	public StoreBean(String id, String name, String usrId) {
		this.id = id;
		this.name = name;
		this.usrId = usrId;
	}
	
	public String toSQLInsertString(){
		
		StringBuffer insertBuffer = new StringBuffer("INSERT INTO STORE VALUES (seq_store.nextval, ");
		insertBuffer.append("'" + name + "', ");
		insertBuffer.append("'" + usrId + "')");
		
		return insertBuffer.toString();
	}


	public String getId() {
		return id;
	}


	public void setId(String id) {
		this.id = id;
	}


	public String getName() {
		return name;
	}


	public void setName(String name) {
		this.name = name;
	}


	public String getUsrId() {
		return usrId;
	}


	public void setUsrId(String usrId) {
		this.usrId = usrId;
	}
	
	

}
