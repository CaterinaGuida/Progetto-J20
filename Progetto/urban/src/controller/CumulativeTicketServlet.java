/* servlet che gestisce la richiesta di un biglietto cumulativo da parte di un utente.
 * Essa istanzia un oggetto della classe Cumulativo del package model.
 * Lo memorizza nel database utilizzando il metodo addCumulativeTicket della classe DaoRegister.
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

public class CumulativeTicketServlet extends HttpServlet {

		public void service(HttpServletRequest req, HttpServletResponse res2) {
			try {
				int tripsNum = (Integer) req.getSession().getAttribute("tripsNum");
				double price = (Double) req.getSession().getAttribute("price");
				res2.setContentType("application/pdF;charset=UTF-8");
				res2.addHeader("Content-Disposition","inline; filename"+"biglietto.pdf");
				DaoFactory dao = DaoFactory.getInstance();
				DaoPurchase daop = dao.getDaoPurchase();
				CumulativeTicket ticket = new CumulativeTicket(tripsNum);
				daop.addCumulativeTicket(ticket);
				ticket.setPrice(price);
				Receipt receipt = new Receipt();
				ServletOutputStream out = res2.getOutputStream();
				ByteArrayOutputStream baos = receipt.generateCumulativeTicket(ticket);
				baos.writeTo(out);
			} catch (IOException  e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
}