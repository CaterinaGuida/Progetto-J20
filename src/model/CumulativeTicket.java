package model;

/**
 * class that manages cumulative tickets
 * 
 * @author matte
 */
public class CumulativeTicket extends TravelDocument {
	
	private int tripsNumber;

	/**
	 * Instantiates a new cumulative ticket
	 *
	 * @param tripsNumber the trips number
	 */
	public CumulativeTicket(int tripsNumber) {
		super();
		this.tripsNumber = tripsNumber;
	}

	/**
	 * Gets the trips number
	 *
	 * @return the trips number
	 */
	public int getTripsNumber() {
		return tripsNumber;
	}

	/**
	 * Sets the trips number
	 *
	 * @param tripsNumber the new trips number
	 */
	public void setTripsNumber(int tripsNumber) {
		this.tripsNumber = tripsNumber;
	}
}