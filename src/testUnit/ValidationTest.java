package testUnit;

import static org.junit.Assert.*;
import java.sql.*;
import java.text.ParseException;
import org.junit.Test;
import dao.*;
import model.*;

/**
 * Class that verifies the validation of a travel document.
 * 
 * @author matte
 */
public class ValidationTest {
	
	/**
	 * Test.
	 */
	@Test
	public void test() {
		DaoFactory dao = DaoFactory.getInstance();
		DaoPurchase daop = dao.getDaoPurchase();
		SingleTicket ticket = new SingleTicket();
		String code = ticket.getTicketCode();
		daop.addSingleTicket(ticket);
		Connection con;
		
		try {
			DaoValidation daov = dao.getDaoValidation();
			DaoActivation da = dao.getDaoActivation();
			assertEquals("Titolo non esistente", daov.validation("lol")[0]);
			assertEquals("Titolo non attivato", daov.validation(code)[0]);
			da.activation(code);
			assertEquals("Titolo valido", daov.validation(code)[0]);
		} catch (ParseException e) {
			e.printStackTrace();
		}	
	}
}