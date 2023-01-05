<div class="container mt-4 mb-5">
	<div class="row d-flex justify-content-center">
		<div class="card" style="max-width: 35rem;">
			<% if (lEnergie != null) { %>
			<div class="card-header" style="background-color: #6254FF;">
				<h2 class="text-center" style="color: #FFFFFF;">Modification d'une énergie</h2>
			</div>
			<% } else { %>
			<div class="card-header" style="background-color: #863E54;">
				<h2 class="text-center" style="color: #FFFFFF;">Ajout d'une énergie</h2>
			</div>
			<% } %>
			<form method="post" action="">
				<div class="card-body" style="background-color: #6D73A9;">
					<div class="mb-3">
                       <select name="numtrain" class="form-select">
						<% if (lEnergie == null) { %>
							<option value="">Sélectionnez un train</option>
						<% } %>
                           <%
								String chaineTrainsEnergie = "";
								for (VTrains unTrain : lesTrainsEnergies) {
									chaineTrainsEnergie += "<option value='"+unTrain.getNumtrain()+"'";
									if (lEnergie != null && lEnergie.getNumtrain() == unTrain.getNumtrain()) { 
										chaineTrainsEnergie += " selected ";
									}
									chaineTrainsEnergie += ">";
									chaineTrainsEnergie += unTrain.getNomtrain();
									chaineTrainsEnergie += "</option>";
								}
								out.print(chaineTrainsEnergie);
                           %>
						</select>
					</div>
					<div class="form-floating mb-3">
						<input type="number" name="energie_consommee" id="energie_consommee" placeholder="Energie consommée" class="form-control"
							value='<%= (lEnergie != null ? lEnergie.getEnergie_consommee() : "") %>'>
						<label for="energie_consommee">Energie consommée</label>
					</div>
				</div>
				<div class="card-footer" style="background-color: #8C8C8C;">
					<div class="row d-flex justify-content-center">
						<div class="col-6">
							<% if (lEnergie != null) { %>
							<a href="index.jsp?page=5" class="btn w-100" style="background-color: #4D4444; color: #FFFFFF;">Retour</a>
							<% } else { %>
							<button type="reset" name="Annuler" class="btn w-100" style="background-color: #FF0000; color: #FFFFFF;">
								Annuler
							</button>
							<% } %>
						</div>
						<div class="col-6">
							<% if (lEnergie != null) { %>
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
				<%= (lEnergie != null ? "<input type='hidden' name='idenergie' value='"+lEnergie.getIdenergie()+"'>" : "") %>
			</form>
		</div>
	</div>
</div>
