package model;

import java.io.FileNotFoundException;
import java.io.IOException;
import java.net.MalformedURLException;
import java.text.SimpleDateFormat;
import java.io.ByteArrayOutputStream;
import com.itextpdf.text.*;
import com.itextpdf.text.pdf.PdfWriter;

/**
 * Class that manages the receipts.
 * 
 * @author matte
 */
public class Receipt {

	private static Font catFont = new Font(Font.FontFamily.TIMES_ROMAN, 28, Font.BOLD);
	private static Font redFont = new Font(Font.FontFamily.TIMES_ROMAN, 12, Font.BOLD, BaseColor.RED);
	private static Font subFont = new Font(Font.FontFamily.TIMES_ROMAN, 16, Font.NORMAL);
	private static Font smallB = new Font(Font.FontFamily.TIMES_ROMAN, 12, Font.BOLD, BaseColor.BLACK);

	/** The path where is stored the file logo.png. */
	private String path = "C:\\Users\\matte\\eclipse-workspace\\Progetto-J20\\WebContent\\static\\logo.png";

	/**
	 * Instantiates a new receipt.
	 */
	public Receipt() {

	}

	/**
	 * Generate single ticket.
	 *
	 * @param travel the travel
	 * @return the byte array output stream
	 */
	public ByteArrayOutputStream generateSingleTicket(SingleTicket travel) {
		ByteArrayOutputStream bout = new ByteArrayOutputStream();
		try {
			SimpleDateFormat sdf = new SimpleDateFormat("dd/MM/yyyy");
			SimpleDateFormat sdf2 = new SimpleDateFormat("HH:mm:ss");
			Image image1 = Image.getInstance(path);
			image1.setAlignment(Element.ALIGN_JUSTIFIED);
			Document document = new Document();
			PdfWriter.getInstance(document, bout);
			document.open();
			document.add(image1);
			document.add(new Paragraph(""));
			document.add(new Paragraph(""));
			document.add(new Paragraph("BIGLIETTO SINGOLO", catFont));
			document.add(new Paragraph(" "));
			document.add(new Paragraph("Codice: \t" + travel.getTicketCode(), subFont));
			document.add(new Paragraph(""));
			document.add(new Paragraph("Data di acquisto: \t" + sdf.format(travel.purchaseDate), subFont));
			document.add(new Paragraph("Orario di acquisto: \t" + sdf2.format(travel.purchaseDate), subFont));
			document.add(new Paragraph("Prezzo: \t" + "1.5?", subFont));
			document.add(new Paragraph(" "));
			document.add(new Paragraph(" "));
			document.add(new Paragraph("Il presente biglietto ? valido un'ora dal momento dell'attivazione.", smallB));
			document.add(new Paragraph(" "));
			document.add(new Paragraph("Si ricorda che ? obbligatorio l'uso della mascherina a bordo!", redFont));
			document.close();
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (DocumentException e) {
			e.printStackTrace();
		} catch (MalformedURLException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		return bout;
	}

	/**
	 * Generate cumulative ticket.
	 *
	 * @param travel the travel
	 * @return the byte array output stream
	 */
	public ByteArrayOutputStream generateCumulativeTicket(CumulativeTicket travel) {
		ByteArrayOutputStream bout = new ByteArrayOutputStream();
		try {
			SimpleDateFormat sdf = new SimpleDateFormat("dd/MM/yyyy");
			SimpleDateFormat sdf2 = new SimpleDateFormat("HH:mm:ss");
			Image image1 = Image.getInstance(path);
			image1.setAlignment(Element.ALIGN_JUSTIFIED);
			Document document = new Document();
			PdfWriter.getInstance(document, bout);
			document.open();
			document.add(image1);
			document.add(new Paragraph(""));
			document.add(new Paragraph(""));
			document.add(new Paragraph("BIGLIETTO CUMULATIVO", catFont));
			document.add(new Paragraph(" "));
			document.add(new Paragraph("Codice: \t" + travel.getTicketCode(), subFont));
			document.add(new Paragraph(""));
			document.add(new Paragraph("Data di acquisto: \t" + sdf.format(travel.purchaseDate), subFont));
			document.add(new Paragraph("Orario di acquisto: \t" + sdf2.format(travel.purchaseDate), subFont));
			document.add(new Paragraph("Numero di viaggi disponibili: \t" + travel.getTripsNumber(), subFont));
			document.add(new Paragraph("Prezzo: \t" + travel.getPrice() + "?", subFont));
			document.add(new Paragraph(" "));
			document.add(new Paragraph("Il presente biglietto pu? essere attivato " + travel.getTripsNumber()
					+ " volte ed ? valido un'ora dal momento dell'attivazione.", smallB));
			document.add(new Paragraph(" "));
			document.add(new Paragraph("Si ricorda che ? obbligatorio l'uso della mascherina a bordo!", redFont));
			document.close();
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (DocumentException e) {
			e.printStackTrace();
		} catch (MalformedURLException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		return bout;
	}

	/**
	 * Generate pass.
	 *
	 * @param travel the travel
	 * @return the byte array output stream
	 */
	public ByteArrayOutputStream generatePass(Pass travel) {
		ByteArrayOutputStream bout = new ByteArrayOutputStream();
		try {
			SimpleDateFormat sdf = new SimpleDateFormat("dd/MM/yyyy");
			SimpleDateFormat sdf2 = new SimpleDateFormat("HH:mm:ss");
			Image image1 = Image.getInstance(path);
			image1.setAlignment(Element.ALIGN_JUSTIFIED);
			Document document = new Document();
			PdfWriter.getInstance(document, bout);
			document.open();
			document.add(image1);
			document.add(new Paragraph(""));
			document.add(new Paragraph(""));
			document.add(new Paragraph("ABBONAMENTO", catFont));
			document.add(new Paragraph(" "));
			document.add(new Paragraph("Codice: \t" + travel.getTicketCode(), subFont));
			document.add(new Paragraph(""));
			document.add(new Paragraph("Nome: \t" + travel.getFirstName(), subFont));
			document.add(new Paragraph("Cognome: \t" + travel.getLastName(), subFont));
			document.add(new Paragraph("Durata di validit?: \t" + travel.getDuration(), subFont));
			document.add(new Paragraph("Data di acquisto: \t" + sdf.format(travel.getPurchaseDate()), subFont));
			document.add(new Paragraph("Orario di acquisto: \t" + sdf2.format(travel.purchaseDate), subFont));
			document.add(new Paragraph("Scadenza: \t" + sdf.format(travel.getExpirationDate()), subFont));
			document.add(new Paragraph("Prezzo: \t" + travel.getPrice() + "?", subFont));
			document.add(new Paragraph(" "));
			document.add(new Paragraph(
					"Il presente abbonamento consente l'uso illimitato dei mezzi urbani per tutto il suo periodo di validit?.",
					smallB));
			document.add(new Paragraph(" "));
			document.add(new Paragraph("Si ricorda che ? obbligatorio l'uso della mascherina a bordo!", redFont));
			document.close();
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (DocumentException e) {
			e.printStackTrace();
		} catch (MalformedURLException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		return bout;
	}
}