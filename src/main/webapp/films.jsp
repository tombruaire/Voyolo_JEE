<div class="container mt-5">
	<div class="row d-flex justify-content-center">
		<div class="col-auto">
			<h2 class="text-center" style="color: #000000;">Gestion des films</h2>
		</div>
	</div>
</div>

<%

	Films leFilm = null;
	
	if (request.getParameter("action") != null && request.getParameter("idservice") != null
			&& request.getParameter("reffilm") != null) {
		String action = request.getParameter("action");
		int idservice = Integer.parseInt(request.getParameter("idservice"));
		int reffilm = Integer.parseInt(request.getParameter("reffilm"));
		switch (action) {
		case "sup":
			Controleur.deleteFilm(idservice, reffilm);
			response.sendRedirect("index.jsp?page=7");
			break;
		case "edit": leFilm = Controleur.selectWhereFilm(idservice, reffilm); break;
		}
	}
	
	ArrayList<VTrains> lesTrainsFilms = Controleur.selectAllTrainsSelect();
	ArrayList<VGares> lesGaresFilms = Controleur.selectAllGaresSelect();
%>

<%@ include file="vue/vue_insert_film.jsp"%>

<%
	if (request.getParameter("Ajouter") != null) {
	
		String nomservice = request.getParameter("nomservice");
		String typeservice = request.getParameter("typeservice");
		String telservice = request.getParameter("telservice");
		int numtrain = Integer.parseInt(request.getParameter("numtrain"));
		int idgare = Integer.parseInt(request.getParameter("idgare"));
		int reffilm = Integer.parseInt(request.getParameter("reffilm"));
		String nomfilm = request.getParameter("nomfilm");
		String realisateur = request.getParameter("realisateur");
		String duree = request.getParameter("duree");
		String resume = request.getParameter("resume");
		String disponible = request.getParameter("disponible");
		String date_sortie = request.getParameter("date_sortie");
		
		Films unFilm = new Films (nomservice, typeservice, telservice, numtrain, idgare, reffilm, nomfilm, realisateur, duree, resume,
				disponible, date_sortie);
	
		Controleur.insertFilm(unFilm);
	
		response.sendRedirect("index.jsp?page=7");
	}
	
	if (request.getParameter("Modifier") != null) {
	
		String nomservice = request.getParameter("nomservice");
		String typeservice = request.getParameter("typeservice");
		String telservice = request.getParameter("telservice");
		int numtrain = Integer.parseInt(request.getParameter("numtrain"));
		int idgare = Integer.parseInt(request.getParameter("idgare"));
		int reffilm = Integer.parseInt(request.getParameter("reffilm"));
		String nomfilm = request.getParameter("nomfilm");
		String realisateur = request.getParameter("realisateur");
		String duree = request.getParameter("duree");
		String resume = request.getParameter("resume");
		String disponible = request.getParameter("disponible");
		String date_sortie = request.getParameter("date_sortie");
	
		int idservice = Integer.parseInt(request.getParameter("idservice"));
	
		Films unFilm = new Films (idservice, nomservice, typeservice, telservice, numtrain, idgare, reffilm, nomfilm, realisateur, duree, resume,
				disponible, date_sortie);
	
		Controleur.updateFilm(unFilm);
	
		response.sendRedirect("index.jsp?page=7");
	}
	
	if (request.getParameter("deleteAll") != null) {
		Controleur.deleteAllFilms();
	}
	
	ArrayList<VFilms> lesFilms = Controleur.selectAllFilms();
%>

<% if (leFilm == null) { %>
<%@ include file="vue/vue_les_films.jsp"%>
<% } %>


