/* Questo test permette di verificare il processo di authenticazione */

package testUnit;

import static org.junit.Assert.*;
import java.sql.*;
import org.junit.Test;
import dao.*;

public class LoginTest {
	
	@Test
	public void test() { 
		String username = "aoeojd";
		String password = "teue123444565322uie";
		DaoFactory dao = DaoFactory.getInstance();
		DaoLogin dl = dao.getDaoLogin();
		assertEquals(false, dl.login(username, password));
		Connection con;
		
		try {
			con = dao.getConnection();
			String query = String.format("insert into inspectors(username, password) values ('%s', '%s')", username, password);
			Statement st = con.createStatement();
			st.executeUpdate(query);
			assertEquals(true, dl.login(username, password));
			query = String.format("delete from inspectors where username = '%s'", username);
			st.executeUpdate(query);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
}