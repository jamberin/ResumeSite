<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import="com.coreApplication.java.email.JavaEmail"%>
<%@ page import="com.coreApplication.java.SQL.EmailAudit" %>
<%@ page import="com.coreApplication.java.logger.DefaultLogger" %>
<%@ page import="javax.mail.MessagingException"%>    
<%@ page import="java.sql.SQLException" %>
<%
	String message = null;
	String status = null;
	if (request.getParameter("submit") != null) {
		DefaultLogger.logMsg("Contact email sending...", "INF");
		String auditEmail = "";
		String auditMessage = "";
		String auditPhone = "";
		String auditName = "";
		JavaEmail javaEmail = new JavaEmail();
		javaEmail.setMailServerProperties();
		String emailSubject = "You've been contacted!";
		String emailBody = "";
		if (request.getParameter("name") != null) {
			auditName = request.getParameter("name");
			emailBody = "Sender Name: " + auditName + "<br>";
		}
		if (request.getParameter("email") != null) {
			auditEmail = request.getParameter("email");
			emailBody = emailBody + "Sender Email: " + auditEmail + "<br>";
		}
		if (request.getParameter("phone") != null) {
			auditPhone = request.getParameter("phone");
			emailBody = emailBody + "Sender Phone: " + auditPhone + "<br>";
		}
		if (request.getParameter("message") != null) {
			auditMessage = request.getParameter("message");
			emailBody = emailBody + "Message: " + auditMessage + "<br>";
		}
		
		javaEmail.createEmailMessage(emailSubject, emailBody);
		try {
			javaEmail.sendEmail();
			status = "success";
			message = "Email sent Successfully!";
		} catch (MessagingException me) {
			status = "error";
			message = "Error in Sending Email!";
			me.printStackTrace();
		}
	}
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
<link rel="stylesheet" href="${pageContext.request.contextPath}/styleSheets/contactForm.css" type="text/css"/>
<link rel="stylesheet" href="${pageContext.request.contextPath}/styleSheets/main.css"  type="text/css" media="all"/>
<link rel="stylesheet" href="${pageContext.request.contextPath}/styleSheets/bootstrap.css"  type="text/css" media="all"/>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title>James Beringer | Contact</title>
</head>
<body>
<div class="container">
	<h1 id="name">James William Beringer</h1>
</div>
<div class = "container mainNav">
	<ul class="list-group">
		<li class="list-group-item"><a href="${pageContext.request.contextPath}/index.jsp">Home</a></li>
		<li class="list-group-item"><a href="${pageContext.request.contextPath}/bio.jsp">Bio</a></li>
		<li class="list-group-item"><a href="${pageContext.request.contextPath}/resume.jsp">Resume</a></li>
		<li class="list-group-item disabled"><a href="#">Contact</a></li>
	</ul>
</div>
<div class = "contentContainer content">
	<h2>Contact Form</h2>
	<p>Send any comments, questions, or requests through here!</p>
	<div id = "message">
		<form id = "formContact" name = "formContact" action = "" method = "POST" novialdate = "novialdate">
			<div class = "label">Name:</div>
			<div class = "field">
				<input type = "text" id = "usr-name" name = "name" placeholder = "enter your name here" title = "Please enter your name" class = "required name" aria-required = "true" required />
			</div>
			<div class = "label">Email:</div>
			<div class = "field">
				<input type = "text" id = "usr-email" name = "email" placeholder = "enter your email address here" title = "Please enter your email address" class = "required email" aria-required = "true" required />
			</div>
			<div class = "label">Phone:</div>
			<div class = "field">
				<input type = "text" id = "usr-phone" name = "phone" placeholder = "enter your phone number here" title = "Please enter your phone number" class = "required phone" aria-required = "true" required />
			</div>
			<div class = "label">Message:</div>
			<div class = "field">
				<textarea id = "about-project" name = "message"	placeholder = "enter your message here"></textarea>
			</div>
			<div id = "mail-status"></div>
			<input type = "submit" name = "submit" value = "Send Message"	id = "send-message">
		</form>
	</div>
</div>
</body>
</html>