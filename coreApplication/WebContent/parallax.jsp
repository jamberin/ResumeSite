<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import="com.coreApplication.java.email.JavaEmail"%>
<%@ page import="javax.mail.MessagingException"%>
<%
	String message = null;
	String status = null;
	if (request.getParameter("submit") != null) {
		JavaEmail javaEmail = new JavaEmail();
		javaEmail.setMailServerProperties();
		String name = "";
		String email = "";
		String phone = "";
		String emailMessage = "";
		String emailBody = "";
		if (request.getParameter("name") != null) {
			emailBody = "Sender Name: " + request.getParameter("name") + "<br>";
			name = request.getParameter("name");
		}
		if (request.getParameter("email") != null) {
			emailBody = emailBody + "Sender Email: " + request.getParameter("email") + "<br>";
			email = request.getParameter("email");
		}
		if (request.getParameter("phone") != null) {
			emailBody = emailBody + "Sender Phone: " + request.getParameter("phone") + "<br>";
			phone = request.getParameter("phone");
		}
		if (request.getParameter("message") != null) {
			emailBody = emailBody + "Message: " + request.getParameter("message") + "<br>";
			emailMessage = request.getParameter("message");
		}
		
		javaEmail.contactFormAction(name, email, phone, emailMessage, emailBody);
		
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
<head>
	<meta charset="utf-8"/>
	<meta name="James Beringer" content="Resume Site"/>
	<title>James Beringer | Welcome!</title>
	<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no"/>
	
	<link href="${pageContext.request.contextPath}/styleSheets/bootstrap.css" rel="stylesheet" />
	<link href="${pageContext.request.contextPath}/styleSheets/parallax.css" rel="stylesheet" />
	<link href="${pageContext.request.contextPath}/styleSheets/main.css" rel="stylesheet" />
	<link href="${pageContext.request.contextPath}/styleSheets/contactForm.css" rel="stylesheet" />
	
	<script src="${pageContext.request.contextPath}/Resources/js/external/jquery/jquery.js"></script>
	<script src="${pageContext.request.contextPath}/Resources/js/bootstrap.min.js"></script>
</head>
<body>
<nav class="navbar navbar-default navbar-fixed-top" role="navigation">
	<div class="container-fluid">
		<div class="navbar-header">
			<a class="navbar-brand" href="#">James William Beringer</a>
		</div>
		<div class="collapse navbar-collapse" id="navbar-collapse-main">
			<ul class="nav navbar-nav navbar-right">
				<li><a href="#home">Home</a></li>
				<li><a href="#bio">Bio</a></li>
				<li><a href="#resume">Resume</a></li>
				<li><a href="#contact">Contact</a></li>
			</ul>
		</div>
	</div>
</nav>
<div id="home" class="home">
	<div class="text-vcenter">
		<h1>Welcome!</h1>
		<h3>This is the website subtitle</h3>
		<a href="#bio" class="btn btn-default btn-lg">Dive in!</a>
	</div>
</div>
<div id="bio" class="pad-section">
	<div class="container">
			<div class="row">
				<div class="col-sm-6">
					<img src="${pageContext.request.contextPath}/Resources/logo.png" alt="" style="height:150px; width:150px;" />
					James William Beringer
				</div>
			<div class="col-sm-6 text-center">
				<h2>Bio</h2>
				<p class="lead">Constantly striving to better myself through innovative and strategic ideas.</p>
			</div>
		</div>
	</div>
</div>
<div id="resume" class="pad-section">
	<div class="container">
		<div class="row">
			<div class="col-sm-6">
				<div class="panel panel-default shade">
					<div class="panel-heading">
						<h2 class="panel-title">Additional information</h2>
					</div>
					<div class="panel-body lead">
					Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed hendrerit adipiscing blandit. Aliquam placerat, velit a fermentum fermentum, mi felis vehicula justo, a dapibus quam augue non massa. Duis euismod, augue et tempus consequat, lorem mauris porttitor quam, consequat ultricies mauris mi a metus. Phasellus congue, leo sed ultricies tristique, nunc libero tempor ligula, at varius mi nibh in nisi. Aliquam erat volutpat. Maecenas rhoncus, neque facilisis rhoncus tempus, elit ligula varius dui, quis amet.
					</div>
				</div>
			</div>
			<div class="col-sm-6">
				<div class="panel panel-default shade">
					<div class="panel-heading">
						<h2 class="panel-title">Additional information</h2>
					</div>
					<div class="panel-body lead">
					Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed hendrerit adipiscing blandit. Aliquam placerat, velit a fermentum fermentum, mi felis vehicula justo, a dapibus quam augue non massa. Duis euismod, augue et tempus consequat, lorem mauris porttitor quam, consequat ultricies mauris mi a metus. Phasellus congue, leo sed ultricies tristique, nunc libero tempor ligula, at varius mi nibh in nisi. Aliquam erat volutpat. Maecenas rhoncus, neque facilisis rhoncus tempus, elit ligula varius dui, quis amet.
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
<div id="contact" class="pad-section">
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
</div>
<!--TODO: CHECK OUT THE SITE BELOW TO FINISH THE PARALLAX DESGN
https://www.script-tutorials.com/bootstrap-one-page-template-with-parallax-effect/
 -->
</body>
</html>