<div class="container mt-4 mb-5">
	<div class="row d-flex justify-content-center">
		<div class="card" style="max-width: 35rem;">
			<% if (leTrajet != null) { %>
			<div class="card-header" style="background-color: #6254FF;">
				<h2 class="text-center" style="color: #FFFFFF;">Modification d'un trajet</h2>
			</div>
			<% } else { %>
			<div class="card-header" style="background-color: #863E54;">
				<h2 class="text-center" style="color: #FFFFFF;">Ajout d'un trajet</h2>
			</div>
			<% } %>
			<form method="post" action="">
				<div class="card-body" style="background-color: #6D73A9;">
					<div class="mb-3">
                       <select name="numtrain" class="form-select">
						<% if (leTrajet == null) { %>
							<option value="">Train du trajet</option>
						<% } %>
                           <%
								String chaineTrainTrajet = "";
								for (VTrains unTrain : lesTrainsTrajets) {
									chaineTrainTrajet += "<option value='"+unTrain.getNumtrain()+"'";
									if (leTrajet != null && leTrajet.getNumtrain() == unTrain.getNumtrain()) { 
										chaineTrainTrajet += " selected ";
									}
									chaineTrainTrajet += ">";
									chaineTrainTrajet += unTrain.getNomtrain();
									chaineTrainTrajet += "</option>";
								}
								out.print(chaineTrainTrajet);
                           %>
						</select>
					</div>
					<div class="mb-3">
                       <select name="idgare1" class="form-select">
						<% if (leTrajet == null) { %>
							<option value="">Gare de départ</option>
						<% } %>
                           <%
								String chaineGare1Trajet = "";
								for (VGares uneGare : lesGaresTrajets) {
									chaineGare1Trajet += "<option value='"+uneGare.getIdgare()+"'";
									if (leTrajet != null && leTrajet.getIdgare1() == uneGare.getIdgare()) { 
										chaineGare1Trajet += " selected ";
									}
									chaineGare1Trajet += ">";
									chaineGare1Trajet += uneGare.getNomgare()+" ["+uneGare.getNomville()+ " - "+uneGare.getNompays()+"]";
									chaineGare1Trajet += "</option>";
								}
								out.print(chaineGare1Trajet);
                           %>
						</select>
					</div>
					<div class="form-floating mb-3">
						<input type="text" name="date_depart" id="date_depart" maxlength="10" placeholder="Date de départ (AAAA-MM-JJ)" class="form-control"
							value='<%= (leTrajet != null ? leTrajet.getDate_depart() : "") %>' onkeypress="return formatDate(event);">
						<label for="date_depart">Date de départ (AAAA-MM-JJ)</label>
					</div>
					<div class="form-floating mb-3">
						<input type="time" name="heure_depart" id="heure_depart" placeholder="Heure de départ" class="form-control"
							value='<%= (leTrajet != null ? leTrajet.getHeure_depart() : "") %>'>
						<label for="heure_depart">Heure de départ</label>
					</div>
					<div class="mb-3">
                       <select name="idgare2" class="form-select">
						<% if (leTrajet == null) { %>
							<option value="">Gare d'arrivée</option>
						<% } %>
                           <%
								String chaineGare2Trajet = "";
								for (VGares uneGare : lesGaresTrajets) {
									chaineGare2Trajet += "<option value='"+uneGare.getIdgare()+"'";
									if (leTrajet != null && leTrajet.getIdgare2() == uneGare.getIdgare()) { 
										chaineGare2Trajet += " selected ";
									}
									chaineGare2Trajet += ">";
									chaineGare2Trajet += uneGare.getNomgare()+" ["+uneGare.getNomville()+ " - "+uneGare.getNompays()+"]";
									chaineGare2Trajet += "</option>";
								}
								out.print(chaineGare2Trajet);
                           %>
						</select>
					</div>
					<div class="form-floating mb-3">
						<input type="text" name="date_arrivee" id="date_arrivee" maxlength="10" placeholder="Date d'arrivée (AAAA-MM-JJ)" class="form-control"
							value='<%= (leTrajet != null ? leTrajet.getDate_arrivee() : "") %>' onkeypress="return formatDate(event);">
						<label for="date_arrive">Date d'arrivée (AAAA-MM-JJ)</label>
					</div>
					<div class="form-floating mb-3">
						<input type="time" name="heure_arrivee" id="heure_arrivee" placeholder="Heure d'arrivée" class="form-control"
							value='<%= (leTrajet != null ? leTrajet.getHeure_arrivee() : "") %>'>
						<label for="heure_arrivee">Heure d'arrivée</label>
					</div>
					<div class="form-floating mb-3">
						<input type="time" name="duree" id="duree" placeholder="Durée du trajet" class="form-control"
							value='<%= (leTrajet != null ? leTrajet.getDuree() : "") %>'>
						<label for="duree">Durée du trajet</label>
					</div>
					<div class="form-floating mb-3">
						<input type="text" name="prix" id="prix" placeholder="Prix du trajet" class="form-control"
							value='<%= (leTrajet != null ? leTrajet.getPrix() : "") %>' onkeypress="return formatPrix(event);">
						<label for="prix">Prix du trajet</label>
					</div>
					<div class="form-floating mb-3">
						<input type="text" name="quai" id="quai" placeholder="Quai du train" class="form-control"
							value='<%= (leTrajet != null ? leTrajet.getQuai() : "") %>'>
						<label for="quai">Quai du train</label>
					</div>
				</div>
				<div class="card-footer" style="background-color: #8C8C8C;">
					<div class="row d-flex justify-content-center">
						<div class="col-6">
							<% if (leTrajet != null) { %>
							<a href="index.jsp?page=14" class="btn w-100" style="background-color: #4D4444; color: #FFFFFF;">Retour</a>
							<% } else { %>
							<button type="reset" name="Annuler" class="btn w-100" style="background-color: #FF0000; color: #FFFFFF;">
								Annuler
							</button>
							<% } %>
						</div>
						<div class="col-6">
							<% if (leTrajet != null) { %>
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
				<%= (leTrajet != null ? "<input type='hidden' name='idtrajet' value='"+leTrajet.getIdtrajet()+"'>" : "") %>
			</form>
		</div>
	</div>
</div>

<!-- SUPPRESSION DES ESPACES -->
<script type="text/javascript">
	
	// Suppression des espaces pour le prix du trajet
	$("input#prix").on({
		keydown: function(e) {
			if (e.which === 32)
				return false
		},
		change: function() {
			this.value = this.value.replace(/\s/g, "");
		}
	});
	
</script>
<!-- / SUPPRESSION DES ESPACES -->

<script type="text/javascript">
function formatDate(event) {
    var regex = new RegExp("^[0-9-!@#$%&*?]");
    var key = String.fromCharCode(event.charCode ? event.which : event.charCode);
    if (!regex.test(key)) {
        event.preventDefault();
        return false;
    }
}
function formatPrix(event) {
    var regex = new RegExp("^[0-9.]");
    var key = String.fromCharCode(event.charCode ? event.which : event.charCode);
    if (!regex.test(key)) {
        event.preventDefault();
        return false;
    }
}
</script>
