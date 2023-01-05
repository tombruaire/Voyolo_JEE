<div class="container mt-4 mb-5">
	<div class="row d-flex justify-content-center">
		<div class="card" style="max-width: 35rem;">
			<% if (leLivre != null) { %>
			<div class="card-header" style="background-color: #6254FF;">
				<h2 class="text-center" style="color: #FFFFFF;">Modification d'un livre</h2>
			</div>
			<% } else { %>
			<div class="card-header" style="background-color: #863E54;">
				<h2 class="text-center" style="color: #FFFFFF;">Ajout d'un livre</h2>
			</div>
			<% } %>
			<form method="post" action="">
				<div class="card-body" style="background-color: #6D73A9;">
					<div class="form-floating mb-3">
						<input type="text" name="nomservice" id="nomservice" placeholder="Nom du service" class="form-control"
							value='<%= (leLivre != null ? leLivre.getNomservice() : "") %>'
							style="text-transform: capitalize;">
						<label for="nomservice">Nom du service</label>
					</div>
					<input type="hidden" name="typeservice" value="Livre">
					<div class="form-floating mb-3">
						<input type="tel" name="telservice" id="telservice" maxlength="10" placeholder="Téléphone du service" class="form-control"
							value='<%= (leLivre != null ? leLivre.getTelservice() : "") %>'>
						<label for="telservice">Téléphone du service</label>
					</div>
					<div class="mb-3">
                       <select name="numtrain" class="form-select">
						<% if (leLivre == null) { %>
							<option value="">Train du service</option>
						<% } %>
                           <%
								String chaineTrainLivre = "";
								for (VTrains unTrain : lesTrainsLivres) {
									chaineTrainLivre += "<option value='"+unTrain.getNumtrain()+"'";
									if (leLivre != null && leLivre.getNumtrain() == unTrain.getNumtrain()) { 
										chaineTrainLivre += " selected ";
									}
									chaineTrainLivre += ">";
									chaineTrainLivre += unTrain.getNomtrain();
									chaineTrainLivre += "</option>";
								}
								out.print(chaineTrainLivre);
                           %>
						</select>
					</div>
					<div class="mb-3">
                       <select name="idgare" class="form-select">
						<% if (leLivre == null) { %>
							<option value="">Gare du service</option>
						<% } %>
                           <%
								String chaineGareLivre = "";
								for (VGares uneGare : lesGaresLivres) {
									chaineGareLivre += "<option value='"+uneGare.getIdgare()+"'";
									if (leLivre != null && leLivre.getIdgare() == uneGare.getIdgare()) { 
										chaineGareLivre += " selected ";
									}
									chaineGareLivre += ">";
									chaineGareLivre += uneGare.getNomgare()+" ["+uneGare.getNomville()+ " - "+uneGare.getNompays()+"]";
									chaineGareLivre += "</option>";
								}
								out.print(chaineGareLivre);
                           %>
						</select>
					</div>
					<div class="form-floating mb-3">
						<input type="text" name="reflivre" id="reflivre" maxlength="6" placeholder="Référence du livre (6 chiffres)" class="form-control"
							value='<%= (leLivre != null ? leLivre.getReflivre() : "") %>' onkeypress="return formatRef(event);">
						<label for="reflivre">Référence du livre (6 chiffres)</label>
					</div>
					<div class="form-floating mb-3">
						<input type="text" name="nomlivre" id="nomlivre" placeholder="Nom du livre" class="form-control"
							value='<%= (leLivre != null ? leLivre.getNomlivre() : "") %>'
							style="text-transform: capitalize;">
						<label for="nomlivre">Nom du livre</label>
					</div>
					<div class="form-floating mb-3">
						<input type="text" name="auteur" id="auteur" placeholder="Auteur du livre" class="form-control"
							value='<%= (leLivre != null ? leLivre.getAuteur() : "") %>'
							style="text-transform: capitalize;">
						<label for="auteur">Auteur du livre</label>
					</div>
					<div class="form-floating mb-3">
						<input type="text" name="edition" id="edition" placeholder="Édition du livre" class="form-control"
							value='<%= (leLivre != null ? leLivre.getEdition() : "") %>'
							style="text-transform: capitalize;">
						<label for="edition">Édition du livre</label>
					</div>
					<div class="form-floating mb-3">
						<input type="number" name="nbpages" id="nbpages" placeholder="Nombre de pages" class="form-control"
							value='<%= (leLivre != null ? leLivre.getNbpages() : "") %>'>
						<label for="nbpages">Nombre de pages</label>
					</div>
					<div class="form-floating mb-3">
						<textarea name="resume" id="resume" placeholder="Résumé du livre" class="form-control" style="height: 100px;"><%= (leLivre != null ? leLivre.getResume() : "") %></textarea>
						<!-- SAVE
						<input type="text" name="resume" id="resume" placeholder="Résumé du livre" class="form-control"
							value='<%= (leLivre != null ? leLivre.getResume() : "") %>'
							style="text-transform: capitalize;"> -->
						<label for="resume">Résumé du livre</label>
					</div>
					<div class="mb-3">
						<select name="disponible" class="form-select">
							<% if (leLivre == null) { %>
							<option value="">Disponibilité du livre</option>
							<% } %>
							<option value="true" <% if (leLivre != null && leLivre.getDisponible().equals("true")) {out.print("selected");} %>>
								Disponible
							</option>
							<option value="false" <% if (leLivre != null && leLivre.getDisponible().equals("flase")) {out.print("selected");} %>>
								Non disponible
							</option>
						</select>
					</div>
					<div class="form-floating mb-3">
						<input type="text" name="date_sortie" id="date_sortie" maxlength="10" placeholder="Date de sortie du livre (AAAA-MM-JJ)" class="form-control"
							value='<%= (leLivre != null ? leLivre.getDate_sortie() : "") %>' onkeypress="return formatDate(event);">
						<label for="date_sortie">Date de sortie du livre (AAAA-MM-JJ)</label>
					</div>
				</div>
				<div class="card-footer" style="background-color: #8C8C8C;">
					<div class="row d-flex justify-content-center">
						<div class="col-6">
							<% if (leLivre != null) { %>
							<a href="index.jsp?page=9" class="btn w-100" style="background-color: #4D4444; color: #FFFFFF;">Retour</a>
							<% } else { %>
							<button type="reset" name="Annuler" class="btn w-100" style="background-color: #FF0000; color: #FFFFFF;">
								Annuler
							</button>
							<% } %>
						</div>
						<div class="col-6">
							<% if (leLivre != null) { %>
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
				<%= (leLivre != null ? "<input type='hidden' name='idservice' value='"+leLivre.getIdservice()+"'>" : "") %>
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
