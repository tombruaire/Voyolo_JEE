<div class="container mt-4 mb-5">
	<div class="row d-flex justify-content-center">
		<div class="card" style="max-width: 35rem;">
			<% if (laReservation != null) { %>
			<div class="card-header" style="background-color: #6254FF;">
				<h2 class="text-center" style="color: #FFFFFF;">Modification d'une r�servation</h2>
			</div>
			<% } else { %>
			<div class="card-header" style="background-color: #863E54;">
				<h2 class="text-center" style="color: #FFFFFF;">Ajout d'une r�servation</h2>
			</div>
			<% } %>
			<form method="post" action="">
				<div class="card-body" style="background-color: #6D73A9;">
					<div class="mb-3">
						<select name="statut_reservation" class="form-select">
							<% if (laReservation == null) { %>
							<option value="">Statut de la r�servation</option>
							<% } %>
							<option value="En attente..." <% if (laReservation != null && laReservation.getStatut_reservation().equals("En attente...")) {out.print("selected");} %>>
								En attente...
							</option>
							<option value="Action requise" <% if (laReservation != null && laReservation.getStatut_reservation().equals("Action requise")) {out.print("selected");} %>>
								Action requise
							</option>
							<option value="Demande" <% if (laReservation != null && laReservation.getStatut_reservation().equals("Demande")) {out.print("selected");} %>>
								Demande
							</option>
							<option value="Pr�-approuv�" <% if (laReservation != null && laReservation.getStatut_reservation().equals("Pr�-approuv�")) {out.print("selected");} %>>
								Pr�-approuv�
							</option>
							<option value="Accept�e" <% if (laReservation != null && laReservation.getStatut_reservation().equals("Accept�e")) {out.print("selected");} %>>
								Accept�e
							</option>
							<option value="Refus�e" <% if (laReservation != null && laReservation.getStatut_reservation().equals("Refus�e")) {out.print("selected");} %>>
								Refus�e
							</option>
							<option value="Expir�e" <% if (laReservation != null && laReservation.getStatut_reservation().equals("Expir�e")) {out.print("selected");} %>>
								Expir�e
							</option>
							<option value="Annul�e" <% if (laReservation != null && laReservation.getStatut_reservation().equals("Annul�e")) {out.print("selected");} %>>
								Annul�e
							</option>
						</select>
					</div>
					<div class="form-floating mb-3">
						<input type="number" name="nbpersonne" id="nbpersonne" placeholder="Nombre de personnes" class="form-control"
							value='<%= (laReservation != null ? laReservation.getNbpersonne() : "") %>'>
						<label for="nbpersonne">Nombre de personnes</label>
					</div>
					<div class="mb-3">
                       <select name="idu" class="form-select">
						<% if (laReservation == null) { %>
							<option value="">Personne</option>
						<% } %>
                           <%
								String chaineUsersReservation = "";
								for (Users unUser : lesUsersReservations) {
									chaineUsersReservation += "<option value='"+unUser.getIdu()+"'";
									if (laReservation != null && laReservation.getIdu() == unUser.getIdu()) { 
										chaineUsersReservation += " selected ";
									}
									chaineUsersReservation += ">";
									chaineUsersReservation += unUser.getPrenom() + " " + unUser.getNom();
									chaineUsersReservation += "</option>";
								}
								out.print(chaineUsersReservation);
                           %>
						</select>
					</div>
					<div class="mb-3">
                       <select name="numtrain" class="form-select">
						<% if (laReservation == null) { %>
							<option value="">Train</option>
						<% } %>
                           <%
								String chaineTrainsReservations = "";
								for (VTrains unTrain : lesTrainsReservations) {
									chaineTrainsReservations += "<option value='"+unTrain.getNumtrain()+"'";
									if (laReservation != null && laReservation.getNumtrain() == unTrain.getNumtrain()) { 
										chaineTrainsReservations += " selected ";
									}
									chaineTrainsReservations += ">";
									chaineTrainsReservations += unTrain.getNomtrain();
									chaineTrainsReservations += "</option>";
								}
								out.print(chaineTrainsReservations);
                           %>
						</select>
					</div>
				</div>
				<div class="card-footer" style="background-color: #8C8C8C;">
					<div class="row d-flex justify-content-center">
						<div class="col-6">
							<% if (laReservation != null) { %>
							<a href="index.jsp?page=12" class="btn w-100" style="background-color: #4D4444; color: #FFFFFF;">Retour</a>
							<% } else { %>
							<button type="reset" name="Annuler" class="btn w-100" style="background-color: #FF0000; color: #FFFFFF;">
								Annuler
							</button>
							<% } %>
						</div>
						<div class="col-6">
							<% if (laReservation != null) { %>
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
				<%= (laReservation != null ? "<input type='hidden' name='idreservation' value='"+laReservation.getIdreservation()+"'>" : "") %>
			</form>
		</div>
	</div>
</div>
