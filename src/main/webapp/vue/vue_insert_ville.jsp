<div class="container mt-4 mb-5">
	<div class="row d-flex justify-content-center">
		<div class="card" style="max-width: 35rem;">
			<% if (laVille != null) { %>
			<div class="card-header" style="background-color: #6254FF;">
				<h2 class="text-center" style="color: #FFFFFF;">Modification d'une ville</h2>
			</div>
			<% } else { %>
			<div class="card-header" style="background-color: #863E54;">
				<h2 class="text-center" style="color: #FFFFFF;">Ajout d'une ville</h2>
			</div>
			<% } %>
			<form method="post" action="">
				<div class="card-body" style="background-color: #6D73A9;">
					<div class="form-floating mb-3">
						<input type="text" name="nomville" id="nomville" placeholder="Nom de la ville" class="form-control"
							value='<%= (laVille != null ? laVille.getNomville() : "") %>'
							style="text-transform: capitalize;">
						<label for="nomville">Nom de la ville</label>
					</div>
					<div class="mb-3">
                       <select name="idpays" class="form-select">
						<% if (laVille == null) { %>
							<option value="">Pays de la ville</option>
						<% } %>
                           <%
								String chainePaysVille = "";
								for (Pays unPays : lesPaysVilles) {
									chainePaysVille += "<option value='"+unPays.getIdpays()+"'";
									if (laVille != null && laVille.getIdpays() == unPays.getIdpays()) { 
										chainePaysVille += " selected ";
									}
									chainePaysVille += ">";
									chainePaysVille += unPays.getNompays();
									chainePaysVille += "</option>";
								}
								out.print(chainePaysVille);
                           %>
						</select>
					</div>
				</div>
				<div class="card-footer" style="background-color: #8C8C8C;">
					<div class="row d-flex justify-content-center">
						<div class="col-6">
							<% if (laVille != null) { %>
							<a href="index.jsp?page=15" class="btn w-100" style="background-color: #4D4444; color: #FFFFFF;">Retour</a>
							<% } else { %>
							<button type="reset" name="Annuler" class="btn w-100" style="background-color: #FF0000; color: #FFFFFF;">
								Annuler
							</button>
							<% } %>
						</div>
						<div class="col-6">
							<% if (laVille != null) { %>
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
				<%= (laVille != null ? "<input type='hidden' name='idville' value='"+laVille.getIdville()+"'>" : "") %>
			</form>
		</div>
	</div>
</div>
