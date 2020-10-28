/* CLASSE CHE STABILISCE UNA CONNESSIONE CON IL DATABASE */

package dao;

import java.sql.*;

/**
 * classe che stabilisce una connessione con il database
 * @author mateo
 *
 */

public class DaoFactory {
	static DaoFactory instance;
	private String url;
	private String username;
	private String password;
	
	/**
	 * costruttore
	 * @param url url del database
	 * @param username
	 * @param password
	 */
	
	private DaoFactory(String url, String username, String password) {
		this.url = url;
		this.username = username;
		this.password = password;
	}
	
	/**
	 * @return un'istanza della DaoFactory
	 */
	
	public static synchronized DaoFactory getInstance() {
		instance = new DaoFactory("jdbc:mysql://localhost:3306/urban?autoReconnect=true&useSSL=false&useUnicode=true&useJDBCCompliantTimezoneShift=true&allowPublicKeyRetrieval=true&useLegacyDatetimeCode=false&serverTimezone=UTC", "root", "Mateodima7");
		return instance;
	}
	
	/**
	 * @return ritorna una connessione al database
	 * @throws SQLException
	 * @throws ClassNotFoundException 
	 */
	
	public Connection getConnection() throws SQLException {
		DriverManager.registerDriver(new com.mysql.cj.jdbc.Driver());
		return DriverManager.getConnection(url, username, password);
	}
	
	/**
	 * @return ritorna un'istanza della classe DaoRegistrator
	 */
	
	public DaoPurchase getDaoPurchase() {
		return new DaoPurchase(this);
	}

	public DaoActivation getDaoActivation() {
		return new DaoActivation(this);
	}
	
	public DaoLogin getDaoLogin() {
		return new DaoLogin(this);
	}
	
	public DaoValidation getDaoValidation() {
		return new DaoValidation(this);
	}
}