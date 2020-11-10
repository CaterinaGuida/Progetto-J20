package controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.ParseException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import dao.*;

/**
 * Class that handles the user's request to activate a travel document.
 * 
 * @author matte
 */
public class ActivationServlet extends HttpServlet {
	
	/**
	 * Method that receives the code entered by the user
	 * and then passes control to the page activation.jsp.
	 *
	 * @param req the request
	 * @param res2 the response
	 */
	public void service(HttpServletRequest req, HttpServletResponse res2) {
		PrintWriter out;
		try {
			out = res2.getWriter();
			String code = (String) req.getParameter("code");
			DaoFactory dao = DaoFactory.getInstance();
			DaoActivation da = dao.getDaoActivation();
			String output[] = da.activation(code);
			req.getSession().setAttribute("output", output);
			req.getRequestDispatcher("/activation.jsp").forward(req, res2);
		} catch (IOException | ParseException | ServletException e) {
			e.printStackTrace();
		}
	}
}