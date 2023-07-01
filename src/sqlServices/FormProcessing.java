/*
 * Gabriel Avinaz
 * 5/29/2020
 * Assignment 9.3
 *
 *Servlet manages the POST request made in insert_form.jsp
 * 
 */
package sqlServices;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.jasper.tagplugins.jstl.core.If;

/**
 * Servlet implementation class FormProcessing
 */
@WebServlet("/FormProcessing")
public class FormProcessing extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public FormProcessing() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * 
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//creates initial message incase the try statement fails
		SQLRunner run = new SQLRunner();
		String message = "Error Processing";
		try {
				//checks if the form submitted is a User form, then creates appropriate bean and runs the statement
			if (request.getParameter("newUser") != null) {
				UserBean user = new UserBean();
				user.setfName(request.getParameter("fname"));
				user.setlName(request.getParameter("lname"));
				user.setEmail(request.getParameter("email"));
				user.setUsrMode(request.getParameter("usrmode"));
				run.runStatement(user.toSQLInsertString());
				message = "User Submission Complete";
			}
				//checks if the form submitted is a Store form, then creates appropriate bean and runs the statement
			if (request.getParameter("newStore") != null) {
				StoreBean store = new StoreBean();
				store.setName(request.getParameter("store"));
				store.setUsrId(request.getParameter("repID"));
				run.runStatement(store.toSQLInsertString());
				message = "Store Submission Complete";
			}
				//checks if the form submitted is a Coupon form, then creates appropriate bean and runs the statement
			if (request.getParameter("newCoupon") != null) {
				CouponBean coupon = new CouponBean();
				coupon.setCode(request.getParameter("code"));
				coupon.setStoreId(request.getParameter("stores"));
				coupon.setTitle(request.getParameter("title"));
				coupon.setDescription(request.getParameter("description"));
				coupon.setRestriction(request.getParameter("restrictions"));
				coupon.setDiscType(request.getParameter("discountType"));
				
				//if the discount amount isn't numerical, it will insert what will be a null amount
				if (request.getParameter("discountType").equals("FLATRATE")) {
					coupon.setDiscAmt(Double.valueOf(request.getParameter("flatInput")));
				}  else if (request.getParameter("discountType").equals("PERCENT")) {
					coupon.setDiscAmt(Double.valueOf(request.getParameter("percentInput")));
				}else {
					coupon.setDiscAmt(0);
				}
				coupon.setStartDate(request.getParameter("startDate"));
				coupon.setEndDate(request.getParameter("endDate"));
				run.runStatement(coupon.toSQLInsertString());
				message = "Coupon Submission Complete";
			}
		
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		//sets message attribute and forwards to completion page
		request.setAttribute("message", message);
        RequestDispatcher dispatcher = request.getRequestDispatcher("/submission_complete.jsp");
        dispatcher.forward(request, response);
	}

}
