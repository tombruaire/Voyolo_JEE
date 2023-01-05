<div class="container mt-4 mb-5">
	<div class="row d-flex justify-content-center">
		<div class="card" style="max-width: 35rem;">
			<% if (leClient != null) { %>
			<div class="card-header" style="background-color: #6254FF;">
				<h2 class="text-center" style="color: #FFFFFF;">Modification d'un client</h2>
			</div>
			<% } else { %>
			<div class="card-header" style="background-color: #863E54;">
				<h2 class="text-center" style="color: #FFFFFF;">Ajout d'un client</h2>
			</div>
			<% } %>
			<form method="post" action="">
				<div class="card-body" style="background-color: #6D73A9;">
					<div class="form-floating mb-3">
						<input type="text" name="nom" id="nom" placeholder="Nom du client" class="form-control"
							value='<%= (leClient != null ? leClient.getNom() : "") %>'
							style="text-transform: uppercase;">
						<label for="nom">Nom du client</label>
					</div>
					<div class="form-floating mb-3">
						<input type="text" name="prenom" id="prenom" placeholder="Prénom du client" class="form-control"
							value='<%= (leClient != null ? leClient.getPrenom() : "") %>'
							style="text-transform: capitalize;">
						<label for="prenom">Prénom du client</label>
					</div>
					<div class="form-floating mb-3">
						<input type="text" name="pseudo" id="pseudo" placeholder="Pseudo du client" class="form-control"
							value='<%= (leClient != null ? leClient.getPseudo() : "") %>'>
						<label for="pseudo">Pseudo du client</label>
					</div>
					<div class="form-floating mb-3">
						<input type="email" name="email" id="email" placeholder="Email du client" class="form-control"
							value='<%= (leClient != null ? leClient.getEmail() : "") %>'>
						<label for="email">Email du client</label>
					</div>
					<div class="form-floating mb-3">
						<% if (leClient != null) { %>
						<input type="password" name="mdp" id="mdp" placeholder="Redéfinir le mot de passe" class="form-control">
						<label for="mdp">Redéfinir le mot de passe</label>
						<% } else { %>
						<input type="password" name="mdp" id="mdp" placeholder="Mot de passe du client" class="form-control">
						<label for="mdp">Mot de passe du client</label>
						<% } %>
					</div>
					<div class="mb-3">
						<select name="role" class="form-select">
							<% if (leClient == null) { %>
							<option value="">Rôle du client</option>
							<% } %>
							<option value="client" <% if (leClient != null && leClient.getRole().equals("client")) {out.print("selected");} %>>
								Client
							</option>
							<option value="admin" <% if (leClient != null && leClient.getRole().equals("admin")) {out.print("selected");} %>>
								Administrateur
							</option>
						</select>
					</div>
					<div class="form-floating mb-3">
						<input type="text" name="date_naissance" id="date_naissance" maxlength="10" placeholder="Date de naissance du client (AAAA-MM-JJ)" class="form-control"
							value='<%= (leClient != null ? leClient.getDate_naissance() : "") %>' onkeypress="return formatDate(event);">
						<label for="date_naissance">Date de naissance du client (AAAA-MM-JJ)</label>
					</div>
					<div class="form-floating mb-3">
						<input type="tel" name="tel" id="tel" maxlength="10" placeholder="Téléphone du client" class="form-control"
							value='<%= (leClient != null ? leClient.getTel() : "") %>'>
						<label for="tel">Téléphone du client</label>
					</div>
					<div class="form-floating mb-3">
						<input type="text" name="adresse" id="adresse" placeholder="Adresse du client" class="form-control"
							value='<%= (leClient != null ? leClient.getAdresse() : "") %>'>
						<label for="adresse">Adresse du client</label>
					</div>
					<div class="mb-3">
						<select name="carte_avantage" class="form-select">
							<% if (leClient == null) { %>
							<option value="">Carte avantage du client</option>
							<% } %>
							<option value="Avantage famille" <% if (leClient != null && leClient.getCarte_avantage().equals("Avantage famille")) {out.print("selected");} %>>
								Avantage famille
							</option>
							<option value="Avantage week-end" <% if (leClient != null && leClient.getCarte_avantage().equals("Avantage week-end")) {out.print("selected");} %>>
								Avantage week-end
							</option>
							<option value="Avantage jeune 10-30 ans" <% if (leClient != null && leClient.getCarte_avantage().equals("Avantage jeune 10-30 ans")) {out.print("selected");} %>>
								Avantage jeune 10-30 ans
							</option>
							<option value="Avantage senior 60 ans et plus" <% if (leClient != null && leClient.getCarte_avantage().equals("Avantage senior 60 ans et plus")) {out.print("selected");} %>>
								Avantage senior 60 ans et plus
							</option>
						</select>
					</div>
				</div>
				<div class="card-footer" style="background-color: #8C8C8C;">
					<div class="row d-flex justify-content-center">
						<div class="col-6">
							<% if (leClient != null) { %>
							<a href="index.jsp?page=3" class="btn w-100" style="background-color: #4D4444; color: #FFFFFF;">Retour</a>
							<% } else { %>
							<button type="reset" name="Annuler" class="btn w-100" style="background-color: #FF0000; color: #FFFFFF;">
								Annuler
							</button>
							<% } %>
						</div>
						<div class="col-6">
							<% if (leClient != null) { %>
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
				<%= (leClient != null ? "<input type='hidden' name='idu' value='"+leClient.getIdu()+"'>" : "") %>
			</form>
		</div>
	</div>
</div>

<!-- SUPPRESSION DES ESPACES -->
<script type="text/javascript">

	// Suppression des espaces pour le nom
	$("input#nom").on({
		keydown: function(e) {
			if (e.which === 32)
				return false
		},
		change: function() {
			this.value = this.value.replace(/\s/g, "");
		}
	});

	// Suppression des espaces pour le prénom
	$("input#prenom").on({
		keydown: function(e) {
			if (e.which === 32)
				return false
		},
		change: function() {
			this.value = this.value.replace(/\s/g, "");
		}
	});
	
	// Suppression des espaces pour le pseudo
	$("input#pseudo").on({
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
	
	// Suppression des espaces pour la date de naissance
	$("input#date_naissance").on({
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

<!-- SUPPRESSION DES LETTRES DANS LE INPUT TEL -->
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
	
	onlyNumber(document.getElementById("tel"), function(value) {
  		return /^\d*?\d*$/.test(value); // Allow digits and '.' only, using a RegExp
	});

</script>
<!-- / SUPPRESSION DES LETTRES DANS LE INPUT DATE_NAISSANCE -->

<script type="text/javascript">
function formatDate(event) {
    var regex = new RegExp("^[0-9-]");
    var key = String.fromCharCode(event.charCode ? event.which : event.charCode);
    if (!regex.test(key)) {
        event.preventDefault();
        return false;
    }
}
</script>



