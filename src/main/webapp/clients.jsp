<div class="container mt-5">
	<div class="row d-flex justify-content-center">
		<div class="col-auto">
			<h2 class="text-center" style="color: #000000;">Gestion des clients</h2>
		</div>
	</div>
</div>

<%

	Clients leClient = null;
	
	if (request.getParameter("action") != null && request.getParameter("idu") != null) {
		String action = request.getParameter("action");
		int idu = Integer.parseInt(request.getParameter("idu"));
		switch (action) {
			case "sup" : 
				Controleur.deleteClient(idu); 
				response.sendRedirect("index.jsp?page=3");
				break; 
			case "edit" : leClient = Controleur.selectWhereClient(idu); break;
		}
	}
%>

<%@ include file="vue/vue_insert_client.jsp" %>

<%
	
	if (request.getParameter("Ajouter") != null) {
	
		String nom = request.getParameter("nom");
		String prenom = request.getParameter("prenom");
		String pseudo = request.getParameter("pseudo");
		String email = request.getParameter("email");
		String mdp = request.getParameter("mdp");
		String role = request.getParameter("role");
		String date_naissance = request.getParameter("date_naissance");
		String tel = request.getParameter("tel");
		String adresse = request.getParameter("adresse");
		String carte_avantage = request.getParameter("carte_avantage");
		
		Clients unClient = new Clients (nom, prenom, pseudo, email, mdp, role, date_naissance, tel, adresse, carte_avantage);
		
		Controleur.insertClient(unClient);
		
		response.sendRedirect("index.jsp?page=3");
	}

	if (request.getParameter("Modifier") != null) {
	
		String nom = request.getParameter("nom");
		String prenom = request.getParameter("prenom");
		String pseudo = request.getParameter("pseudo");
		String email = request.getParameter("email");
		String mdp = request.getParameter("mdp");
		String role = request.getParameter("role");
		String date_naissance = request.getParameter("date_naissance");
		String tel = request.getParameter("tel");
		String adresse = request.getParameter("adresse");
		String carte_avantage = request.getParameter("carte_avantage");

		int idu = Integer.parseInt(request.getParameter("idu"));
		
		Clients unClient = new Clients (idu, nom, prenom, pseudo, email, mdp, role, date_naissance, tel, adresse, carte_avantage);
		
		Controleur.updateClient(unClient);
		
		response.sendRedirect("index.jsp?page=3");
	}
	
	if (request.getParameter("deleteAll") != null) {
		Controleur.deleteAllClients();
	}


	ArrayList<VClients> lesClients = Controleur.selectAllClients();

%>

<% if (leClient == null) { %>
<%@ include file="vue/vue_les_clients.jsp" %>
<% } %>