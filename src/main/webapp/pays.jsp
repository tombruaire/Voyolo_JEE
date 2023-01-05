<div class="container mt-5">
	<div class="row d-flex justify-content-center">
		<div class="col-auto">
			<h2 class="text-center" style="color: #000000;">Gestion des pays</h2>
		</div>
	</div>
</div>

<%

	Pays lePays = null;
	
	if (request.getParameter("action") != null && request.getParameter("idpays") != null) {
		String action = request.getParameter("action");
		int idpays = Integer.parseInt(request.getParameter("idpays"));
		switch (action) {
			case "sup" : 
				Controleur.deletePays(idpays); 
				response.sendRedirect("index.jsp?page=10");
				break; 
			case "edit" : lePays = Controleur.selectWherePays(idpays); break;
		}
	}
%>

<%@ include file="vue/vue_insert_pays.jsp" %>

<%
	
	if (request.getParameter("Ajouter") != null) {
	
		String nompays = request.getParameter("nompays");
		
		Pays unPays = new Pays (nompays);
		
		Controleur.insertPays(unPays);
		
		response.sendRedirect("index.jsp?page=10");
	}

	if (request.getParameter("Modifier") != null) {
	
		String nompays = request.getParameter("nompays");
		
		int idpays = Integer.parseInt(request.getParameter("idpays"));
		
		Pays unPays = new Pays (idpays, nompays);
		
		Controleur.updatePays(unPays);
		
		response.sendRedirect("index.jsp?page=10");
	}
	
	if (request.getParameter("deleteAll") != null) {
		Controleur.deleteAllPays();
	}


	ArrayList<Pays> lesPays = Controleur.selectAllPays();

%>

<% if (lePays == null) { %>
<%@ include file="vue/vue_les_pays.jsp" %>
<% } %>
