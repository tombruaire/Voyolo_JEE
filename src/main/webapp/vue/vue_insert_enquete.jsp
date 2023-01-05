<div class="container mt-4 mb-5">
	<div class="row d-flex justify-content-center">
		<div class="card" style="max-width: 35rem;">
			<% if (lEnquete != null) { %>
			<div class="card-header" style="background-color: #6254FF;">
				<h2 class="text-center" style="color: #FFFFFF;">Modification d'une enquête</h2>
			</div>
			<% } else { %>
			<div class="card-header" style="background-color: #863E54;">
				<h2 class="text-center" style="color: #FFFFFF;">Ajout d'une enquête</h2>
			</div>
			<% } %>
			<form method="post" action="">
				<div class="card-body" style="background-color: #6D73A9;">
					<div class="form-floating mb-3">
						<input type="text" name="nom_enquete" id="nom_enquete" placeholder="Nom de l'enquête" class="form-control"
							value='<%= (lEnquete != null ? lEnquete.getNom_enquete() : "") %>'
							style="text-transform: capitalize;">
						<label for="nom_enquete">Nom de l'enquête</label>
					</div>
					<div class="form-floating mb-3">
						<input type="text" name="description" id="description" placeholder="Description de l'enquête" class="form-control"
							value='<%= (lEnquete != null ? lEnquete.getDescription() : "") %>'
							style="text-transform: capitalize;">
						<label for="description">Description de l'enquête</label>
					</div>
				</div>
				<div class="card-footer" style="background-color: #8C8C8C;">
					<div class="row d-flex justify-content-center">
						<div class="col-6">
							<% if (lEnquete != null) { %>
							<a href="index.jsp?page=6" class="btn w-100" style="background-color: #4D4444; color: #FFFFFF;">Retour</a>
							<% } else { %>
							<button type="reset" name="Annuler" class="btn w-100" style="background-color: #FF0000; color: #FFFFFF;">
								Annuler
							</button>
							<% } %>
						</div>
						<div class="col-6">
							<% if (lEnquete != null) { %>
							<button type="submit" name="Modifier" class="btn w-100" style="background-color: #0022D6; color: #FFFFFF;">
								Modifier
							</button>
							<% } else { %>
							<button type="submit" name="Ajouter" class="btn w-100" style="background-color: #366903; color: #FFFFFF;">
								Ajouter
							</button>
							<% } %>
						</div>
					</div>
				</div>
				<%= (lEnquete != null ? "<input type='hidden' name='idenquete' value='"+lEnquete.getIdenquete()+"'>" : "") %>
			</form>
		</div>
	</div>
</div>
