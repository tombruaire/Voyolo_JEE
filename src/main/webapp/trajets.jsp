<div class="container mt-5">
	<div class="row d-flex justify-content-center">
		<div class="col-auto">
			<h2 class="text-center" style="color: #000000;">Gestion des trajets</h2>
		</div>
	</div>
</div>

<%

	Trajets leTrajet = null;
	
	if (request.getParameter("action") != null && request.getParameter("idtrajet") != null) {
		String action = request.getParameter("action");
		int idtrajet = Integer.parseInt(request.getParameter("idtrajet"));
		switch (action) {
		case "sup":
			Controleur.deleteTrajet(idtrajet);
			response.sendRedirect("index.jsp?page=14");
			break;
		case "edit": leTrajet = Controleur.selectWhereTrajet(idtrajet); break;
		}
	}
	
	ArrayList<VTrains> lesTrainsTrajets = Controleur.selectAllTrainsSelect();
	ArrayList<VGares> lesGaresTrajets = Controleur.selectAllGaresSelect();
%>

<%@ include file="vue/vue_insert_trajet.jsp"%>

<%
	if (request.getParameter("Ajouter") != null) {
		
		int numtrain = Integer.parseInt(request.getParameter("numtrain"));
		int idgare1 = Integer.parseInt(request.getParameter("idgare1"));
		String date_depart = request.getParameter("date_depart");
		String heure_depart = request.getParameter("heure_depart");
		int idgare2 = Integer.parseInt(request.getParameter("idgare2"));
		String date_arrivee = request.getParameter("date_arrivee");
		String heure_arrivee = request.getParameter("heure_arrivee");
		String duree = request.getParameter("duree");
		String prix = request.getParameter("prix");
		String quai = request.getParameter("quai");
	
		Trajets unTrajet = new Trajets (numtrain, idgare1, date_depart, heure_depart, idgare2, date_arrivee,
		heure_arrivee, duree, prix, quai);
	
		Controleur.insertTrajet(unTrajet);
	
		response.sendRedirect("index.jsp?page=14");
	}
	
	if (request.getParameter("Modifier") != null) {
	
		int numtrain = Integer.parseInt(request.getParameter("numtrain"));
		int idgare1 = Integer.parseInt(request.getParameter("idgare1"));
		String date_depart = request.getParameter("date_depart");
		String heure_depart = request.getParameter("heure_depart");
		int idgare2 = Integer.parseInt(request.getParameter("idgare2"));
		String date_arrivee = request.getParameter("date_arrivee");
		String heure_arrivee = request.getParameter("heure_arrivee");
		String duree = request.getParameter("duree");
		String prix = request.getParameter("prix");
		String quai = request.getParameter("quai");
	
		int idtrajet = Integer.parseInt(request.getParameter("idtrajet"));
	
		Trajets unTrajet = new Trajets (idtrajet, numtrain, idgare1, date_depart, heure_depart, idgare2, 
				date_arrivee, heure_arrivee, duree, prix, quai);
	
		Controleur.updateTrajet(unTrajet);
	
		response.sendRedirect("index.jsp?page=14");
	}
	
	if (request.getParameter("deleteAll") != null) {
		Controleur.deleteAllTrajets();
	}
	
	ArrayList<VTrajets> lesTrajets = Controleur.selectAllTrajets();
%>

<% if (leTrajet == null) { %>
<%@ include file="vue/vue_les_trajets.jsp"%>
<% } %>


