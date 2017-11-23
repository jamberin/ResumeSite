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
		boolean chk;
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
		
		chk = javaEmail.contactFormAction(name, email, phone, emailMessage, emailBody);
		if (chk == true) {
			try {
				javaEmail.sendEmail();
				status = "success";
				message = "Your message has been sent! I'll get back to you as soon as I can! Thanks! ";
			} catch (MessagingException me) {
				status = "error";
				message = "Something went wrong! Contact <a href='mailto:beringer.tech@gmail.com'>webmaster</a>.";
				me.printStackTrace();
			}
		} else {
			status = "error";
			message = "Something was entered incorrectly, please try again!";
			
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
	
	<script src="${pageContext.request.contextPath}/Resources/js/external/jquery/jquery.js"></script>
	<script src="${pageContext.request.contextPath}/Resources/js/bootstrap.min.js"></script>
	<script src="${pageContext.request.contextPath}/Resources/js/slide.js"></script>
</head>
<body>
<div class="navbar navbar-fixed-top">
	<div class="container-fluid">
		<div>
			<a class="navbar-brand" href="#">James William Beringer</a>
		</div>
		<ul class="navbar-nav">
			<li><a href="#home" class="btn">Home</a></li>
			<li><a href="#bio" class="btn">Bio</a></li>
			<li><a href="#resume" class="btn">Resume</a></li>
			<li><a href="#contact" class="btn">Contact</a></li>
		</ul>
		<div class="dropdown" style="display:none;">
			<button class="dropbtn">Select Page</button>
			<div class="dropdown-content">
				<a href="#home" class="btn">Home</a>
				<a href="#bio" class="btn">Bio</a>
				<a href="#resume" class="btn">Resume</a>
				<a href="#contact" class="btn">Contact</a>
			</div>
		</div>
	</div>	
</div>
<div id="home" class="home">
	<div class="text-vcenter">
		<h1>Welcome!</h1>
		<h3>This is the website subtitle</h3>
		<a href="#bio" class="btn btn-default btn-lg">Bio</a>
	</div>
</div>
<div id="bio">
	<div class="pageHead">
		<h2>Bio</h2>
		<h6>A little about me and my work...</h6>
	</div>
	<div class="contentContainer">
		<p class="content">
			For detailed breakdown of my skills, job experience, and education, please feel free to checkout my <a href="#resume">resume</a>!
			<br><br>
			It all started when I was first introduced to computers. It was in my uncle Jim's office, he had an older model Macintosh, I think it was a Power Macintosh.  I remember browsing the internet, just clicking on links, not really paying attention what I was doing or where I was going.  Just the changing of the pages magically going from one to the next. Over time that mysteriousness wore off and I became much more acclimated with computers. 
			<br><br>
			I was fortunate enough to go to an elementary school that had a classroom full of computers.  At least three times a week in my eight years leading up to high school I had exposure to technology.  All that time, I never lost interest, even as the intrigue became comprehension. Leading into high school I tried to keep my focus on computers.  Classes that gave exposure to computers, I was trying to take. This lead to me aiming my college goals toward computer engineering.
			<br><br>
			I was able to get into the engineering program at the University of Pittsburgh at Bradford after graduating from high school in 2010. After two and a half years into the program, I re-evaluated where I wanted my career to go and adjusted my major to Computer Information Systems & Technology (CIS&T). I later got my degree in 2015, immediately being placed at the help desk with WESCO Distribution's eCommerce team. After working as a Help Desk Analyst for two years, I applied for a Quality Assurance Analyst within the same team.  
			<br><br>
			I strive to continue gaining experience in different disciplines and learning as much as possible.		
		</p>
	</div>
	<div>
		<h6>And about my life...</h6>
	</div>
	<div class="contentContainer">
		<p class="content">
			After graduating from college, I came back to Pittsburgh to pursue my career.  I have been living in the SouthSide neighborhood of the city since 2015.  
			<br><br>
			Sometime after that, my girlfriend and I decided to expand our family, so we got a cat.  The slide show below shows our cat, Pearl!
		</p>
	</div>
	<div class="slideshow-container">
		<div class="mySlides" style="display:block;">
			<div class="numbertext">1 / 17</div>
			<img src="${pageContext.request.contextPath}/Resources/Cat/1.jpg">
			<div class="text">This is Pearl!</div>
		</div>
		<div class="mySlides">
			<div class="numbertext">2 / 17</div>
			<img src="${pageContext.request.contextPath}/Resources/Cat/2.jpg">
			<div class="text">She's a ferocious killing machine</div>
		</div>
		<div class="mySlides">
			<div class="numbertext">3 / 17</div>
			<img src="${pageContext.request.contextPath}/Resources/Cat/3.jpg">
			<div class="text">Sometimes she goes on adventures.  Here she is with Simone.</div>
		</div>
		<div class="mySlides">
			<div class="numbertext">4 / 17</div>
			<img src="${pageContext.request.contextPath}/Resources/Cat/4.jpg">
			<div class="text">"What mistakes have lead me to here?!" -Pearl</div>
		</div>
		<div class="mySlides">
			<div class="numbertext">5 / 17</div>
			<img src="${pageContext.request.contextPath}/Resources/Cat/5.jpg">
			<div class="text">Mostly, she likes to sleep.</div>
		</div>
		<div class="mySlides">
			<div class="numbertext">6 / 17</div>
			<img src="${pageContext.request.contextPath}/Resources/Cat/6.jpg">
			<div class="text">Particularly at anyone else's inconvenience.</div>
		</div>
		<div class="mySlides">
			<div class="numbertext">7 / 17</div>
			<img src="${pageContext.request.contextPath}/Resources/Cat/7.jpg">
			<div class="text">Which is almost always my inconvenience.</div>
		</div>
		<div class="mySlides">
			<div class="numbertext">8 / 17</div>
			<img src="${pageContext.request.contextPath}/Resources/Cat/8.jpg">
			<div class="text">It may be her favorite spot.</div>
		</div>
		<div class="mySlides">
			<div class="numbertext">9 / 17</div>
			<img src="${pageContext.request.contextPath}/Resources/Cat/9.jpg">
			<div class="text">I'm okay with that though</div>
		</div>
		<div class="mySlides">
			<div class="numbertext">10 / 17</div>
			<img src="${pageContext.request.contextPath}/Resources/Cat/10.jpg">
			<div class="text">Really though, she'll sleep anywhere.</div>
		</div>
		<div class="mySlides">
			<div class="numbertext">11 / 17</div>
			<img src="${pageContext.request.contextPath}/Resources/Cat/11.jpg">
			<div class="text">The purple blanket is her favorite...</div>
		</div>
		<div class="mySlides">
			<div class="numbertext">12 / 17</div>
			<img src="${pageContext.request.contextPath}/Resources/Cat/12.jpg">
			<div class="text">...along with bags.</div>
		</div>
		<div class="mySlides">
			<div class="numbertext">13 / 17</div>
			<img src="${pageContext.request.contextPath}/Resources/Cat/13.jpg">
			<div class="text">Anywhere she can sleep, she'll find.</div>
		</div>
		<div class="mySlides">
			<div class="numbertext">14 / 17</div>
			<img src="${pageContext.request.contextPath}/Resources/Cat/14.jpg">
			<div class="text">As long as you don't wake her up!</div>
		</div>
		<div class="mySlides">
			<div class="numbertext">15 / 17</div>
			<img src="${pageContext.request.contextPath}/Resources/Cat/15.jpg">
			<div class="text">Here she is plotting to kill me from across the room.</div>
		</div>
		<div class="mySlides">
			<div class="numbertext">16 / 17</div>
			<img src="${pageContext.request.contextPath}/Resources/Cat/16.jpg">
			<div class="text">I don't think she will though.</div>
		</div>
		<div class="mySlides">
			<div class="numbertext">17 / 17</div>
			<img src="${pageContext.request.contextPath}/Resources/Cat/17.jpg">
			<div class="text">Regal as ever!</div>
		</div>
	<a class="prev" onclick="plusSlides(-1)">&#10094;</a>
	<a class="next" onclick="plusSlides(1)">&#10095;</a>
	</div>
</div>
<div id="resume" class="pad-section">
	<div class="container">
		<div class="row">
			<div class="col-sm-6">
				<div class="panel panel-default shade">
					<div class="panel-heading">
						<h2 class="panel-title">Technical Proficiencies</h2>
					</div>
					<div class="panel-body lead">
					I've been focusing on honing in my usable skills in a range of different areas.  Some are below, but for a full list, please check my official resume:
					<ul>
						<li>Java Web Application Troubleshooting</li>
						<li>Basic Linux Server Configuration</li>
						<li>eCommerce Application Testing</li>
						<li>SSH Protocol</li>
						<li>.NET Application Development</li>
						<li>Java Application Development</li>
						<li>Basic SAP Hybris Management</li>
						<li>Ruby Automation Testing</li>
						<li>PowerShell Script Writing</li>
						<li>VB.NET Excel Macro Writing</li>
						<li>Git Version Control</li>
					</ul> 
					</div>
				</div>
			</div>
			<div class="col-sm-6">
				<div class="panel panel-default shade">
					<div class="panel-heading">
						<h2 class="panel-title">Professional Experience</h2>
					</div>
					<div class="panel-body lead">
					Through my career I've built my background while focusing on eCommerce. While aside from my internship, I've only worked for one company, I have been exposed to a number of different tools:
					<ul>
						<li>The Atlassian Suite</li>
						<li>Microsoft Office</li>
						<li>SAP Hybris Suit</li>
						<li>B2B and B2C eCommerce Systems</li>
						<li>RubyMine</li>
						<li>Eclipse</li>
						<li>VisualStudio</li>
						<li>Microsoft SQL Server</li>
						<li>Command Line</li>
					</ul>
					<br>
					I started on the eCommerce help desk but have worked my way to eComemrce Quality Assurance.  Currently I've been focusing on building my Ruby skills, but I really enjoy working on anything that is technically challenging.
					</div>
				</div>
			</div>
			<div class="text-vcenter" id="resumeLinks">
				<a href="${pageContext.request.contextPath}/Resources/Resume041317.pdf" target="_blank" class="btn btn-default btn-block">Official Resume Download</a>
				<a href="#contact" class="btn btn-default btn-block">Contact</a>
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
				<div>
				<%
					if (null != message) {
						out.println("<div class='" + status + "'>" + message + "</div>");
					}
				%>
				</div>
				<input type = "submit" name = "submit" value = "Send Message"	id = "send-message">
			</form>
		</div>
	</div>
	<div id="footer" class="container">
		<p class="contentContainer text-right">Copyright &copy; <a href="#home">James Beringer</a> 2017</p>
	</div>
</div>
</body>
</html>