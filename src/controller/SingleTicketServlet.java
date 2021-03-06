package controller;

import dao.*;
import javax.servlet.http.HttpServlet;
import model.*;
import java.io.ByteArrayOutputStream;
import java.io.IOException;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.*;

/**
 * Class that handles the user's request to purchase a single ticket.
 * 
 * @author matte
 */
public class SingleTicketServlet extends HttpServlet {

	/**
	 * Method that instantiates an object of the SingleTicket class,
	 * stores it in the database using the addSingleTicket method,
	 * generates a receipt in PDF format and returns it to the user.
	 *
	 * @param req the request
	 * @param res2 the response
	 */
	public void service(HttpServletRequest req, HttpServletResponse res2) {
		try {
			res2.setContentType("application/pdF;charset=UTF-8");
			res2.addHeader("Content-Disposition","inline; filename"+"biglietto.pdf");
			SingleTicket ticket = new SingleTicket();
			DaoFactory dao = DaoFactory.getInstance();
			DaoPurchase daop = dao.getDaoPurchase();
			daop.addSingleTicket(ticket);
			Receipt receipt = new Receipt();
			ServletOutputStream out = res2.getOutputStream();
			ByteArrayOutputStream baos = receipt.generateSingleTicket(ticket);
			baos.writeTo(out);
		} catch (IOException  e) {
			e.printStackTrace();
		}
	}
}