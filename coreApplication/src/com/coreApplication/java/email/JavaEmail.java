package com.coreApplication.java.email;

import java.io.BufferedReader;
import java.io.FileReader;
import java.io.IOException;

import java.util.Properties;

import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.AddressException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

import com.coreApplication.java.SQL.EmailAudit;
import com.coreApplication.java.logger.DefaultLogger;
import com.coreApplication.java.SQL.ContactController;

public class JavaEmail {

	Properties emailProperties;
	Session mailSession;
	MimeMessage emailMessage;

	String emailHost = "smtp.gmail.com";
	String emailPort = "587";// gmail's smtp port
	String fromUser = "beringer.tech@gmail.com";// your gmail id
	String fromUserEmailPassword = "beringerj1";

	public void setMailServerProperties() {
		emailProperties = System.getProperties();
		emailProperties.put("mail.smtp.port", emailPort);
		emailProperties.put("mail.smtp.auth", "true");
		emailProperties.put("mail.smtp.starttls.enable", "true");
		DefaultLogger.logMsg("Setting main server properties...", "INFO");
	}

	protected void createEmailMessage(String body, String subject, String[] toLine) {
		try {
			mailSession = Session.getDefaultInstance(emailProperties, null);
			emailMessage = new MimeMessage(mailSession);
			for (int i = 0; i < toLine.length; i++) {
				emailMessage.addRecipient(Message.RecipientType.TO, new InternetAddress(toLine[i]));
			}
			emailMessage.setSubject(subject);
			emailMessage.setContent(body, "text/html");// for a html email
			// emailMessage.setText(emailBody);// for a text email
		} catch (AddressException e) { 
			DefaultLogger.logMsg("JavaEmail.createEmailMessage() - AddressException: " + e.getMessage(), "ERROR");
		} catch (MessagingException e) {
			DefaultLogger.logMsg("JavaEmail.createEmailMessage() - MessagingException: " + e.getMessage(), "ERROR");
		}
	}
	
	public void contactFormAction(String name, String email, String phone, String message, String emailBody) {
		Boolean chk = replyUtility(email);
		if (chk == true) {
			String subject = "Someone contacted you! FROM: " +  email;
			String[] toLine = { "jamberin@gmail.com" };
			EmailAudit.writeRecord(name,email,message,phone);
			createEmailMessage(emailBody, subject, toLine);
			replyUtility(email);
		} else {
			System.out.println("Contact permission denied...");
		}
	}
	
	private Boolean replyUtility(String email) {
		Boolean chk = ContactController.permissionCheck(email);
		String[] toLine = { email };
		String body;
		String subj;
		if (chk == true) {
			body = getEmailBody("EmailTemplates\\ContactConfirmation.html");
			subj = "We've got your message!";
		} else if (chk == false) {
			body = getEmailBody("EmailTemplates\\ContactViolation.html");
			subj = "Woah there! Looks like you're trying to contact too frequently...";
		} else {
			body = "An error has occurred trying to send the email! Please contact the system administrator by replying to this email!";
			subj = "WHOOPS!";
		}
		setMailServerProperties();
		createEmailMessage(body, subj, toLine);
		try	{
			sendEmail();
		} catch (MessagingException e) {
			e.printStackTrace();
			DefaultLogger.logMsg("JavaEmail.repUtility() - MessagingException: " + e.getMessage(), "ERR");
		}
		return chk;
	}
	
	private String getEmailBody(String filePath) {		
		StringBuilder contentBuilder = new StringBuilder();
		try {
			BufferedReader in = new BufferedReader(new FileReader(filePath));
			String str;
			while ((str = in.readLine()) != null) {
				contentBuilder.append(str);
			}
			in.close();
		} catch (IOException e) {
			DefaultLogger.logMsg("JavaEmail.getEmailBody() Error: " + e.getMessage(), "ERR");
		}
		String content = contentBuilder.toString();
		return content;
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
