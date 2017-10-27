<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">

<link rel="stylesheet" href="${pageContext.request.contextPath}/styleSheets/main.css"  type="text/css" media="all"/>
<link rel="stylesheet" href="${pageContext.request.contextPath}/styleSheets/bootstrap.css"  type="text/css" media="all"/>

<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title>James Beringer | Resume</title>
</head>
<body>
<div class="container">
	<h1 id="name">James William Beringer</h1>
</div>
<div class = "container mainNav">
	<ul class="list-group">
		<li class="list-group-item"><a href="${pageContext.request.contextPath}/index.jsp">Home</a></li>
		<li class="list-group-item"><a href="${pageContext.request.contextPath}/bio.jsp">Bio</a></li>
		<li class="list-group-item disabled"><a href="#">Resume</a></li>
		<li class="list-group-item"><a href="${pageContext.request.contextPath}/contact.jsp">Contact</a></li>
	</ul>
</div>
<div class = "container content">
	<p>
	<a href="${pageContext.request.contextPath}/Resources/Resume041317.pdf">Official Printable Resume</a>
	</p>
</div>
<!-- <iframe id="resume" src="https://docs.google.com/viewer?srcid=0B7lPGxCWn96Dbk1DaEZORFBpb28&pid=explorer&efh=false&a=v&chrome=false&embedded=true" width="580px" height="480px"></iframe> -->
<!-- 
<center>
	<embed id="resume" src="${pageContext.request.contextPath}/Resources/Resume041317.pdf" type="application/pdf"/>
</center>
 -->
</body>
</html>