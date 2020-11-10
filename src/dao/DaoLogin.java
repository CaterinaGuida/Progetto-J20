package dao;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

/**
 * Class that accesses the database to check the identity of an inspector.
 * 
 * @author matte
 */
public class DaoLogin {

	private DaoFactory Dao;

	/**
	 * Instantiates a new dao login.
	 *
	 * @param Dao the dao
	 */
	public DaoLogin(DaoFactory Dao) {
		super();
		this.Dao = Dao;
	}
	
	/**
	 * Method that manages the login.
	 *
	 * @param username the username
	 * @param password the password
	 * @return true, if successful
	 */
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