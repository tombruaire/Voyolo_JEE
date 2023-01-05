<div class="container mt-5">
	<div class="row d-flex justify-content-center">
		<div class="col-auto">
			<h2 class="text-center" style="color: #000000;">Gestion des questions</h2>
		</div>
	</div>
</div>

<%

	Questions laQuestion = null;
	
	if (request.getParameter("action") != null && request.getParameter("idquestion") != null) {
		String action = request.getParameter("action");
		int idquestion = Integer.parseInt(request.getParameter("idquestion"));
		switch (action) {
			case "sup" : 
				Controleur.deleteQuestion(idquestion); 
				response.sendRedirect("index.jsp?page=11");
				break; 
			case "edit" : laQuestion = Controleur.selectWhereQuestion(idquestion); break;
		}
	}
%>

<%@ include file="vue/vue_insert_question.jsp" %>

<%
	
	if (request.getParameter("Ajouter") != null) {
	
		String enonce = request.getParameter("enonce");
		
		Questions uneQuestion = new Questions (enonce);
		
		Controleur.insertQuestion(uneQuestion);
		
		response.sendRedirect("index.jsp?page=11");
	}

	if (request.getParameter("Modifier") != null) {
	
		String enonce = request.getParameter("enonce");
		
		int idquestion = Integer.parseInt(request.getParameter("idquestion"));
		
		Questions uneQuestion = new Questions (idquestion, enonce);
		
		Controleur.updateQuestion(uneQuestion);
		
		response.sendRedirect("index.jsp?page=11");
	}
	
	if (request.getParameter("deleteAll") != null) {
		Controleur.deleteAllQuestions();
	}


	ArrayList<Questions> lesQuestions = Controleur.selectAllQuestions();

%>

<% if (laQuestion == null) { %>
<%@ include file="vue/vue_les_questions.jsp" %>
<% } %>
