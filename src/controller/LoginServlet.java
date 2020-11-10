package controller;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import dao.DaoFactory;
import dao.DaoLogin;

/**
 * class that handles a inspector's request to authenticate within the system
 * 
 * @author matte
 */
public class LoginServlet extends HttpServlet{
	
	/**
	 * method that receives the username and password entered by the inspector,
	 * compares them with the values stored in the database
	 * and then passes control to the right jsp page
	 *
	 * @param req the request
	 * @param res2 the response
	 */
	public void service(HttpServletRequest req, HttpServletResponse res2) {
		try {
			PrintWriter out = res2.getWriter();
			String username = req.getParameter("username");
			String password = req.getParameter("password");
			DaoFactory dao = DaoFactory.getInstance();
			DaoLogin dl = dao.getDaoLogin();
			boolean log = dl.login(username, password);
			
			if(log) {
				req.getSession().setAttribute("username", username);
				req.getRequestDispatcher("/inspector.jsp").forward(req, res2);
			}
			else {
				req.getRequestDispatcher("/inspectornotfound.jsp").forward(req, res2);
			}
		} catch (IOException | ServletException e) {
			e.printStackTrace();
		}	
	}
}