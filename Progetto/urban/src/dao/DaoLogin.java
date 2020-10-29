/* CLASSE CHE ACCEDE AL DATABASE PER VERIFICARE L'IDENTITA' DI UN CONTROLLORE */

package dao;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class DaoLogin {

	private DaoFactory Dao;

	public DaoLogin(DaoFactory Dao) {
		super();
		this.Dao = Dao;
	}
	
	public boolean login(String username, String password) {
		Connection con;
		try {
			con = Dao.getConnection();
			Statement st = con.createStatement();
			String query = String.format("select count(*) as number from inspectors where username = '%s'", username); 
			ResultSet res1 = st.executeQuery(query);
			int number = 0;
			while(res1.next()) {
				number = res1.getInt("number");
			}
			if (number > 0) {
				query = String.format("select * from inspectors where username = '%s'", username); 
				res1 = st.executeQuery(query);
				while(res1.next()) {
					String pwd = res1.getString("password");
					if(pwd.equals(password)) {
						return true;
					}
					return false;
				}
			}
		}
		catch(SQLException e) {
			e.printStackTrace();
		}
		return false;
	}
}