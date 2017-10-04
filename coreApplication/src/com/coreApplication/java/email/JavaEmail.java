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

public class JavaEmail {

	Properties emailProperties;
	Session mailSession;
	MimeMessage emailMessage;

	String emailHost = "smtp.gmail.com";
	String emailPort = "587";// gmail's smtp port
	String fromUser = "beringer.tech@gmail.com";// your gmail id
	String fromUserEmailPassword = "beringerj1";
	String[] toEmails = { "jamberin@gmail.com" };

	public void setMailServerProperties() {
		emailProperties = System.getProperties();
		emailProperties.put("mail.smtp.port", emailPort);
		emailProperties.put("mail.smtp.auth", "true");
		emailProperties.put("mail.smtp.starttls.enable", "true");
		DefaultLogger.logMsg("Setting main server properties", "INFO");
	}

	public void createEmailMessage(String emailSubject, String emailBody) {
		try {
		mailSession = Session.getDefaultInstance(emailProperties, null);
		emailMessage = new MimeMessage(mailSession);
		for (int i = 0; i < toEmails.length; i++) {
			emailMessage.addRecipient(Message.RecipientType.TO,
					new InternetAddress(toEmails[i]));
		}
		emailMessage.setSubject(emailSubject);
		emailMessage.setContent(emailBody, "text/html");// for a html email
		// emailMessage.setText(emailBody);// for a text email
		} catch (AddressException e) { 
			DefaultLogger.logMsg("JavaEmail.sendEmail() - AddressException: " + e.getMessage(), "ERROR");
		} catch (MessagingException e) {
			DefaultLogger.logMsg("JavaEmail.sendEmail() - MessagingException: " + e.getMessage(), "ERROR");
		} finally {
			DefaultLogger.logMsg("Email message created", "INFO");
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
