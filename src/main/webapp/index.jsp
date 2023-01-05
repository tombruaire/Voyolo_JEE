<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="controleur.*" %>
<%@ page import="java.util.ArrayList" %>
<%
	if (request.getParameter("Rechercher") != null) {
		if (!request.getParameter("table").equals("")) {
			String table = request.getParameter("table");
			if (table.equals("admins")) {
				out.print("<script language='javascript'>document.location.replace('index.jsp?page=2');</script>");
			} else if (table.equals("clients")) {
				out.print("<script language='javascript'>document.location.replace('index.jsp?page=3');</script>");
			} else if (table.equals("consommations")) {
				out.print("<script language='javascript'>document.location.replace('index.jsp?page=4');</script>");
			} else if (table.equals("energies")) {
				out.print("<script language='javascript'>document.location.replace('index.jsp?page=5');</script>");
			} else if (table.equals("enquetes")) {
				out.print("<script language='javascript'>document.location.replace('index.jsp?page=6');</script>");
			} else if (table.equals("films")) {
				out.print("<script language='javascript'>document.location.replace('index.jsp?page=7');</script>");
			} else if (table.equals("gares")) {
				out.print("<script language='javascript'>document.location.replace('index.jsp?page=8');</script>");
			} else if (table.equals("livres")) {
				out.print("<script language='javascript'>document.location.replace('index.jsp?page=9');</script>");
			} else if (table.equals("pays")) {
				out.print("<script language='javascript'>document.location.replace('index.jsp?page=10');</script>");
			} else if (table.equals("questions")) {
				out.print("<script language='javascript'>document.location.replace('index.jsp?page=11');</script>");
			} else if (table.equals("reservations")) {
				out.print("<script language='javascript'>document.location.replace('index.jsp?page=12');</script>");
			} else if (table.equals("trains")) {
				out.print("<script language='javascript'>document.location.replace('index.jsp?page=13');</script>");
			} else if (table.equals("trajets")) {
				out.print("<script language='javascript'>document.location.replace('index.jsp?page=14');</script>");
			} else if (table.equals("villes")) {
				out.print("<script language='javascript'>document.location.replace('index.jsp?page=15');</script>");
			} else {
				out.print("<script language='javascript'>document.location.replace('index.jsp');</script>");
			}
		} else {
			response.sendRedirect("index.jsp");
		}
	}
%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>VOYOLO</title>
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
	<script src="https://code.jquery.com/jquery-3.5.1.js"></script>
</head>
<body style="background-color: #90C97D;">

<div class="container mt-4">
	<div class="row d-flex justify-content-center">
		<div class="col-auto">
			<img src="images/logo.png" width="203" height="240" alt="">
		</div>
	</div>
</div>

<%

	Users userConnecte = null;
	if (request.getParameter("Connexion") != null) {
		String email = request.getParameter("email");
		String mdp = request.getParameter("mdp");
		
		userConnecte = Controleur.selectWhereUser(email, mdp);
		if (!email.equals("")) {
			if (!mdp.equals("")) {
				if (userConnecte == null)  { // Message Veuillez vérifier vos identifiants
					out.print("<div class='container mt-4'><div class='row d-flex justify-content-center'><div class='col-auto'><div class='alert alert-danger alert-dismissible' role='alert'><strong>Veuillez vérifier vos identifiants.</strong><button type='button' class='btn-close' data-bs-dismiss='alert' aria-label='Close'></button></div></div></div></div>");
				} else {
					session.setAttribute("idu", userConnecte.getIdu());
					session.setAttribute("nom", userConnecte.getNom());
					session.setAttribute("prenom", userConnecte.getPrenom());
					session.setAttribute("pseudo", userConnecte.getPseudo());
					session.setAttribute("email", userConnecte.getEmail());
					session.setAttribute("role", userConnecte.getRole());
				}
			} else {
				out.print("<div class='container mt-4'><div class='row d-flex justify-content-center'><div class='col-auto'><div class='alert alert-warning alert-dismissible' role='alert'><strong>Veuillez saisir un mot de passe.</strong><button type='button' class='btn-close' data-bs-dismiss='alert' aria-label='Close'></button></div></div></div></div>");
			}
		} else {
			out.print("<div class='container mt-4'><div class='row d-flex justify-content-center'><div class='col-auto'><div class='alert alert-warning alert-dismissible' role='alert'><strong>Veuillez saisir une adresse email.</strong><button type='button' class='btn-close' data-bs-dismiss='alert' aria-label='Close'></button></div></div></div></div>");
		}
	}
	
	if (session.getAttribute("email") != null) {

%>

<div class="container mt-4">
	<div class="row d-flex justify-content-center">
		<div class="col-auto">
			<a href="index.jsp?page=1">
				<img src="images/home.png" width="40" height="40" alt="">
			</a>
		</div>
		<div class="col-auto">
			<form method="post" action="" class="d-flex">
				<select name="table" class="form-select me-2">
					<option value="">Sélectionnez une table</option>
					<% 
						ArrayList<String> lesTables = Controleur.selectAllTables();
						String chaineTables = "";
						for (String uneTable : lesTables) {
							chaineTables += "<option value='"+uneTable+"'>";
							chaineTables += uneTable;
							chaineTables += "</option>";
						}
						out.print(chaineTables);
					%>
				</select>
				<button type="submit" name="Rechercher" class="btn" style="background-color: #9E10E1;">
					<svg xmlns="http://www.w3.org/2000/svg" width="30" height="30" fill="currentColor" class="bi bi-eye-fill" viewBox="0 0 16 16" style="color: #FFFFFF!important;">
  						<path d="M10.5 8a2.5 2.5 0 1 1-5 0 2.5 2.5 0 0 1 5 0z"/>
  						<path d="M0 8s3-5.5 8-5.5S16 8 16 8s-3 5.5-8 5.5S0 8 0 8zm8 3.5a3.5 3.5 0 1 0 0-7 3.5 3.5 0 0 0 0 7z"/>
					</svg>
				</button>
			</form>
		</div>
		<div class="col-auto">
			<a href="index.jsp?page=16">
				<svg xmlns="http://www.w3.org/2000/svg" width="45" height="45" fill="currentColor" class="bi bi-box-arrow-right" viewBox="0 0 16 16" style="color: #F60606;">
  					<path fill-rule="evenodd" d="M10 12.5a.5.5 0 0 1-.5.5h-8a.5.5 0 0 1-.5-.5v-9a.5.5 0 0 1 .5-.5h8a.5.5 0 0 1 .5.5v2a.5.5 0 0 0 1 0v-2A1.5 1.5 0 0 0 9.5 2h-8A1.5 1.5 0 0 0 0 3.5v9A1.5 1.5 0 0 0 1.5 14h8a1.5 1.5 0 0 0 1.5-1.5v-2a.5.5 0 0 0-1 0v2z"/>
  					<path fill-rule="evenodd" d="M15.854 8.354a.5.5 0 0 0 0-.708l-3-3a.5.5 0 0 0-.708.708L14.293 7.5H5.5a.5.5 0 0 0 0 1h8.793l-2.147 2.146a.5.5 0 0 0 .708.708l3-3z"/>
				</svg>
			</a>
		</div>
	</div>
</div>

<%
	int maPage = 1;
	if (request.getParameter("page") != null) {
		maPage = Integer.parseInt(request.getParameter("page"));
	} else {
		maPage = 1;
	}
	
	switch (maPage) {
		case 1 : %><%@ include file="home.jsp"  %><% break;
		case 2 : %><%@ include file="admins.jsp"  %><% break;
		case 3 : %><%@ include file="clients.jsp"  %><% break;
		case 4 : %><%@ include file="consommations.jsp"  %><% break;
		case 5 : %><%@ include file="energies.jsp"  %><% break;
		case 6 : %><%@ include file="enquetes.jsp"  %><% break;
		case 7 : %><%@ include file="films.jsp"  %><% break;
		case 8 : %><%@ include file="gares.jsp"  %><% break;
		case 9 : %><%@ include file="livres.jsp"  %><% break;
		case 10 : %><%@ include file="pays.jsp"  %><% break;
		case 11 : %><%@ include file="questions.jsp"  %><% break;
		case 12 : %><%@ include file="reservations.jsp"  %><% break;
		case 13 : %><%@ include file="trains.jsp"  %><% break;
		case 14 : %><%@ include file="trajets.jsp"  %><% break;
		case 15 : %><%@ include file="villes.jsp"  %><% break;
		case 16 : // Déconnexion
			session.invalidate();
			response.sendRedirect("index.jsp");
			break;
	}
	
	} else {
%>
	<%@ include file="vue/vue_connexion.jsp" %>
<% } %>

<br><br>

<div class="container mt-5 mb-5">
	<div class="row d-flex justify-content-center">
		<div class="card text-center" style="background-color: #D9D9D9;">
			<div class="card-header" style="background-color: #B9B9B9;">
				<h3 class="fw-bold">VOYOLO</h3>
			</div>
			<div class="card-body">
				<p class="card-text h5">
					Tom, Anais & Winnie - École IRIS Paris 75017 - 2022-2023
				</p>
			</div>
			<div class="card-footer" style="background-color: #4EA08D;">
				<p class="card-text text-light fw-bold h5">2022 &copy; VOYOLO Tous drois réservés</p>
			</div>
		</div>
	</div>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>

</body>
</html>