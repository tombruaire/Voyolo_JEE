<div class="container mt-5">
	<div class="row d-flex justify-content-center">
		<div class="col-auto">
			<h2 class="text-center" style="color: #000000;">Gestion des consommations</h2>
		</div>
	</div>
</div>

<%

	VConsommations laConsommation = null;
	
	if (request.getParameter("action") != null && request.getParameter("idservice") != null
			&& request.getParameter("refarticle") != null) {
		String action = request.getParameter("action");
		int idservice = Integer.parseInt(request.getParameter("idservice"));
		int refarticle = Integer.parseInt(request.getParameter("refarticle"));
		switch (action) {
		case "sup":
			Controleur.deleteConsommation(idservice, refarticle);
			response.sendRedirect("index.jsp?page=4");
			break;
		case "edit": laConsommation = Controleur.selectWhereConsommation(idservice, refarticle); break;
		}
	}
	
	ArrayList<VTrains> lesTrainsConsommations = Controleur.selectAllTrainsSelect();
	ArrayList<VGares> lesGaresConsommations = Controleur.selectAllGaresSelect();
%>

<%@ include file="vue/vue_insert_consommation.jsp"%>

<%
	if (request.getParameter("Ajouter") != null) {
	
		String nomservice = request.getParameter("nomservice");
		String typeservice = request.getParameter("typeservice");
		String telservice = request.getParameter("telservice");
		int numtrain = Integer.parseInt(request.getParameter("numtrain"));
		int idgare = Integer.parseInt(request.getParameter("idgare"));
		int refarticle = Integer.parseInt(request.getParameter("refarticle"));
		String article = request.getParameter("article");
		String prix = request.getParameter("prix");
		int quantite = Integer.parseInt(request.getParameter("quantite"));
		String description = request.getParameter("description");
		String date_expiration = request.getParameter("date_expiration");
	
		Consommations uneConsommation = new Consommations (nomservice, typeservice, telservice, numtrain, idgare, refarticle,
		article, prix, quantite, description, date_expiration);
	
		Controleur.insertConsommation(uneConsommation);
	
		response.sendRedirect("index.jsp?page=4");
	}
	
	if (request.getParameter("Modifier") != null) {
	
		String nomservice = request.getParameter("nomservice");
		String typeservice = request.getParameter("typeservice");
		String telservice = request.getParameter("telservice");
		int numtrain = Integer.parseInt(request.getParameter("numtrain"));
		int idgare = Integer.parseInt(request.getParameter("idgare"));
		int refarticle = Integer.parseInt(request.getParameter("refarticle"));
		String article = request.getParameter("article");
		String prix = request.getParameter("prix");
		int quantite = Integer.parseInt(request.getParameter("quantite"));
		String description = request.getParameter("description");
		String date_expiration = request.getParameter("date_expiration");
	
		int idservice = Integer.parseInt(request.getParameter("idservice"));
	
		Consommations uneConsommation = new Consommations (idservice, nomservice, typeservice, telservice, numtrain, idgare,
		refarticle, article, prix, quantite, description, date_expiration);
	
		Controleur.updateConsommation(uneConsommation);
	
		response.sendRedirect("index.jsp?page=4");
	}
	
	if (request.getParameter("deleteAll") != null) {
		Controleur.deleteAllConsommations();
	}
	
	ArrayList<VConsommations> lesConsommations = Controleur.selectAllConsommations();
%>

<% if (laConsommation == null) { %>
<%@ include file="vue/vue_les_consommations.jsp"%>
<% } %>


