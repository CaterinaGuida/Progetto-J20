/* CLASSE CHE ACCEDE AL DATABASE PER MEMORIZZARE L'ATTIVAZIONE DI UN TITOLO DI VIAGGIO */

package dao;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

public class DaoActivation {
	
	private DaoFactory Dao;
	private SimpleDateFormat sdf = new SimpleDateFormat("dd/MM/yyyy HH:mm");

	public DaoActivation(DaoFactory Dao) {
		super();
		this.Dao = Dao;
	}

	public String[] activation(String code) throws ParseException {
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
						Date date = new Date();
						date.setHours(date.getHours()+1);
						query = String.format("insert into activated_tickets(id, expirationDate, leftTripsNumber) values ('%s', '%s', 0)", code, sdf.format(date));
						st.executeUpdate(query);
						String output[] = new String[3];
						output[0] = "Titolo attivato";
						output[1] = "Biglietto singolo";
						output[2] = sdf.format(date);
						return output;
					} else {
						query = String.format("select * from activated_tickets where id = '%s'", code);
						res3 = st.executeQuery(query);
						Date date = null;
						while(res3.next()) {
							date = sdf.parse(res3.getString("expirationDate"));
							if(date.before(new Date())) {
								System.out.println("Il biglietto è scaduto.");
								String output[] = new String[3];
								output[0] = "Titolo scaduto";
								output[1] = "Biglietto singolo";
								output[2] = sdf.format(date);
								return output;
							} else {
								System.out.println("Il biglietto è stato attivato.");
								String output[] = new String[3];
								output[0] = "Titolo attivato";
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
						Date date = new Date();
						date.setHours(date.getHours()+1);
						query = String.format("insert into activated_tickets(id, expirationDate, leftTripsNumber) values ('%s', '%s', '%d')", code, sdf.format(date), tripsNum - 1);
						st.executeUpdate(query);
						String output[] = new String[4];
						output[0] = "Titolo attivato 2";
						output[1] = "Biglietto cumulativo";
						output[2] = sdf.format(date);
						output[3] = "" + (tripsNum - 1);
						return output;
					} else {
						System.out.println("Il biglietto è stato attivato.");
						query = String.format("select * from activated_tickets where id = '%s'", code);
						res3 = st.executeQuery(query);
						Date date = null;
						while(res3.next()) {
							date = sdf.parse(res3.getString("expirationDate"));
							leftTripsNumber = res3.getInt("leftTripsNumber");
							if(date.before(new Date()) && leftTripsNumber == 0) {
								String output[] = new String[3];
								output[0] = "Titolo scaduto";
								output[1] = "Biglietto cumulativo";
								output[2] = sdf.format(date);
								return output;
							} else if(date.before(new Date()) && leftTripsNumber > 0) {
								query = String.format("delete from activated_tickets where id = '%s'", code);
								st.executeUpdate(query);
								date = new Date();
								date.setHours(date.getHours()+1);
								query = String.format("insert into activated_tickets(id, expirationDate, leftTripsNumber) values ('%s', '%s', '%d')", code, sdf.format(date), leftTripsNumber - 1);
								st.executeUpdate(query);
								String output[] = new String[4];
								output[0] = "Titolo attivato 2";
								output[1] = "Biglietto cumulativo";
								output[2] = sdf.format(date);
								output[3] = "" + (leftTripsNumber - 1);
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
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
	}
}