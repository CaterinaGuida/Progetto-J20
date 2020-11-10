package model;

import java.util.Date;

/**
 * Class that manages passes.
 */
public class Pass extends TravelDocument {
	
	private String firstName;
	private String lastName;
	private Duration duration;

	/**
	 * Instantiates a new pass.
	 *
	 * @param duration the duration
	 * @param firstName the first name
	 * @param lastName the last name
	 */
	public Pass(Duration duration, String firstName, String lastName) {
		super();
		this.firstName = firstName;
		this.lastName = lastName;
		this.duration = duration;
		this.expirationDate = (Date) this.purchaseDate.clone();
		
		if(duration == Duration.WEEKLY)
			this.expirationDate.setDate(this.purchaseDate.getDate()+7);
		
		if(duration == Duration.MONTHLY)
			this.expirationDate.setMonth(this.purchaseDate.getMonth()+1);
		
		if(duration == Duration.ANNUAL)
			this.expirationDate.setYear(this.purchaseDate.getYear()+1);
	}

	/**
	 * Gets the first name.
	 *
	 * @return the first name
	 */
	public String getFirstName() {
		return firstName;
	}

	/**
	 * Sets the first name.
	 *
	 * @param firstName the new first name
	 */
	public void setFirstName(String firstName) {
		this.firstName = firstName;
	}

	/**
	 * Gets the last name.
	 *
	 * @return the last name
	 */
	public String getLastName() {
		return lastName;
	}

	/**
	 * Sets the last name.
	 *
	 * @param lastName the new last name
	 */
	public void setLastName(String lastName) {
		this.lastName = lastName;
	}

	/**
	 * Gets the duration.
	 *
	 * @return the duration
	 */
	public Duration getDuration() {
		return duration;
	}

	/**
	 * Sets the duration.
	 *
	 * @param duration the new duration
	 */
	public void setDuration(Duration duration) {
		this.duration = duration;
	}
}