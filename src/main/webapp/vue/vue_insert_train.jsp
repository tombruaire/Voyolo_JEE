<div class="container mt-4 mb-5">
	<div class="row d-flex justify-content-center">
		<div class="card" style="max-width: 35rem;">
			<% if (leTrain != null) { %>
			<div class="card-header" style="background-color: #6254FF;">
				<h2 class="text-center" style="color: #FFFFFF;">Modification d'un train</h2>
			</div>
			<% } else { %>
			<div class="card-header" style="background-color: #863E54;">
				<h2 class="text-center" style="color: #FFFFFF;">Ajout d'un train</h2>
			</div>
			<% } %>
			<form method="post" action="">
				<div class="card-body" style="background-color: #6D73A9;">
					<div class="form-floating mb-3">
						<input type="text" name="nomtrain" id="nomtrain" placeholder="Nom du train" class="form-control"
							value='<%= (leTrain != null ? leTrain.getNomtrain() : "") %>'
							style="text-transform: capitalize;">
						<label for="nomtrain">Nom du train</label>
					</div>
					<div class="form-floating mb-3">
						<input type="number" name="nbwagon" id="nbwagon" placeholder="Nombre de wagon" class="form-control"
							value='<%= (leTrain != null ? leTrain.getNbwagon() : "") %>'>
						<label for="nbwagon">Nombre de wagon</label>
					</div>
				</div>
				<div class="card-footer" style="background-color: #8C8C8C;">
					<div class="row d-flex justify-content-center">
						<div class="col-6">
							<% if (leTrain != null) { %>
							<a href="index.jsp?page=13" class="btn w-100" style="background-color: #4D4444; color: #FFFFFF;">Retour</a>
							<% } else { %>
							<button type="reset" name="Annuler" class="btn w-100" style="background-color: #FF0000; color: #FFFFFF;">
								Annuler
							</button>
							<% } %>
						</div>
						<div class="col-6">
							<% if (leTrain != null) { %>
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
				<%= (leTrain != null ? "<input type='hidden' name='numtrain' value='"+leTrain.getNumtrain()+"'>" : "") %>
			</form>
		</div>
	</div>
</div>