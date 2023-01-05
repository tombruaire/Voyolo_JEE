<div class="container mt-5">
	<div class="row d-flex justify-content-center">
		<div class="col-auto">
			<h2 class="text-center" style="color: #000000;">Gestion des villes</h2>
		</div>
	</div>
</div>

<%

	Villes laVille = null;
	
	if (request.getParameter("action") != null && request.getParameter("idville") != null) {
		String action = request.getParameter("action");
		int idville = Integer.parseInt(request.getParameter("idville"));
		switch (action) {
			case "sup" : 
				Controleur.deleteVille(idville); 
				response.sendRedirect("index.jsp?page=16");
				break; 
			case "edit" : laVille = Controleur.selectWhereVille(idville); break;
		}
	}
	
	ArrayList<Pays> lesPaysVilles = Controleur.selectAllPaysSelect();
%>

<%@ include file="vue/vue_insert_ville.jsp" %>

<%
	
	if (request.getParameter("Ajouter") != null) {
	
		String nomville = request.getParameter("nomville");
		int idpays = Integer.parseInt(request.getParameter("idpays"));
		
		Villes uneVille = new Villes (nomville, idpays);
		
		Controleur.insertVille(uneVille);
		
		response.sendRedirect("index.jsp?page=16");
	}

	if (request.getParameter("Modifier") != null) {
	
		String nomville = request.getParameter("nomville");
		int idpays = Integer.parseInt(request.getParameter("idpays"));
		
		int idville = Integer.parseInt(request.getParameter("idville"));
		
		Villes uneVille = new Villes (idville, nomville, idpays);
		
		Controleur.updateVille(uneVille);
		
		response.sendRedirect("index.jsp?page=16");
	}
	
	if (request.getParameter("deleteAll") != null) {
		Controleur.deleteAllVilles();
	}


	ArrayList<VVilles> lesVilles = Controleur.selectAllVilles();

%>

<% if (laVille == null) { %>
<%@ include file="vue/vue_les_villes.jsp" %>
<% } %>
