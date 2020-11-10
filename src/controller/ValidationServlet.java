package controller;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import dao.DaoValidation;
import dao.DaoFactory;

/**
 * Class that handles a inspector's request to check the validity a travel document.
 * 
 * @author matte
 */
public class ValidationServlet extends HttpServlet {
	
	/**
	 * Method that receives the code entered by the inspector
	 * and then passes control to the page validation.jsp.
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
			DaoValidation daov = dao.getDaoValidation();
			String output[] = daov.validation(code);
			req.getSession().setAttribute("output", output);
			req.getRequestDispatcher("/validation.jsp").forward(req, res2);
		} catch (IOException | ServletException e) {
			e.printStackTrace();
		}
	}
}