package model;

public class CumulativeTicket extends TravelDocument {
	
	private int tripsNumber;

	public CumulativeTicket(int tripsNumber) {
		super();
		this.tripsNumber = tripsNumber;
	}

	public int getTripsNumber() {
		return tripsNumber;
	}

	public void setTripsNumber(int tripsNumber) {
		this.tripsNumber = tripsNumber;
	}
}