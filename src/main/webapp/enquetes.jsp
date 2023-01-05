<div class="container mt-5">
	<div class="row d-flex justify-content-center">
		<div class="col-auto">
			<h2 class="text-center" style="color: #000000;">Gestion des enquêtes</h2>
		</div>
	</div>
</div>

<%

	Enquetes lEnquete = null;
	
	if (request.getParameter("action") != null && request.getParameter("idenquete") != null) {
		String action = request.getParameter("action");
		int idenquete = Integer.parseInt(request.getParameter("idenquete"));
		switch (action) {
			case "sup" : 
				Controleur.deleteEnquete(idenquete); 
				response.sendRedirect("index.jsp?page=6");
				break; 
			case "edit" : lEnquete = Controleur.selectWhereEnquete(idenquete); break;
		}
	}
%>

<%@ include file="vue/vue_insert_enquete.jsp" %>

<%
	
	if (request.getParameter("Ajouter") != null) {
	
		String nom_enquete = request.getParameter("nom_enquete");
		String description = request.getParameter("description");
		
		Enquetes uneEnquete = new Enquetes (nom_enquete, description);
		
		Controleur.insertEnquete(uneEnquete);
		
		response.sendRedirect("index.jsp?page=6");
	}

	if (request.getParameter("Modifier") != null) {
	
		String nom_enquete = request.getParameter("nom_enquete");
		String description = request.getParameter("description");
		
		int idenquete = Integer.parseInt(request.getParameter("idenquete"));
		
		Enquetes uneEnquete = new Enquetes (idenquete, nom_enquete, description);
		
		Controleur.updateEnquete(uneEnquete);
		
		response.sendRedirect("index.jsp?page=6");
	}
	
	if (request.getParameter("deleteAll") != null) {
		Controleur.deleteAllEnquetes();
	}


	ArrayList<VEnquetes> lesEnquetes = Controleur.selectAllEnquetes();

%>

<% if (lEnquete == null) { %>
<%@ include file="vue/vue_les_enquetes.jsp" %>
<% } %>
