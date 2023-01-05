<div class="container mt-4 mb-5">
	<div class="row d-flex justify-content-center">
		<div class="card" style="max-width: 35rem;">
			<% if (leFilm != null) { %>
			<div class="card-header" style="background-color: #6254FF;">
				<h2 class="text-center" style="color: #FFFFFF;">Modification d'un film</h2>
			</div>
			<% } else { %>
			<div class="card-header" style="background-color: #863E54;">
				<h2 class="text-center" style="color: #FFFFFF;">Ajout d'un film</h2>
			</div>
			<% } %>
			<form method="post" action="">
				<div class="card-body" style="background-color: #6D73A9;">
					<div class="form-floating mb-3">
						<input type="text" name="nomservice" id="nomservice" placeholder="Nom du service" class="form-control"
							value='<%= (leFilm != null ? leFilm.getNomservice() : "") %>'
							style="text-transform: capitalize;">
						<label for="nomservice">Nom du service</label>
					</div>
					<input type="hidden" name="typeservice" value="Film">
					<div class="form-floating mb-3">
						<input type="tel" name="telservice" id="telservice" maxlength="10" placeholder="Téléphone du service" class="form-control"
							value='<%= (leFilm != null ? leFilm.getTelservice() : "") %>'>
						<label for="telservice">Téléphone du service</label>
					</div>
					<div class="mb-3">
                       <select name="numtrain" class="form-select">
						<% if (leFilm == null) { %>
							<option value="">Train du service</option>
						<% } %>
                           <%
								String chaineTrainFilm = "";
								for (VTrains unTrain : lesTrainsFilms) {
									chaineTrainFilm += "<option value='"+unTrain.getNumtrain()+"'";
									if (leFilm != null && leFilm.getNumtrain() == unTrain.getNumtrain()) { 
										chaineTrainFilm += " selected ";
									}
									chaineTrainFilm += ">";
									chaineTrainFilm += unTrain.getNomtrain();
									chaineTrainFilm += "</option>";
								}
								out.print(chaineTrainFilm);
                           %>
						</select>
					</div>
					<div class="mb-3">
                       <select name="idgare" class="form-select">
						<% if (leFilm == null) { %>
							<option value="">Gare du service</option>
						<% } %>
                           <%
								String chaineGareFilm = "";
								for (VGares uneGare : lesGaresFilms) {
									chaineGareFilm += "<option value='"+uneGare.getIdgare()+"'";
									if (leFilm != null && leFilm.getIdgare() == uneGare.getIdgare()) { 
										chaineGareFilm += " selected ";
									}
									chaineGareFilm += ">";
									chaineGareFilm += uneGare.getNomgare()+" ["+uneGare.getNomville()+ " - "+uneGare.getNompays()+"]";
									chaineGareFilm += "</option>";
								}
								out.print(chaineGareFilm);
                           %>
						</select>
					</div>
					<div class="form-floating mb-3">
						<input type="text" name="reffilm" id="reffilm" maxlength="6" placeholder="Référence du film (6 chiffres)" class="form-control"
							value='<%= (leFilm != null ? leFilm.getReffilm() : "") %>' onkeypress="return formatRef(event);">
						<label for="reffilm">Référence du film (6 chiffres)</label>
					</div>
					<div class="form-floating mb-3">
						<input type="text" name="nomfilm" id="nomfilm" placeholder="Nom du film" class="form-control"
							value='<%= (leFilm != null ? leFilm.getNomfilm() : "") %>'
							style="text-transform: capitalize;">
						<label for="nomfilm">Nom du film</label>
					</div>
					<div class="form-floating mb-3">
						<input type="text" name="realisateur" id="realisateur" placeholder="Réalisateur du film" class="form-control"
							value='<%= (leFilm != null ? leFilm.getRealisateur() : "") %>'
							style="text-transform: capitalize;">
						<label for="realisateur">Réalisateur du film</label>
					</div>
					<div class="form-floating mb-3">
						<input type="time" name="duree" id="duree" placeholder="Durée du film" class="form-control"
							value='<%= (leFilm != null ? leFilm.getDuree() : "") %>'>
						<label for="duree">Durée du film</label>
					</div>
					<div class="form-floating mb-3">
						<input type="text" name="resume" id="resume" placeholder="Résumé du film" class="form-control"
							value='<%= (leFilm != null ? leFilm.getResume() : "") %>'>
						<label for="resume">Résumé du film</label>
					</div>
					<div class="mb-3">
						<select name="disponible" class="form-select">
							<% if (leFilm == null) { %>
							<option value="">Disponibilité du film</option>
							<% } %>
							<option value="true" <% if (leFilm != null && leFilm.getDisponible().equals("true")) {out.print("selected");} %>>
								Disponible
							</option>
							<option value="false" <% if (leFilm != null && leFilm.getDisponible().equals("flase")) {out.print("selected");} %>>
								Non disponible
							</option>
						</select>
					</div>
					<div class="form-floating mb-3">
						<input type="text" name="date_sortie" id="date_sortie" maxlength="10" placeholder="Date de sortie du film (AAAA-MM-JJ)" class="form-control"
							value='<%= (leFilm != null ? leFilm.getDate_sortie() : "") %>' onkeypress="return formatDate(event);">
						<label for="date_sortie">Date de sortie du film (AAAA-MM-JJ)</label>
					</div>
				</div>
				<div class="card-footer" style="background-color: #8C8C8C;">
					<div class="row d-flex justify-content-center">
						<div class="col-6">
							<% if (leFilm != null) { %>
							<a href="index.jsp?page=7" class="btn w-100" style="background-color: #4D4444; color: #FFFFFF;">Retour</a>
							<% } else { %>
							<button type="reset" name="Annuler" class="btn w-100" style="background-color: #FF0000; color: #FFFFFF;">
								Annuler
							</button>
							<% } %>
						</div>
						<div class="col-6">
							<% if (leFilm != null) { %>
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
				<%= (leFilm != null ? "<input type='hidden' name='idservice' value='"+leFilm.getIdservice()+"'>" : "") %>
			</form>
		</div>
	</div>
</div>

<!-- SUPPRESSION DES ESPACES -->
<script type="text/javascript">

	// Suppression des espaces pour le téléphone du service
	$("input#telservice").on({
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

<!-- SUPPRESSION DES LETTRES DANS LE INPUT TELSERVICE -->
<script type="text/javascript">
/* Cette fonction permet d'insérer seulement des chiffres compris entre 0 et 9 */
/* Elle est résistante aux : 
- Copier Coller
- Glisser Déposer
- Raccouris clavier
- Opération de menu contextuel
- Touches non typables
- Position d'insertion
- Différentes disposition du clavier */
/* Elle est également supportable sur tous les navigateurs depuis IE 9. */

	function onlyNumber(textbox, inputFilter) {
  		["input", "keydown", "keyup", "mousedown", "mouseup", "select", "contextmenu", "drop"].forEach(function(event) {
    		textbox.addEventListener(event, function() {
      			if (inputFilter(this.value)) {
        			this.oldValue = this.value;
        			this.oldSelectionStart = this.selectionStart;
        			this.oldSelectionEnd = this.selectionEnd;
      			} else if (this.hasOwnProperty("oldValue")) {
        			this.value = this.oldValue;
        			this.setSelectionRange(this.oldSelectionStart, this.oldSelectionEnd);
      			} else {
        			this.value = "";
      			}
    		});
  		});
	}

	onlyNumber(document.getElementById("telservice"), function(value) {
  		return /^\d*?\d*$/.test(value); // Allow digits and '.' only, using a RegExp
	});

</script>
<!-- / SUPPRESSION DES LETTRES DANS LE INPUT TELSERVICE -->

<script type="text/javascript">
function formatRef(event) {
    var regex = new RegExp("^[0-9]");
    var key = String.fromCharCode(event.charCode ? event.which : event.charCode);
    if (!regex.test(key)) {
        event.preventDefault();
        return false;
    }
}
function formatDate(event) {
    var regex = new RegExp("^[0-9-!@#$%&*?]");
    var key = String.fromCharCode(event.charCode ? event.which : event.charCode);
    if (!regex.test(key)) {
        event.preventDefault();
        return false;
    }
}
</script>
