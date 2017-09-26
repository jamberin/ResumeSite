<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
<link rel="stylesheet" href="${pageContext.request.contextPath}/styleSheets/main.css"  type="text/css" media="all"/>
<link rel="stylesheet" href="${pageContext.request.contextPath}/styleSheets/bootstrap.css"  type="text/css" media="all"/>

<script src="https://code.jquery.com/jquery-3.1.0.min.js"></script>
<script src="${pageContext.request.contextPath}/Resources/js/bootstrap.min.js"></script>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title>James Beringer | Welcome!</title>
</head>
<body>
<div class="container">
	<h1 id="name">James William Beringer</h1>
</div>
<div class = "container mainNav">
	<ul class="list-group">
			<li class="list-group-item disabled"><a href="#">Home</a></li>
			<li class="list-group-item"><a href="${pageContext.request.contextPath}/bio.jsp">Bio</a></li>
			<li class="list-group-item"><a href="${pageContext.request.contextPath}/resume.jsp">Resume</a></li>
			<li class="list-group-item"><a href="${pageContext.request.contextPath}/contact.jsp">Contact</a></li>
	</ul>
</div>
<div class="container content">
	<p>
		Thank you for visiting my site! Feel free to check out my <a href="${pageContext.request.contextPath}/bio.jsp">bio</a> or look at my <a href="${pageContext.request.contextPath}/resume.jsp">resume</a>.  If you have any questions, please feel free to contact me!
	</p>
</div>
</body>
</html>