package model;

import java.util.Date;

public class Pass extends TravelDocument {
	private String firstName;
	private String lastName;
	private Duration duration;

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

	public String getFirstName() {
		return firstName;
	}

	public void setFirstName(String firstName) {
		this.firstName = firstName;
	}

	public String getLastName() {
		return lastName;
	}

	public void setLastName(String lastName) {
		this.lastName = lastName;
	}

	public Duration getDuration() {
		return duration;
	}

	public void setDuration(Duration duration) {
		this.duration = duration;
	}
}