<%@ page language="Java"
	import="jspPmdb.*,ht.kokoelma.*,java.util.*,  java.io.*"
	session="true" autoFlush="true" isThreadSafe="true" 
	isErrorPage="false"%><!DOCTYPE html>
<html>
<%
Kokoelma kokoelma = PmdbBean.getKokoelma();
%>
<head>
<title>PMDB:n jsp-versio</title>
</head>
<body>
<h1>
	Tallennuspolku:
	<%=kokoelma.getKokoelmanPolku()%>
</h1>
<h2>
	Elokuvia:
	<%=kokoelma.getElokuvienLkm()%></h2>
<ol>
	<%
	for (int i = 0; i < kokoelma.getElokuvienLkm(); i++) {
	%>
		<li>
		<%= kokoelma.getElokuva(i).getNimi() %> <a href="elokuva.jsp?eid=<%=i %>">muuta</a>
		</li>
		<%;
		}
		%>
</ol>

<form action="elokuva.jsp?eid=-2" method="post">
<input type="submit" name="Uusi" value="Uusi" />
</form>

</body>
</html>