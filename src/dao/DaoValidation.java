package dao;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

/**
 * Class that accesses the database to check the validity of a travel document.
 * 
 * @author matte
 */
public class DaoValidation {

	private DaoFactory Dao;
	private SimpleDateFormat sdf = new SimpleDateFormat("dd/MM/yyyy HH:mm");

	/**
	 * Instantiates a new dao validation.
	 *
	 * @param Dao the dao
	 */
	public DaoValidation(DaoFactory Dao) {
		super();
		this.Dao = Dao;
	}
	
	/**
	 * Method that manages the validation.
	 *
	 * @param code the code
	 * @return the string[] containing the result of the validation
	 */
	public String[] validation(String code) {
		Connection con;
		try {
			con = Dao.getConnection();
			Statement st = con.createStatement();
			String query = String.format("select count(*) as number from purchased_travel_documents where code = '%s'", code); 
			ResultSet res1 = st.executeQuery(query);
			int number = 0;
			while(res1.next()) {
				number = res1.getInt("number");
			}
			if (number == 0) {
				String output[] = new String[2];
				output[0] = "Titolo non esistente";
				return output;
			} else {
				query = String.format("select * from purchased_travel_documents where code = '%s'", code);
				ResultSet res2 = st.executeQuery(query);
				String type = "";
				int tripsNum = 0;
				while(res2.next()) {
					type = res2.getString("type");
					if(type.equals("cumulative")) {
						tripsNum = res2.getInt("tripsNum");
					}
				}
				if(type.equals("single")) {
					query = String.format("select count(*) as number from activated_tickets where id = '%s'", code);
					ResultSet res3 = st.executeQuery(query);
					int number2 = 0;
					while(res3.next()) {
						number2 = res3.getInt("number");
					}
					if (number2 == 0) {		
						String output[] = new String[2];
						output[0] = "Titolo non attivato";
						output[1] = "Biglietto singolo";
						return output;
					} else {
						query = String.format("select * from activated_tickets where id = '%s'", code);
						res3 = st.executeQuery(query);
						Date date = null;
						while(res3.next()) {
							date = sdf.parse(res3.getString("expirationDate"));
							if(date.before(new Date())) {
								String output[] = new String[3];
								output[0] = "Titolo scaduto";
								output[1] = "Biglietto singolo";
								output[2] = sdf.format(date);
								return output;
							} else {
								String output[] = new String[3];
								output[0] = "Titolo valido";
								output[1] = "Biglietto singolo";
								output[2] = sdf.format(date);
								return output;
							}	
						}
					}
				} else if(type.equals("cumulative")) {
					query = String.format("select count(*) as number from activated_tickets where id = '%s'", code);
					ResultSet res3 = st.executeQuery(query);
					int leftTripsNumber = 0;
					int number2 = 0;
					while(res3.next()) {
						number2 = res3.getInt("number");
					}
					if (number2 == 0) {
						String output[] = new String[3];
						output[0] = "Titolo non attivato 2";
						output[1] = "Biglietto cumulativo";
						output[2] = "" + (tripsNum);
						return output;
					} else {
						query = String.format("select * from activated_tickets where id = '%s'", code);
						res3 = st.executeQuery(query);
						Date date = null;
						while(res3.next()) {
							date = sdf.parse(res3.getString("expirationDate"));
							leftTripsNumber = res3.getInt("leftTripsNumber");
							if(date.before(new Date()) && leftTripsNumber == 0) {
								String output[] = new String[3];
								output[0] = "Titolo scaduto 2";
								output[1] = "Biglietto cumulativo";
								output[2] = sdf.format(date);
								return output;
							} else if(date.before(new Date()) && leftTripsNumber > 0) {
								String output[] = new String[3];
								output[0] = "Titolo non attivato 2";
								output[1] = "Biglietto cumulativo";
								output[2] = "" + (leftTripsNumber);
								return output;
							} else if(date.after(new Date())) {
								String output[] = new String[4];
								output[0] = "Titolo attivato 2";
								output[1] = "Biglietto cumulativo";
								output[2] = sdf.format(date);
								output[3] = "" + (leftTripsNumber);
								return output;
							}
						}
					}
				} else if(type.equals("pass")) {
					query = String.format("select * from passes where id = '%s'", code);
					ResultSet res3 = st.executeQuery(query);
					Date date = null;
					while(res3.next()) {
						date = sdf.parse(res3.getString("expirationDate"));
						if(date.before(new Date())) {
							String output[] = new String[3];
							output[0] = "Titolo scaduto";
							output[1] = "Abbonamento";
							output[2] = sdf.format(date);
							return output;
						} else {
							String output[] = new String[3];
							output[0] = "Titolo valido";
							output[1] = "Abbonamento";
							output[2] = sdf.format(date);
							return output;
						}
					}
				}
			}
			return null;
		} catch (SQLException | ParseException e) {
			e.printStackTrace();
		}
		return null;
	}
}