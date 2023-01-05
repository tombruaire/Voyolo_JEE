<div class="container mt-5">
	<div class="row d-flex justify-content-center">
		<div class="col-auto">
			<h2 class="text-center" style="color: #000000;">Gestion des trains</h2>
		</div>
	</div>
</div>

<%

	Trains leTrain = null;
	
	if (request.getParameter("action") != null && request.getParameter("numtrain") != null) {
		String action = request.getParameter("action");
		int numtrain = Integer.parseInt(request.getParameter("numtrain"));
		switch (action) {
			case "sup" : 
				Controleur.deleteTrain(numtrain); 
				response.sendRedirect("index.jsp?page=13");
				break; 
			case "edit" : leTrain = Controleur.selectWhereTrain(numtrain); break;
		}
	}
%>

<%@ include file="vue/vue_insert_train.jsp" %>

<%
	
	if (request.getParameter("Ajouter") != null) {
	
		String nomtrain = request.getParameter("nomtrain");
		int nbwagon = Integer.parseInt(request.getParameter("nbwagon"));
		
		Trains unTrain = new Trains (nomtrain, nbwagon);
		
		Controleur.insertTrain(unTrain);
		
		response.sendRedirect("index.jsp?page=13");
	}

	if (request.getParameter("Modifier") != null) {
		
		String nomtrain = request.getParameter("nomtrain");
		int nbwagon = Integer.parseInt(request.getParameter("nbwagon"));
	
		int numtrain = Integer.parseInt(request.getParameter("numtrain"));
		
		Trains unTrain = new Trains (numtrain, nomtrain, nbwagon);
		
		Controleur.updateTrain(unTrain);
		
		response.sendRedirect("index.jsp?page=13");
	}
	
	if (request.getParameter("deleteAll") != null) {
		Controleur.deleteAllTrains();
	}


	ArrayList<VTrains> lesTrains = Controleur.selectAllTrains();

%>

<% if (leTrain == null) { %>
<%@ include file="vue/vue_les_trains.jsp" %>
<% } %>
