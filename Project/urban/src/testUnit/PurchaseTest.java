/* Questo test permette di verificare la registrazione di un titolo di viaggio nel database */

package testUnit;

import static org.junit.Assert.*;
import java.sql.*;
import org.junit.Test;
import dao.*;
import model.*;

public class PurchaseTest {

	@Test
	public void test() {
		DaoFactory dao = DaoFactory.getInstance();
		DaoPurchase daop = dao.getDaoPurchase();
		SingleTicket ticket = new SingleTicket();
		String code = ticket.getTicketCode();
		daop.addSingleTicket(ticket);
		Connection con;
		
		try {
			con = dao.getConnection();
			String query = String.format("select count(*) as number from purchased_travel_documents where code = '%s'", code);
			Statement st = con.createStatement();
			ResultSet res1 = st.executeQuery(query);
			int number = 0;
			while(res1.next()) {
				number = res1.getInt("number");
			}
			query = String.format("delete from purchased_travel_documents where code = '%s'", code);
			st.executeUpdate(query);
			assertEquals(1, number);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
}