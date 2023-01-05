<div class="container mt-4 mb-5">
	<div class="row d-flex justify-content-center">
		<div class="card" style="max-width: 35rem;">
			<% if (laGare != null) { %>
			<div class="card-header" style="background-color: #6254FF;">
				<h2 class="text-center" style="color: #FFFFFF;">Modification d'une gare</h2>
			</div>
			<% } else { %>
			<div class="card-header" style="background-color: #863E54;">
				<h2 class="text-center" style="color: #FFFFFF;">Ajout d'une gare</h2>
			</div>
			<% } %>
			<form method="post" action="">
				<div class="card-body" style="background-color: #6D73A9;">
					<div class="form-floating mb-3">
						<input type="text" name="nomgare" id="nomgare" placeholder="Nom de la gare" class="form-control"
							value='<%= (laGare != null ? laGare.getNomgare() : "") %>'
							style="text-transform: capitalize;">
						<label for="nomgare">Nom de la gare</label>
					</div>
					<div class="mb-3">
						<select name="type" class="form-select">
							<% if (laGare == null) { %>
							<option value="">Type de gare</option>
							<% } %>
							<option value="petite" <% if (laGare != null && laGare.getType().equals("petite")) {out.print("selected");} %>>
								Petite
							</option>
							<option value="moyenne" <% if (laGare != null && laGare.getType().equals("moyenne")) {out.print("selected");} %>>
								Moyenne
							</option>
							<option value="grande" <% if (laGare != null && laGare.getType().equals("grande")) {out.print("selected");} %>>
								Grande
							</option>
							<option value="très grande" <% if (laGare != null && laGare.getType().equals("très grande")) {out.print("selected");} %>>
								Très grande
							</option>
						</select>
					</div>
					<div class="form-floating mb-3">
						<input type="text" name="adresse" id="adresse" placeholder="Adresse de la gare" class="form-control"
							value='<%= (laGare != null ? laGare.getAdresse() : "") %>'>
						<label for="adresse">Adresse de la gare</label>
					</div>
					<div class="mb-3">
                       <select name="idpays" class="form-select">
						<% if (laGare == null) { %>
							<option value="">Pays de la gare</option>
						<% } %>
                           <%
								String chainePaysGare = "";
								for (Pays unPays : lesPaysGare) {
									chainePaysGare += "<option value='"+unPays.getIdpays()+"'";
									if (laGare != null && laGare.getIdpays() == unPays.getIdpays()) { 
										chainePaysGare += " selected ";
									}
									chainePaysGare += ">";
									chainePaysGare += unPays.getNompays();
									chainePaysGare += "</option>";
								}
								out.print(chainePaysGare);
                           %>
						</select>
					</div>
					<div class="mb-3">
                       <select name="idville" class="form-select">
						<% if (laGare == null) { %>
							<option value="">Ville de la gare</option>
						<% } %>
                           <%
								String chaineVillesGare = "";
								for (VVilles uneVille : lesVillesGare) {
									chaineVillesGare += "<option value='"+uneVille.getIdville()+"'";
									if (laGare != null && laGare.getIdville() == uneVille.getIdville()) { 
										chaineVillesGare += " selected ";
									}
									chaineVillesGare += ">";
									chaineVillesGare += uneVille.getNomville();
									chaineVillesGare += "</option>";
								}
								out.print(chaineVillesGare);
                           %>
						</select>
					</div>
				</div>
				<div class="card-footer" style="background-color: #8C8C8C;">
					<div class="row d-flex justify-content-center">
						<div class="col-6">
							<% if (laGare != null) { %>
							<a href="index.jsp?page=8" class="btn w-100" style="background-color: #4D4444; color: #FFFFFF;">Retour</a>
							<% } else { %>
							<button type="reset" name="Annuler" class="btn w-100" style="background-color: #FF0000; color: #FFFFFF;">
								Annuler
							</button>
							<% } %>
						</div>
						<div class="col-6">
							<% if (laGare != null) { %>
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
				<%= (laGare != null ? "<input type='hidden' name='idgare' value='"+laGare.getIdgare()+"'>" : "") %>
			</form>
		</div>
	</div>
</div>
