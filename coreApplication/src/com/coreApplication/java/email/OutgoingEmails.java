package com.coreApplication.java.email;

import java.util.Properties;

import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.AddressException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

import com.coreApplication.java.logger.DefaultLogger;
//import com.coreApplication.java.email.JavaEmail;
// Will need to clean up duplicate code to make this more versatile 

public class OutgoingEmails {
	Properties emailProperties;
	Session mailSession;
	MimeMessage emailMessage;

	String emailHost = "smtp.gmail.com";
	String emailPort = "587";// gmail's smtp port
	String fromUser = "beringer.tech@gmail.com";// your gmail id
	String fromUserEmailPassword = "beringerj1";
	String[] toEmails;

	public void setMailServerProperties() {
		emailProperties = System.getProperties();
		emailProperties.put("mail.smtp.port", emailPort);
		emailProperties.put("mail.smtp.auth", "true");
		emailProperties.put("mail.smtp.starttls.enable", "true");
		DefaultLogger.logMsg("Setting main server properties...", "INFO");
	}
	
	public void createEmail(String subject, String emailBody) throws AddressException, MessagingException {
		mailSession = Session.getDefaultInstance(emailProperties, null);
		emailMessage = new MimeMessage(mailSession);
		emailMessage.addRecipient(Message.RecipientType.BCC, new InternetAddress("jamberin@gmail.com"));
		for (int i = 0; i < toEmails.length; i++) {
			emailMessage.addRecipient(Message.RecipientType.TO, new InternetAddress(toEmails[i]));
		}
		emailMessage.setSubject(subject);
		emailMessage.setContent(emailBody, "text/html");
	}
	
	public void contactViolation(String email, String subject) {
		setMailServerProperties();
		try {
			createEmail(subject, null);
			//TODO: CREATE THE EMAIL TEMPLATE FOR CONTACT VIOLATION
			// DETERMINE IF IT IS POSSIBLE TO DO A REPLACEMENT ON THE SALUTATION
			sendEmail();
		} catch (AddressException e) {
			e.printStackTrace();
		} catch (MessagingException e) {
			e.printStackTrace();
		}
	}
	
	public void sendEmail() throws MessagingException{
		try {
			DefaultLogger.logMsg("Starting send email", "INFO");
			Transport transport = mailSession.getTransport("smtp");
			transport.connect(emailHost, fromUser, fromUserEmailPassword);
			transport.sendMessage(emailMessage, emailMessage.getAllRecipients());
			transport.close();
		} catch (AddressException e) {
			DefaultLogger.logMsg("JavaEmail.sendEmail() - AddressException: " + e.getMessage(), "ERROR");
		}
	}
}
