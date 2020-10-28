/* servlet che gestisce la richiesta authenticazione di un controllore.
 * Essa aesegue il login  grazie al metodo login della classe DaoLoger 
 */

package controller;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import dao.DaoFactory;
import dao.DaoLogin;

public class LoginServlet extends HttpServlet{
	
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
			// TODO Auto-generated catch block
			e.printStackTrace();
		}	
	}
}