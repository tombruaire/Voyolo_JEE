<div class="container mt-4 mb-5">
	<div class="row d-flex justify-content-center">
		<div class="card" style="max-width: 35rem;">
			<% if (laConsommation != null) { %>
			<div class="card-header" style="background-color: #6254FF;">
				<h2 class="text-center" style="color: #FFFFFF;">Modification d'une consommation</h2>
			</div>
			<% } else { %>
			<div class="card-header" style="background-color: #863E54;">
				<h2 class="text-center" style="color: #FFFFFF;">Ajout d'une consommation</h2>
			</div>
			<% } %>
			<form method="post" action="">
				<div class="card-body" style="background-color: #6D73A9;">
					<div class="form-floating mb-3">
						<input type="text" name="nomservice" id="nomservice" placeholder="Nom du service" class="form-control"
							value='<%= (laConsommation != null ? laConsommation.getNomservice() : "") %>'
							style="text-transform: capitalize;">
						<label for="nomservice">Nom du service</label>
					</div>
					<input type="hidden" name="typeservice" value="Consommations">
					<div class="form-floating mb-3">
						<input type="tel" name="telservice" id="telservice" maxlength="10" placeholder="Téléphone du service" class="form-control"
							value='<%= (laConsommation != null ? laConsommation.getTelservice() : "") %>'>
						<label for="telservice">Téléphone du service</label>
					</div>
					<div class="mb-3">
                       <select name="numtrain" class="form-select">
						<% if (laConsommation == null) { %>
							<option value="">Train du service</option>
						<% } %>
                           <%
								String chaineTrainConsommation = "";
								for (VTrains unTrain : lesTrainsConsommations) {
									chaineTrainConsommation += "<option value='"+unTrain.getNumtrain()+"'";
									if (laConsommation != null && laConsommation.getNumtrain() == unTrain.getNumtrain()) { 
										chaineTrainConsommation += " selected ";
									}
									chaineTrainConsommation += ">";
									chaineTrainConsommation += unTrain.getNomtrain();
									chaineTrainConsommation += "</option>";
								}
								out.print(chaineTrainConsommation);
                           %>
						</select>
					</div>
					<div class="mb-3">
                       <select name="idgare" class="form-select">
						<% if (laConsommation == null) { %>
							<option value="">Gare du service</option>
						<% } %>
                           <%
								String chaineGareConsommation = "";
								for (VGares uneGare : lesGaresConsommations) {
									chaineGareConsommation += "<option value='"+uneGare.getIdgare()+"'";
									if (laConsommation != null && laConsommation.getIdgare() == uneGare.getIdgare()) { 
										chaineGareConsommation += " selected ";
									}
									chaineGareConsommation += ">";
									chaineGareConsommation += uneGare.getNomgare()+" ["+uneGare.getNomville()+ " - "+uneGare.getNompays()+"]";
									chaineGareConsommation += "</option>";
								}
								out.print(chaineGareConsommation);
                           %>
						</select>
					</div>
					<div class="form-floating mb-3">
						<input type="text" name="refarticle" id="refarticle" maxlength="6" placeholder="Référence de l'article (6 chiffres)" class="form-control"
							value='<%= (laConsommation != null ? laConsommation.getRefarticle() : "") %>' onkeypress="return formatRef(event);">
						<label for="refarticle">Référence de l'article (6 chiffres)</label>
					</div>
					<div class="form-floating mb-3">
						<input type="text" name="article" id="article" placeholder="Nom de l'article" class="form-control"
							value='<%= (laConsommation != null ? laConsommation.getArticle() : "") %>'
							style="text-transform: capitalize;">
						<label for="article">Nom de l'article</label>
					</div>
					<div class="form-floating mb-3">
						<input type="text" name="prix" id="prix" placeholder="Prix de l'article" class="form-control"
							value='<%= (laConsommation != null ? laConsommation.getPrix() : "") %>' onkeypress="return formatPrix(event);">
						<label for="prix">Prix de l'article</label>
					</div>
					<div class="form-floating mb-3">
						<input type="number" name="quantite" id="quantite" placeholder="Quantité de l'article" class="form-control"
							value='<%= (laConsommation != null ? laConsommation.getQuantite() : "") %>'>
						<label for="quantite">Quantité de l'article</label>
					</div>
					<div class="form-floating mb-3">
						<input type="text" name="description" id="description" placeholder="Description de l'article" class="form-control"
							value='<%= (laConsommation != null ? laConsommation.getDescription() : "") %>'
							style="text-transform: capitalize;">
						<label for="description">Description de l'article</label>
					</div>
					<div class="form-floating mb-3">
						<input type="text" name="date_expiration" id="date_expiration" maxlength="10" placeholder="Date d'expiration de l'article (AAAA-MM-JJ)" class="form-control"
							value='<%= (laConsommation != null ? laConsommation.getDate_expiration() : "") %>' onkeypress="return formatDate(event);">
						<label for="date_expiration">Date d'expiration de l'article (AAAA-MM-JJ)</label>
					</div>
				</div>
				<div class="card-footer" style="background-color: #8C8C8C;">
					<div class="row d-flex justify-content-center">
						<div class="col-6">
							<% if (laConsommation != null) { %>
							<a href="index.jsp?page=4" class="btn w-100" style="background-color: #4D4444; color: #FFFFFF;">Retour</a>
							<% } else { %>
							<button type="reset" name="Annuler" class="btn w-100" style="background-color: #FF0000; color: #FFFFFF;">
								Annuler
							</button>
							<% } %>
						</div>
						<div class="col-6">
							<% if (laConsommation != null) { %>
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
				<%= (laConsommation != null ? "<input type='hidden' name='idservice' value='"+laConsommation.getIdservice()+"'>" : "") %>
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
	
	// Suppression des espaces pour le prix de l'article
	$("input#prix").on({
		keydown: function(e) {
			if (e.which === 32)
				return false
		},
		change: function() {
			this.value = this.value.replace(/\s/g, "");
		}
	});
	
	// Suppression des espaces pour l'adresse email
	$("input#email").on({
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
function formatPrix(event) {
    var regex = new RegExp("^[0-9.]");
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
