/* servlet che gestisce la richiesta di un biglietto singolo da parte di un utente.
 * Essa istanzia un oggetto della classe Biglietto del package model.
 * Lo memorizza nel database utilizzando il metodo addSingleTicket della classe DaoRegister.
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

public class SingleTicketServlet extends HttpServlet {

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
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
}