<div class="container mt-5">
	<div class="row d-flex justify-content-center">
		<div class="col-auto">
			<h2 class="text-center" style="color: #000000;">Gestion des gares</h2>
		</div>
	</div>
</div>

<%

	Gares laGare = null;
	
	if (request.getParameter("action") != null && request.getParameter("idgare") != null) {
		String action = request.getParameter("action");
		int idgare = Integer.parseInt(request.getParameter("idgare"));
		switch (action) {
		case "sup":
			Controleur.deleteGare(idgare);
			response.sendRedirect("index.jsp?page=8");
			break;
		case "edit": laGare = Controleur.selectWhereGare(idgare); break;
		}
	}
	
	ArrayList<Pays> lesPaysGare = Controleur.selectAllPaysSelect();
	ArrayList<VVilles> lesVillesGare = Controleur.selectAllVillesSelect();
%>

<%@ include file="vue/vue_insert_gare.jsp"%>

<%
	if (request.getParameter("Ajouter") != null) {
	
		String nomgare = request.getParameter("nomgare");
		String type = request.getParameter("type");
		String adresse = request.getParameter("adresse");
		int idpays = Integer.parseInt(request.getParameter("idpays"));
		int idville = Integer.parseInt(request.getParameter("idville"));
		
		Gares uneGare = new Gares (nomgare, type, adresse, idpays, idville);
	
		Controleur.insertGare(uneGare);
	
		response.sendRedirect("index.jsp?page=8");
	}
	
	if (request.getParameter("Modifier") != null) {
	
		String nomgare = request.getParameter("nomgare");
		String type = request.getParameter("type");
		String adresse = request.getParameter("adresse");
		int idpays = Integer.parseInt(request.getParameter("idpays"));
		int idville = Integer.parseInt(request.getParameter("idville"));
	
		int idgare = Integer.parseInt(request.getParameter("idgare"));
	
		Gares uneGare = new Gares (idgare, nomgare, type, adresse, idpays, idville);
		
		Controleur.updateGare(uneGare);
	
		response.sendRedirect("index.jsp?page=8");
	}
	
	if (request.getParameter("deleteAll") != null) {
		Controleur.deleteAllGares();
	}
	
	ArrayList<VGares> lesGares = Controleur.selectAllGares();
%>

<% if (laGare == null) { %>
<%@ include file="vue/vue_les_gares.jsp"%>
<% } %>


