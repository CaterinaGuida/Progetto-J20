package model;

import java.util.Date;
import java.util.Random;

/**
 * Class that manages travel documents.
 * 
 * @author matte
 */
public abstract class TravelDocument {
	
	protected String ticketCode;
	protected Date purchaseDate;
	protected Date expirationDate;
	protected double price;

	/**
	 * Instantiates a new travel document.
	 */
	public TravelDocument() {
		this.ticketCode = this.codeGenerate();
		this.purchaseDate = new Date();
		this.expirationDate = null;
	}

	/**
	 * Gets the purchase date.
	 *
	 * @return the purchase date
	 */
	public Date getPurchaseDate() {
		return purchaseDate;
	}

	/**
	 * Gets the expiration date.
	 *
	 * @return the expiration date
	 */
	public Date getExpirationDate() {
		return expirationDate;
	}

	/**
	 * Gets the ticket code.
	 *
	 * @return the ticket code
	 */
	public String getTicketCode() {
		return ticketCode;
	}

	/**
	 * Sets the ticket code.
	 *
	 * @param ticketCode the new ticket code
	 */
	public void setTicketCode(String ticketCode) {
		this.ticketCode = ticketCode;
	}
	
	/**
	 * Gets the price.
	 *
	 * @return the price
	 */
	public double getPrice() {
		return price;
	}

	/**
	 * Sets the price.
	 *
	 * @param price the new price
	 */
	public void setPrice(double price) {
		this.price = price;
	}

	/**
	 * Code generation.
	 *
	 * @return the string with the code
	 */
	private String codeGenerate() {
		String alphabet = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ";
		Random random1 = new Random();
		int number = random1.nextInt(10000);
		Random random2 = new Random();
		String generatedCode = "";
		for(int i = 0; i < 5; i++) {
			int n = random2.nextInt(52);
			generatedCode = generatedCode + alphabet.charAt(n);
		}
		generatedCode = generatedCode + number;
		return generatedCode;
	}
}