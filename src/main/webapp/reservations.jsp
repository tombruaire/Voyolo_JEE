<div class="container mt-5">
	<div class="row d-flex justify-content-center">
		<div class="col-auto">
			<h2 class="text-center" style="color: #000000;">Gestion des réservations</h2>
		</div>
	</div>
</div>

<%

	Reservations laReservation = null;
	
	if (request.getParameter("action") != null && request.getParameter("idreservation") != null) {
		String action = request.getParameter("action");
		int idreservation = Integer.parseInt(request.getParameter("idreservation"));
		switch (action) {
		case "sup":
			Controleur.deleteReservation(idreservation);
			response.sendRedirect("index.jsp?page=12");
			break;
		case "edit": laReservation = Controleur.selectWhereReservation(idreservation); break;
		}
	}
	
	ArrayList<Users> lesUsersReservations = Controleur.selectAllUsers();
	ArrayList<VTrains> lesTrainsReservations = Controleur.selectAllTrainsSelect();
%>

<%@ include file="vue/vue_insert_reservation.jsp"%>

<%
	if (request.getParameter("Ajouter") != null) {
	
		String statut_reservation = request.getParameter("statut_reservation");
		int nbpersonne = Integer.parseInt(request.getParameter("nbpersonne"));
		int idu = Integer.parseInt(request.getParameter("idu"));
		int numtrain = Integer.parseInt(request.getParameter("numtrain"));
		
		Reservations uneReservation = new Reservations (statut_reservation, nbpersonne, idu, numtrain);
	
		Controleur.insertReservation(uneReservation);
	
		response.sendRedirect("index.jsp?page=12");
	}
	
	if (request.getParameter("Modifier") != null) {
	
		String statut_reservation = request.getParameter("statut_reservation");
		int nbpersonne = Integer.parseInt(request.getParameter("nbpersonne"));
		int idu = Integer.parseInt(request.getParameter("idu"));
		int numtrain = Integer.parseInt(request.getParameter("numtrain"));
	
		int idreservation = Integer.parseInt(request.getParameter("idreservation"));
	
		Reservations uneReservation = new Reservations (idreservation, statut_reservation, nbpersonne, idu, numtrain);
	
		Controleur.updateReservation(uneReservation);
	
		response.sendRedirect("index.jsp?page=12");
	}
	
	if (request.getParameter("deleteAll") != null) {
		Controleur.deleteAllReservations();
	}
	
	ArrayList<VReservations> lesReservations = Controleur.selectAllReservations();
%>

<% if (laReservation == null) { %>
<%@ include file="vue/vue_les_reservations.jsp"%>
<% } %>


