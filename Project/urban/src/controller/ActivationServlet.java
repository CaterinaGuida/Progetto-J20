/* servlet che gestisce la richiesta di attivazione di un titolo di viaggio da parte di un utente.
 * Essa attiva grazie al metodo activation della classe DaoActiver il titolo il cui codice � stato specificato dall'utente.
 */

package controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.ParseException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import dao.*;

public class ActivationServlet extends HttpServlet {
	
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
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
}