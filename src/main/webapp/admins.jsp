<div class="container mt-5">
	<div class="row d-flex justify-content-center">
		<div class="col-auto">
			<h2 class="text-center" style="color: #000000;">Gestion des admins</h2>
		</div>
	</div>
</div>

<%

	Admins lAdmin = null;
	
	if (request.getParameter("action") != null && request.getParameter("idu") != null) {
		String action = request.getParameter("action");
		int idu = Integer.parseInt(request.getParameter("idu"));
		switch (action) {
			case "sup" : 
				Controleur.deleteAdmin(idu); 
				response.sendRedirect("index.jsp?page=2");
				break; 
			case "edit" : lAdmin = Controleur.selectWhereAdmin(idu); break;
		}
	}
%>

<%@ include file="vue/vue_insert_admin.jsp" %>

<%

	if (request.getParameter("Ajouter") != null) {

		String nom = request.getParameter("nom");
		String prenom = request.getParameter("prenom");
		String pseudo = request.getParameter("pseudo");
		String email = request.getParameter("email");
		String mdp = request.getParameter("mdp");
		String role = request.getParameter("role");
		int num_identification = Integer.parseInt(request.getParameter("num_identification"));
		String type = request.getParameter("type");
		
		Admins unAdmin = new Admins (nom, prenom, pseudo, email, mdp, role, num_identification, type);
		

		Controleur.insertAdmin(unAdmin);
		
		response.sendRedirect("index.jsp?page=2");
	}

	if (request.getParameter("Modifier") != null) {
	
		String nom = request.getParameter("nom");
		String prenom = request.getParameter("prenom");
		String pseudo = request.getParameter("pseudo");
		String email = request.getParameter("email");
		String mdp = request.getParameter("mdp");
		String role = request.getParameter("role");
		int num_identification = Integer.parseInt(request.getParameter("num_identification"));
		String type = request.getParameter("type");
		
		int idu = Integer.parseInt(request.getParameter("idu"));
		
		Admins unAdmin = new Admins (idu, nom, prenom, pseudo, email, mdp, role, num_identification, type);
		
		Controleur.updateAdmin(unAdmin);
		
		response.sendRedirect("index.jsp?page=2");
	}
	
	if (request.getParameter("deleteAll") != null) {
		Controleur.deleteAllAdmins();
	}

	ArrayList<VAdmins> lesAdmins = Controleur.selectAllAdmins();

%>

<% if (lAdmin == null) { %>
<%@ include file="vue/vue_les_admins.jsp" %>
<% } %>


