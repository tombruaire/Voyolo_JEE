<div class="container mt-5">
	<div class="row d-flex justify-content-center">
		<div class="col-auto">
			<h2 class="text-center" style="color: #000000;">Gestion des énergies consommées</h2>
		</div>
	</div>
</div>

<%

	Energies lEnergie = null;
	
	if (request.getParameter("action") != null && request.getParameter("idenergie") != null && request.getParameter("numtrain") != null) {
		String action = request.getParameter("action");
		int idenergie = Integer.parseInt(request.getParameter("idenergie"));
		int numtrain = Integer.parseInt(request.getParameter("numtrain"));
		switch (action) {
			case "sup" : 
				Controleur.deleteEnergie(idenergie, numtrain); 
				response.sendRedirect("index.jsp?page=5");
				break; 
			case "edit" : lEnergie = Controleur.selectWhereEnergie(idenergie, numtrain); break;
		}
	}
	
	ArrayList<VTrains> lesTrainsEnergies = Controleur.selectAllTrainsSelect();
%>

<%@ include file="vue/vue_insert_energies.jsp" %>

<%
	
	if (request.getParameter("Ajouter") != null) {
	
		int numtrain = Integer.parseInt(request.getParameter("numtrain"));
		int energie_consommee = Integer.parseInt(request.getParameter("energie_consommee"));
		
		Energies uneEnergie = new Energies (numtrain, energie_consommee);
		
		Controleur.insertEnergie(uneEnergie);
		
		response.sendRedirect("index.jsp?page=5");
	}

	if (request.getParameter("Modifier") != null) {
	
		int numtrain = Integer.parseInt(request.getParameter("numtrain"));
		int energie_consommee = Integer.parseInt(request.getParameter("energie_consommee"));
		
		int idenergie = Integer.parseInt(request.getParameter("idenergie"));
		
		Energies uneEnergie = new Energies (idenergie, numtrain, energie_consommee);
		
		Controleur.updateEnergie(uneEnergie);
		
		response.sendRedirect("index.jsp?page=5");
	}
	
	if (request.getParameter("deleteAll") != null) {
		Controleur.deleteAllEnergies();
	}


	ArrayList<VEnergies> lesEnergies = Controleur.selectAllEnergies();

%>

<% if (lEnergie == null) { %>
<%@ include file="vue/vue_les_energies.jsp" %>
<% } %>
