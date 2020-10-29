/* CLASSE CHE ACCEDE AL DATABASE PER MEMORIZZARE L'ACQUISTO DI UN TITOLO DI VIAGGIO */

package dao;

import java.sql.*;
import model.*;
import java.text.SimpleDateFormat;

public class DaoPurchase {
	
	private DaoFactory Dao;
	private SimpleDateFormat sdf = new SimpleDateFormat("dd/MM/yyyy HH:mm");

	public DaoPurchase(DaoFactory Dao) {
		super();
		this.Dao = Dao;
	}
	
	public void addSingleTicket(SingleTicket tic) {	
		try {
			Connection con = Dao.getConnection();
			Statement st = con.createStatement();
			String query = String.format("insert into purchased_travel_documents(code, type, purchaseDate) values ('%s', 'single', '%s')", tic.getTicketCode(), sdf.format(tic.getPurchaseDate()));
			st.executeUpdate(query);
			con.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	public void addCumulativeTicket(CumulativeTicket tic) {
		try {
			Connection con = Dao.getConnection();
			Statement st = con.createStatement();
			String query = String.format("insert into purchased_travel_documents(code, type, purchaseDate, tripsNum) values ('%s', 'cumulative', '%s', '%d')", tic.getTicketCode(), sdf.format(tic.getPurchaseDate()), tic.getTripsNumber());
			st.executeUpdate(query);
			con.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	public void addPass(Pass tic) {
		try {
			Connection con = Dao.getConnection();
			Statement st = con.createStatement();
			Statement st1 = con.createStatement();
			String query = String.format("insert into purchased_travel_documents(code, type, purchaseDate) values ('%s','pass','%s')", tic.getTicketCode(), sdf.format(tic.getPurchaseDate()));
			st.executeUpdate(query);
			String query1 = String.format("insert into passes(id, firstName, lastName, expirationDate, duration) values ('%s', '%s', '%s', '%s', '%s')", tic.getTicketCode(), tic.getFirstName(), tic.getLastName(), sdf.format(tic.getExpirationDate()), tic.getDuration().toString());
			st1.executeUpdate(query1);
			con.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
}