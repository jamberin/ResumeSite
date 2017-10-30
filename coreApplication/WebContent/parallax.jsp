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
	
	<script src="${pageContext.request.contextPath}/Resources/js/external/jquery/jquery.js"></script>
	<script src="${pageContext.request.contextPath}/Resources/js/bootstrap.min.js"></script>
	<script src="${pageContext.request.contextPath}/Resources/js/slide.js"></script>
</head>
<body>
<nav class="navbar navbar-default navbar-fixed-top" role="navigation">
	<div class="container-fluid">
		<div class="navbar-header">
			<a class="navbar-brand" href="#">James William Beringer</a>
		</div>
		<ul class="nav navbar-nav">
			<li><a href="#home" class="btn">Home</a></li>
			<li><a href="#bio" class="btn">Bio</a></li>
			<li><a href="#resume" class="btn">Resume</a></li>
			<li><a href="#contact" class="btn">Contact</a></li>
		</ul>
	</div>	
</nav>
<div id="home" class="home">
	<div class="text-vcenter">
		<h1>Welcome!</h1>
		<h3>This is the website subtitle</h3>
		<a href="#bio" class="btn btn-default btn-lg">Bio</a>
	</div>
</div>
<div id="bio" class="pad-section">
	<div>
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
		<div class="mySlides fade">
			<div class="numbertext">1 / 17</div>
			<img src="${pageContext.request.contextPath}/Resources/Cat/1.jpg">
			<div class="text">This is Pearl!</div>
		</div>
		<div class="mySlides fade">
			<div class="numbertext">2 / 17</div>
			<img src="${pageContext.request.contextPath}/Resources/Cat/2.jpg">
			<div class="text">She's a ferocious killing machine</div>
		</div>
		<div class="mySlides fade">
			<div class="numbertext">3 / 17</div>
			<img src="${pageContext.request.contextPath}/Resources/Cat/3.jpg">
			<div class="text">Sometimes she goes on adventures.  Here she is with Simone.</div>
		</div>
		<div class="mySlides fade">
			<div class="numbertext">4 / 17</div>
			<img src="${pageContext.request.contextPath}/Resources/Cat/4.jpg">
			<div class="text">"What mistakes have lead me to here?!" -Pearl</div>
		</div>
		<div class="mySlides fade">
			<div class="numbertext">5 / 17</div>
			<img src="${pageContext.request.contextPath}/Resources/Cat/5.jpg">
			<div class="text">Mostly, she likes to sleep.</div>
		</div>
		<div class="mySlides fade">
			<div class="numbertext">6 / 17</div>
			<img src="${pageContext.request.contextPath}/Resources/Cat/6.jpg">
			<div class="text">Particularly at anyone else's inconvenience.</div>
		</div>
		<div class="mySlides fade">
			<div class="numbertext">7 / 17</div>
			<img src="${pageContext.request.contextPath}/Resources/Cat/7.jpg">
			<div class="text">Which is almost always my inconvenience.</div>
		</div>
		<div class="mySlides fade">
			<div class="numbertext">8 / 17</div>
			<img src="${pageContext.request.contextPath}/Resources/Cat/8.jpg">
			<div class="text">It may be her favorite spot.</div>
		</div>
		<div class="mySlides fade">
			<div class="numbertext">9 / 17</div>
			<img src="${pageContext.request.contextPath}/Resources/Cat/9.jpg">
			<div class="text">I'm okay with that though</div>
		</div>
		<div class="mySlides fade">
			<div class="numbertext">10 / 17</div>
			<img src="${pageContext.request.contextPath}/Resources/Cat/10.jpg">
			<div class="text">Really though, she'll sleep anywhere.</div>
		</div>
		<div class="mySlides fade">
			<div class="numbertext">11 / 17</div>
			<img src="${pageContext.request.contextPath}/Resources/Cat/11.jpg">
			<div class="text">The purple blanket is her favorite...</div>
		</div>
		<div class="mySlides fade">
			<div class="numbertext">12 / 17</div>
			<img src="${pageContext.request.contextPath}/Resources/Cat/12.jpg">
			<div class="text">...along with bags.</div>
		</div>
		<div class="mySlides fade">
			<div class="numbertext">13 / 17</div>
			<img src="${pageContext.request.contextPath}/Resources/Cat/13.jpg">
			<div class="text">Anywhere she can sleep, she'll find.</div>
		</div>
		<div class="mySlides fade">
			<div class="numbertext">14 / 17</div>
			<img src="${pageContext.request.contextPath}/Resources/Cat/14.jpg">
			<div class="text">As long as you don't wake her up!</div>
		</div>
		<div class="mySlides fade">
			<div class="numbertext">15 / 17</div>
			<img src="${pageContext.request.contextPath}/Resources/Cat/15.jpg">
			<div class="text">Here she is plotting to kill me from across the room.</div>
		</div>
		<div class="mySlides fade">
			<div class="numbertext">16 / 17</div>
			<img src="${pageContext.request.contextPath}/Resources/Cat/16.jpg">
			<div class="text">I don't think she will though.</div>
		</div>
		<div class="mySlides fade">
			<div class="numbertext">17 / 17</div>
			<img src="${pageContext.request.contextPath}/Resources/Cat/17.jpg">
			<div class="text">Regal as ever!</div>
		</div>
	<a class="prev" onclick="plusSlides(-1)">&#10094;</a>
	<a class="next" onclick="plusSlides(1)">&#10095;</a>
	</div>
	<div style="text-align:center">
		<span class="dot active" onclick="currentSlide(1)"></span>
		<span class="dot" onclick="currentSlide(2)"></span>
		<span class="dot" onclick="currentSlide(3)"></span>
		<span class="dot" onclick="currentSlide(4)"></span>
		<span class="dot" onclick="currentSlide(5)"></span>
		<span class="dot" onclick="currentSlide(6)"></span>
		<span class="dot" onclick="currentSlide(7)"></span>
		<span class="dot" onclick="currentSlide(8)"></span>
		<span class="dot" onclick="currentSlide(9)"></span>
		<span class="dot" onclick="currentSlide(10)"></span>
		<span class="dot" onclick="currentSlide(11)"></span>
		<span class="dot" onclick="currentSlide(12)"></span>
		<span class="dot" onclick="currentSlide(13)"></span>
		<span class="dot" onclick="currentSlide(14)"></span>
		<span class="dot" onclick="currentSlide(15)"></span>
		<span class="dot" onclick="currentSlide(16)"></span>
		<span class="dot" onclick="currentSlide(17)"></span>
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
			<div class="text-vcenter">
				<a href="#contact" class="btn btn-default btn-lg">Contact</a>
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
	<div id="footer" class="container">
		<p class="contentContainer text-right">Copyright &copy; <a href="#home">James Beringer</a> 2017</p>
	</div>
</div>
<!--TODO: CHECK OUT THE SITE BELOW TO FINISH THE PARALLAX DESGN
https://www.script-tutorials.com/bootstrap-one-page-template-with-parallax-effect/
 -->
</body>
</html>