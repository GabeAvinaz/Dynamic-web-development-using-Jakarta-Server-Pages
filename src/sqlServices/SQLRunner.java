/*
 * Gabriel Avinaz
 * 5/29/2020
 * Assignment 9.3
 *
 *Class controls all the interaction between the Oracle DB and the web application
 * 
 */

package sqlServices;

import java.io.FileInputStream;
import java.io.InputStream;
import java.sql.Connection;
import java.sql.DatabaseMetaData;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Scanner;


public class SQLRunner {
    Connection con;
	Statement stmt;
    
	public SQLRunner(){


    }
	
	//method to check whether the Coupon table has been created in the database
	//created to throw and exception if the user attempts to view Tables before loading the DB 
	public void dbCheck() throws Exception{
		connect();
		DatabaseMetaData db = con.getMetaData();
		ResultSet rs = db.getTables(null, null, "COUPON", null);
		if (!rs.next()) {
			throw new Exception("No Database");
		}
	}
	
	//fetches and returns a Resulset used for creating coupon table in display_info.jsp
	public ResultSet getCoupons() {
		connect();
		try {
			ResultSet rs = stmt.executeQuery("SELECT C_ID, COALESCE(C_CODE, ' ') AS C_CODE, S_NAME, C_TItLE, COALESCE(C_DESCRIPTION, ' ') AS C_DESCRIPTION, COALESCE(C_RESTRICTION, ' ') AS C_RESTRICTION, C_DISC_TYPE, COALESCE(TO_CHAR(C_DISC_AMT), ' ') AS C_DISC_AMT, TO_CHAR(C_START_DATE, 'DD/MM/YYYY') AS C_START_DATE, COALESCE(TO_CHAR(C_END_DATE, 'DD/MM/YYYY'), ' ') AS C_END_DATE FROM COUPON, STORE WHERE C_STORE_ID=S_ID");
			return rs;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		finally {	

		}
		return null;
	}
	
	//fetches and returns a Resulset used for creating stores table in display_info.jsp
	public ResultSet getStores() {
		connect();
		try {
			ResultSet rs = stmt.executeQuery("SELECT S_ID, S_NAME, U_fname || ' ' || U_lname AS U_REP FROM STORE JOIN USER_INFO ON store.s_user_id=user_info.u_id");
			return rs;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		finally {	

		}
		return null;
	}
	
	//fetches and returns a Resulset used for creating user_info table in display_info.jsp
	public ResultSet getUsers() {
		connect();
		try {
			ResultSet rs = stmt.executeQuery("SELECT U_ID, U_ACCESS_LVL, U_FNAME, U_LNAME, COALESCE(U_EMAIL, ' ') AS U_EMAIL FROM USER_INFO");
			return rs;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		finally {	

		}
		return null;
	}
	
	
	//when invoked, it will execute the String passed as a SQL statement
	public void runStatement(String sqlString) throws SQLException{
		connect();
		stmt.execute(sqlString);
		disconnect();
	}
	
	//creates connection to DB
	public void connect() {
		try {
			DriverManager.registerDriver (new oracle.jdbc.OracleDriver());
			con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE", "student1","pass");
			stmt = con.createStatement();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	
	//closes connection to DB
	public void disconnect() {
		try {
			con.close();
			stmt.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		

	}
	
	
	//returns an Result set with names of Users that are representatives 
	public ResultSet getRepNames() {
		connect();
		try {
			ResultSet rs = stmt.executeQuery("SELECT U_ID AS ID, U_fname || ' ' || U_lname AS NAME FROM USER_INFO WHERE U_ACCESS_LVL = 'R'");
			return rs;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		finally {	

		}
		return null;
		
	}
	
	//returns names of stores in DB
	public ResultSet getStoreNames() {
		connect();
		try {
			ResultSet rs = stmt.executeQuery("SELECT S_ID AS ID, S_NAME as NAME FROM STORE");
			return rs;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		finally {	

		}
		return null;
		
	}
	
	//used for Setup, future implementation could utilize this instead of the above statements
	public ArrayList<String> processSQL(String filepath) {
		connect();
		ArrayList<String> comX = runScript(filepath);
		disconnect();
		return comX;
	}
	
	//takes a filepath string and attempts to load the file and run any SQL commands on it.
	//returns ArrayList of commands executed.
	public ArrayList<String> runScript(String inputFile) {
		
		String delimiter = ";";
		String inputStatement = null;
		ArrayList<String> comX = new ArrayList<String>();
		
		
		try {
			InputStream in = new FileInputStream(inputFile);
			System.out.println(in.toString());
			Scanner sqlScanner = new Scanner(in);
			sqlScanner.useDelimiter(delimiter);
			while(sqlScanner.hasNext()) {
				inputStatement = sqlScanner.next();
				comX.add(inputStatement);
				stmt.execute(inputStatement);
			}

			sqlScanner.close();
			
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		
		return comX;
	      
	}

}
