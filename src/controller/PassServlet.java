package controller;

import dao.*;
import javax.servlet.http.HttpServlet;
import model.*;
import java.io.ByteArrayOutputStream;
import java.io.IOException;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.*;

/**
 * Class that handles the user's request to purchase a pass.
 *  
 * @author matte
 */
public class PassServlet extends HttpServlet {

	/**
	 * Method that instantiates an object of the Pass class,
	 * stores it in the database using the addPass method,
	 * generates a receipt in PDF format and returns it to the user.
	 *
	 * @param req the request
	 * @param res2 the response
	 */
	public void service(HttpServletRequest req, HttpServletResponse res2) {
		try {
			String firstName = (String) req.getSession().getAttribute("firstName");
			String lastName = (String) req.getSession().getAttribute("lastName");
			String duration = (String) req.getSession().getAttribute("duration");
			double price = (Double) req.getSession().getAttribute("price");
			DaoFactory dao = DaoFactory.getInstance();
			DaoPurchase daop = dao.getDaoPurchase();
			
			Pass pass1 = new Pass(Duration.ANNUAL, firstName, lastName);
			
			if(duration.equals("SETTIMANALE")) {
				pass1 = new Pass(Duration.WEEKLY, firstName, lastName);
			} else if(duration.equals("MENSILE")) {
				pass1= new Pass(Duration.MONTHLY, firstName, lastName);
			}

			daop.addPass(pass1);
			res2.setContentType("application/pdF;charset=UTF-8");
			res2.addHeader("Content-Disposition","inline; filename"+"biglietto.pdf");
			pass1.setPrice(price);
			Receipt receipt = new Receipt();
			ServletOutputStream out = res2.getOutputStream();
			ByteArrayOutputStream baos = receipt.generatePass(pass1);
			baos.writeTo(out);
		} catch (IOException  e) {
			e.printStackTrace();
		}
	}
}