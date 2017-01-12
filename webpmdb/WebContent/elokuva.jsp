<%@ page language="Java" import="jspPmdb.*,ht.kokoelma.*"
	session="true" autoFlush="true" isThreadSafe="true" 
	isErrorPage="false"%><!DOCTYPE html>
<html>
<title>PMDB:n jsp-versio - Elokuvan muokkaus</title>
<%
	Kokoelma kokoelma = PmdbBean.getKokoelma();
	boolean isOngelma = false;
	boolean isUusi = false;

	int eid = PmdbBean.getInt(request, "eid", -2);
	
	Elokuva elokuva = null;	
	
	try {
		if (eid >= 0) elokuva = kokoelma.getElokuva(eid);
	} catch (IndexOutOfBoundsException e) {
		%><p>Yritettiin hakea elokuvaa indeksillä jota ei ole</p><%
		eid = -2;
	}
	
	if (elokuva == null && "Tallenna".equals(request.getParameter("Tallenna"))){
		elokuva = new Elokuva();
		kokoelma.add(elokuva);
		eid = elokuva.getEid() - 1;
		isUusi = true;
	}		
	
	if ("Tallenna".equals(request.getParameter("Tallenna"))) {
				
		String ongelma = PmdbBean.tarkistaString(request, "nimi");
		if (ongelma != null) {
			isOngelma = true; 
			%><%=ongelma + " " %><%;
		}
		
		ongelma = PmdbBean.tarkistaString(request, "ohjaaja");
		if (ongelma != null) {
			isOngelma = true;
			%><%=ongelma + " " %><%;
		}		
		
		ongelma = PmdbBean.tarkistaString(request, "avainsanat");
		if (ongelma != null) {
			isOngelma = true;
			%><%=ongelma %><%;
		}
		
		if (!isOngelma) {
			elokuva.asetaTiedot("" + (eid + 1), request.getParameter("nimi"), 
					"" + PmdbBean.getInt(request, "vuosi", -2), 
					request.getParameter("avainsanat"));
			kokoelma.setHenkilo(request.getParameter("ohjaaja"), 
					elokuva.getEid(), 1);
			kokoelma.tallenna(kokoelma.getKokoelmanPolku());
		}
	}
	
	String nimi = "";
	String vuosi = "";
	String ohjaaja = "";
	String avainsanat = "";
	
	if (eid >= 0 && !isOngelma) {
		nimi = elokuva.getNimi();
		vuosi = "" + elokuva.getVuosi();
		ohjaaja = kokoelma.selvitaOhjaaja(kokoelma.getElokuva(eid));
		avainsanat = elokuva.getAvainsanat();
	} 
		
	if (isOngelma) {
		nimi = request.getParameter("nimi");
		vuosi = request.getParameter("vuosi");
		ohjaaja = request.getParameter("ohjaaja");
		avainsanat = request.getParameter("avainsanat");
		
		if (isUusi) {
			elokuva.asetaTiedot("" + (eid + 1), "nimetön", "" + 1895, "avainsanaton");
			kokoelma.setHenkilo("ohjaajaton", (eid + 1), 1);
		}
	}
%>

<h2>Elokuvaikkuna</h2>

<form action="elokuva.jsp?eid=<%=eid %>" method="post">

<table>
<tr>
<td>Nimi: </td>
<td><input name="nimi" value="<%=nimi %>" /></td>
</tr>

<tr>
<td>Ohjaaja: </td>
<td><input name="ohjaaja" value="<%=ohjaaja %>" /></td>
</tr>

<tr>
<td>Valmistumisvuosi: </td>
<td><input name="vuosi" value="<%=vuosi %>" /></td>
</tr>

<tr>
<td>Avainsanat: </td>
<td><input name="avainsanat" value="<%=avainsanat %>" /></td>
</tr>
</table>
<br />

<input type="submit" name="Tallenna" value="Tallenna" />
</form>

<p><a href="pmdb.jsp?eid=<%=eid %>">Takaisin etusivulle</a></p>

</html>