/*
 * Gabriel Avinaz
 * 5/29/2020
 * Assignment 9.3
 *
 *Servlet manages the get request made in both setup JSPs
 * 
 */
package sqlServices;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class PageController
 */
@WebServlet("/PageController")
public class PageController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public PageController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//retrieves run parameter and runs the appropriate script
		String run = (String) request.getParameter("run");
		ArrayList<String> commands;
		SQLRunner runner = new SQLRunner();
		String filePath = null;
		///
		///Gets the real path for each SQL script
		///getting relative paths to work was where I had the most trouble.
		///
		if(run.equals("setup")) {
			filePath = getServletContext().getRealPath("/resources/setupProject.sql");
		}else if (run.equals("drop")) {
			filePath = getServletContext().getRealPath("/resources/dropProject.sql");
		}
		
		
		commands = runner.processSQL(filePath);
        
		//commands are linked to the request and forwarded to the script_complete page
		request.setAttribute("commands", commands);

        RequestDispatcher dispatcher = request.getRequestDispatcher("/script_complete.jsp");
        dispatcher.forward(request, response);
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}
	
	

}
