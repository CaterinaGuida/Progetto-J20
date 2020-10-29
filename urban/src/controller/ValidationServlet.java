/* servlet che gestisce la richiesta di controllo della validit� di un titolo di viaggio 
 * il cui codice � stato specificato da un controllore.
 * Essa utilizza il metodo validation della classe DaoChecker.
 */

package controller;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import dao.DaoValidation;
import dao.DaoFactory;

public class ValidationServlet extends HttpServlet {
	
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
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
}