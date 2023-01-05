<div class="container mt-5">
	<div class="row d-flex justify-content-center">
		<div class="col-auto">
			<h2 class="text-center" style="color: #000000;">Gestion des livres</h2>
		</div>
	</div>
</div>

<%

	Livres leLivre = null;
	
	if (request.getParameter("action") != null && request.getParameter("idservice") != null
			&& request.getParameter("reflivre") != null) {
		String action = request.getParameter("action");
		int idservice = Integer.parseInt(request.getParameter("idservice"));
		int reflivre = Integer.parseInt(request.getParameter("reflivre"));
		switch (action) {
		case "sup":
			Controleur.deleteLivre(idservice, reflivre);
			response.sendRedirect("index.jsp?page=9");
			break;
		case "edit": leLivre = Controleur.selectWhereLivre(idservice, reflivre); break;
		}
	}
	
	ArrayList<VTrains> lesTrainsLivres = Controleur.selectAllTrainsSelect();
	ArrayList<VGares> lesGaresLivres = Controleur.selectAllGaresSelect();
%>

<%@ include file="vue/vue_insert_livre.jsp"%>

<%
	if (request.getParameter("Ajouter") != null) {
	
		String nomservice = request.getParameter("nomservice");
		String typeservice = request.getParameter("typeservice");
		String telservice = request.getParameter("telservice");
		int numtrain = Integer.parseInt(request.getParameter("numtrain"));
		int idgare = Integer.parseInt(request.getParameter("idgare"));
		int reflivre = Integer.parseInt(request.getParameter("reflivre"));
		String nomlivre = request.getParameter("nomlivre");
		String auteur = request.getParameter("auteur");
		String edition = request.getParameter("edition");
		int nbpages = Integer.parseInt(request.getParameter("nbpages"));
		String resume = request.getParameter("resume");
		String disponible = request.getParameter("disponible");
		String date_sortie = request.getParameter("date_sortie");
		
		Livres unLivre = new Livres (nomservice, typeservice, telservice, numtrain, idgare, reflivre, nomlivre, auteur, edition, nbpages, 
				resume, disponible, date_sortie);
	
		Controleur.insertLivre(unLivre);
	
		response.sendRedirect("index.jsp?page=9");
	}
	
	if (request.getParameter("Modifier") != null) {
	
		String nomservice = request.getParameter("nomservice");
		String typeservice = request.getParameter("typeservice");
		String telservice = request.getParameter("telservice");
		int numtrain = Integer.parseInt(request.getParameter("numtrain"));
		int idgare = Integer.parseInt(request.getParameter("idgare"));
		int reflivre = Integer.parseInt(request.getParameter("reflivre"));
		String nomlivre = request.getParameter("nomlivre");
		String auteur = request.getParameter("auteur");
		String edition = request.getParameter("edition");
		int nbpages = Integer.parseInt(request.getParameter("nbpages"));
		String resume = request.getParameter("resume");
		String disponible = request.getParameter("disponible");
		String date_sortie = request.getParameter("date_sortie");
	
		int idservice = Integer.parseInt(request.getParameter("idservice"));
	
		Livres unLivre = new Livres (idservice, nomservice, typeservice, telservice, numtrain, idgare, reflivre, nomlivre, auteur, edition, nbpages, 
				resume, disponible, date_sortie);
	
		Controleur.updateLivre(unLivre);
	
		response.sendRedirect("index.jsp?page=9");
	}
	
	if (request.getParameter("deleteAll") != null) {
		Controleur.deleteAllLivres();
	}
	
	ArrayList<VLivres> lesLivres = Controleur.selectAllLivres();
%>

<% if (leLivre == null) { %>
<%@ include file="vue/vue_les_livres.jsp"%>
<% } %>


