/* Questo test permette di verificare l'attivazione di un titolo di viaggio */

package testUnit;

import static org.junit.Assert.*;
import java.sql.*;
import java.text.ParseException;
import org.junit.Test;
import dao.*;
import model.*;

public class ActivationTest {
	
	@Test
	public void test() {
		DaoFactory dao = DaoFactory.getInstance();
		DaoPurchase daop = dao.getDaoPurchase();
		SingleTicket ticket = new SingleTicket();
		CumulativeTicket cumulative = new CumulativeTicket(5);
		String code1 = ticket.getTicketCode();
		String code2 = cumulative.getTicketCode();
		daop.addSingleTicket(ticket);
		daop.addCumulativeTicket(cumulative);
		Connection con;
		
		try {
			DaoActivation da = dao.getDaoActivation();
			assertEquals("Titolo non esistente", da.activation("lol")[0]);
			assertEquals("Titolo attivato", da.activation(code1)[0]);
			String output[] = da.activation(code2);
			assertEquals("Titolo attivato 2", output[0]);
			assertEquals(4,	Integer.parseInt(output[3]));
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
}