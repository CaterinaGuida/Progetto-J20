package dao;

import java.sql.*;

/**
 * class that establishes a connection with the database
 *
 * @author mateo
 */

public class DaoFactory {
	
	/** The instance */
	static DaoFactory instance;
	
	/** The url */
	private String url;
	
	/** The username */
	private String username;
	
	/** The password */
	private String password;
	
	/**
	 * Instantiates a new dao factory
	 *
	 * @param url the url
	 * @param username the username
	 * @param password the password
	 */
	private DaoFactory(String url, String username, String password) {
		this.url = url;
		this.username = username;
		this.password = password;
	}
	
	/**
	 * Gets the single instance of DaoFactory
	 *
	 * @return single instance of DaoFactory
	 */
	public static synchronized DaoFactory getInstance() {
		instance = new DaoFactory("jdbc:mysql://localhost:3306/urban?autoReconnect=true&useSSL=false&useUnicode=true&useJDBCCompliantTimezoneShift=true&allowPublicKeyRetrieval=true&useLegacyDatetimeCode=false&serverTimezone=UTC", "root", "Mateodima7");
		return instance;
	}
	
	/**
	 * Gets the connection
	 *
	 * @return the connection
	 * @throws SQLException the SQL exception
	 */
	public Connection getConnection() throws SQLException {
		DriverManager.registerDriver(new com.mysql.cj.jdbc.Driver());
		return DriverManager.getConnection(url, username, password);
	}
	
	
	/**
	 * Gets the dao purchase
	 *
	 * @return the dao purchase
	 */
	public DaoPurchase getDaoPurchase() {
		return new DaoPurchase(this);
	}

	/**
	 * Gets the dao activation
	 *
	 * @return an instance of DaoActivation
	 */
	public DaoActivation getDaoActivation() {
		return new DaoActivation(this);
	}
	
	/**
	 * Gets the dao login
	 * 
	 * @return an instance of DaoLogin
	 */
	public DaoLogin getDaoLogin() {
		return new DaoLogin(this);
	}
	
	/**
	 * Gets the dao validation
	 *
	 * @return an instance of DaoValidation
	 */
	public DaoValidation getDaoValidation() {
		return new DaoValidation(this);
	}
}