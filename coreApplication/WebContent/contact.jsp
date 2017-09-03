<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import="com.coreApplication.java.email.JavaEmail"%>
<%@ page import="javax.mail.MessagingException"%>    
<%
	String message = null;
	String status = null;
	if (request.getParameter("submit") != null) {
		JavaEmail javaEmail = new JavaEmail();
		javaEmail.setMailServerProperties();
		String emailSubject = "Contact Form using Java JSP GMail";
		String emailBody = "";
		if (request.getParameter("name") != null) {
			emailBody = "Sender Name: " + request.getParameter("name") + "<br>";
		}
		if (request.getParameter("email") != null) {
			emailBody = emailBody + "Sender Email: " + request.getParameter("email") + "<br>";
		}
		if (request.getParameter("phone") != null) {
			emailBody = emailBody + "Sender Phone: " + request.getParameter("phone") + "<br>";
		}
		if (request.getParameter("message") != null) {
			emailBody = emailBody + "Message: " + request.getParameter("message") + "<br>";
		}
		System.out.println("System sending email...");
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
<html>
<link rel="stylesheet" href="${pageContext.request.contextPath}/styleSheets/main.css" type="text/css"/>
<link rel="stylesheet" href="${pageContext.request.contextPath}/styleSheets/contactForm.css" type="text/css"/>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>James Beringer | Contact</title>
</head>
<body>
<div class="banner">
	<h1><span id="name"><span class="initial">J</span>ames <span class="initial">W</span>illiam <span class="initial">B</span>eringer</span></h1>
	<hr></hr>
	<ul class="mainNav">
		<span>
			<li><a href="${pageContext.request.contextPath}/index.jsp">Home</a></li>
			<li><a href = "${pageContext.request.contextPath}/bio.jsp">Bio</a></li>
			<li><a href = "${pageContext.request.contextPath}/resume.jsp">Resume</a></li>
			<li><a id = "selected" href = "#">Contact</a></li>
		</span>
	</ul>
</div>
<div id = "content">
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