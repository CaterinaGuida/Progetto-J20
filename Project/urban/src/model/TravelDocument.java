package model;

import java.util.Date;
import java.util.Random;

public abstract class TravelDocument {
	protected String ticketCode;
	protected Date purchaseDate;
	protected Date expirationDate;
	protected double price;

	public TravelDocument() {
		this.ticketCode = this.codeGenerate();
		this.purchaseDate = new Date();
		this.expirationDate = null;
	}

	public Date getPurchaseDate() {
		return purchaseDate;
	}

	public Date getExpirationDate() {
		return expirationDate;
	}

	public String getTicketCode() {
		return ticketCode;
	}

	public void setTicketCode(String ticketCode) {
		this.ticketCode = ticketCode;
	}
	
	public double getPrice() {
		return price;
	}

	public void setPrice(double price) {
		this.price = price;
	}

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