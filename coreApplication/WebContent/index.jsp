<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<link rel="stylesheet" href="${pageContext.request.contextPath}/styleSheets/main.css" type="text/css"/>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>James Beringer | Welcome!</title>
</head>
<body>
<div class="banner">
	<h1><span id="name"><span class="initial">J</span>ames <span class="initial">W</span>illiam <span class="initial">B</span>eringer</span></h1>
	<hr></hr>
	<ul class="mainNav">
		<span>
			<li><a id = "selected" href="#">Home</a></li>
			<li><a href="${pageContext.request.contextPath}/bio.jsp">Bio</a></li>
			<li><a href="${pageContext.request.contextPath}/resume.jsp">Resume</a></li>
			<li><a href="${pageContext.request.contextPath}/contact.jsp">Contact</a></li>
		</span>
	</ul>
</div>
<div id="content">
	<p>
		Thank you for visiting my site! Feel free to check out my <a href="${pageContext.request.contextPath}/bio.jsp">bio</a> or look at my <a href="${pageContext.request.contextPath}/resume.jsp">resume</a>.  If you have any questions, please feel free to contact me!
	</p>
</div>
</body>
</html>