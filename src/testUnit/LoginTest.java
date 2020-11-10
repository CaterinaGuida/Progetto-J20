package testUnit;

import static org.junit.Assert.*;
import java.sql.*;
import org.junit.Test;
import dao.*;

/**
 * Class that verifies the inspector's autentication process.
 * 
 * @author matte
 */
public class LoginTest {
	
	/**
	 * Test.
	 */
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
			e.printStackTrace();
		}
	}
}