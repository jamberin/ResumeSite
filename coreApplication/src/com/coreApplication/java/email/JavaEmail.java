package com.coreApplication.java.email;

import java.io.BufferedReader;
import java.io.FileReader;
import java.io.IOException;

import java.io.File;
import java.util.Properties;

import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.AddressException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

import com.coreApplication.java.Props.GetProperties;
import com.coreApplication.java.logger.DefaultLogger;
import com.coreApplication.java.SQL.ContactController;
import com.coreApplication.java.SQL.EmailAudit;

public class JavaEmail {

	Properties emailProperties;
	Session mailSession;
	MimeMessage emailMessage;

	String emailHost = "smtp.gmail.com";
	String emailPort = "587";// gmail's SMTP port
	String fromUser = "beringer.tech@gmail.com";// your GMAIL id
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
			emailMessage.setContent(body, "text/html");// for a HTML email
			// emailMessage.setText(emailBody);// for a text email
		} catch (AddressException e) { 
			DefaultLogger.logMsg("[JavaEmail.java] Error at createEmailMessage | AddressException: " + e.getMessage(), "ERROR");
		} catch (MessagingException e) {
			DefaultLogger.logMsg("[JavaEmail.java] Error at createEmailMessage | MessagingException: " + e.getMessage(), "ERROR");
		}
	}
	
	public Boolean contactFormAction(String name, String email, String phone, String message, String emailBody) {
		Boolean chk = replyUtility(email);
		if (chk == true) {
			String subject = "Someone contacted you! FROM: " +  email;
			String[] toLine = { "jamberin@gmail.com" };
			createEmailMessage(emailBody, subject, toLine);
			replyUtility(email);
			EmailAudit.writeRecord(name,email,message,phone);
			return chk;
		} else {
			DefaultLogger.logMsg("[JavaEmail.java] Error at sendEmail | Bad String Entered ", "WARN");
			return chk;
		}
	}
	
	private Boolean replyUtility(String email) {
		Boolean validate = checkEmail(email);
		if (validate == true) {
			Boolean chk = ContactController.permissionCheck(email);
			String[] toLine = { email };
			String body;
			String subj;
			if (chk == true) {
				body = getEmailBody(GetProperties.getEmailTemplatePath("ContactConfirmation"));
				subj = "We've got your message!";
			} else if (chk == false) {
				body = getEmailBody(GetProperties.getEmailTemplatePath("ContactViolation"));
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
				DefaultLogger.logMsg("[JavaEmail.java] Error at replyUtility | MessagingException: " + e.getMessage(), "ERR");
			}
			return chk;
		} else {
			return validate;
		}
		
	}
	
	private Boolean checkEmail(String email) {
		boolean chk = true;
		try {
			InternetAddress emailAddr = new InternetAddress(email);
			emailAddr.validate();
		} catch (AddressException e) {
			chk = false;
			DefaultLogger.logMsg("[JavaEmail.java] Warning at checkEmail | AddressException: " + e.getMessage(), "WARN");
		}
		return chk;
	}
	
	private String getEmailBody(String filePath) {		
		StringBuilder contentBuilder = new StringBuilder();
		File file = new File(filePath);
		
		try {
			FileReader reader = new FileReader(file);
			BufferedReader in = new BufferedReader(reader);
			String str;
			while ((str = in.readLine()) != null) {
				contentBuilder.append(str);
			}
			in.close();
		} catch (IOException e) {
			DefaultLogger.logMsg("[JavaEmail.java] Error at getEmailBody: " + e.getMessage(), "ERR");
		}
		String content = contentBuilder.toString();
		return content;
	}

	public void sendEmail() throws MessagingException{
		try {
			Transport transport = mailSession.getTransport("smtp");
			transport.connect(emailHost, fromUser, fromUserEmailPassword);
			transport.sendMessage(emailMessage, emailMessage.getAllRecipients());
			transport.close();
		} catch (AddressException e) {
			DefaultLogger.logMsg("[JavaEmail.java] Error at sendEmail | AddressException: " + e.getMessage(), "ERROR");
		}
	}
}
