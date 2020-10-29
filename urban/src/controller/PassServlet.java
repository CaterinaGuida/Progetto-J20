/* servlet che gestisce la richiesta di un abbonamento da parte di un utente.
 * Essa istanzia un oggetto della classe Abbonamento del package model.
 * Lo memorizza nel database utilizzando il metodo addPass della classe DaoRegister.
 * Poi genera una ricevuta nel formato pdf e la ritorna all'utente.
 */

package controller;

import dao.*;
import javax.servlet.http.HttpServlet;
import model.*;
import java.io.ByteArrayOutputStream;
import java.io.IOException;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.*;

public class PassServlet extends HttpServlet {

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
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
}