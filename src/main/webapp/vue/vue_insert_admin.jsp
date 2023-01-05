<div class="container mt-4 mb-5">
	<div class="row d-flex justify-content-center">
		<div class="card" style="max-width: 35rem;">
			<% if (lAdmin != null) { %>
			<div class="card-header" style="background-color: #6254FF;">
				<h2 class="text-center" style="color: #FFFFFF;">Modification d'un admin</h2>
			</div>
			<% } else { %>
			<div class="card-header" style="background-color: #863E54;">
				<h2 class="text-center" style="color: #FFFFFF;">Ajout d'un admin</h2>
			</div>
			<% } %>
			<form method="post" action="">
				<div class="card-body" style="background-color: #6D73A9;">
					<div class="form-floating mb-3">
						<input type="text" name="nom" id="nom" placeholder="Nom de l'admin" class="form-control"
							value='<%= (lAdmin != null ? lAdmin.getNom() : "") %>'
							style="text-transform: uppercase;">
						<label for="nom">Nom de l'admin</label>
					</div>
					<div class="form-floating mb-3">
						<input type="text" name="prenom" id="prenom" placeholder="Prénom de l'admin" class="form-control"
							value='<%= (lAdmin != null ? lAdmin.getPrenom() : "") %>'
							style="text-transform: capitalize;">
						<label for="prenom">Prénom de l'admin</label>
					</div>
					<div class="form-floating mb-3">
						<input type="text" name="pseudo" id="pseudo" placeholder="Pseudo de l'admin" class="form-control"
							value='<%= (lAdmin != null ? lAdmin.getPseudo() : "") %>'>
						<label for="pseudo">Pseudo de l'admin</label>
					</div>
					<div class="form-floating mb-3">
						<input type="email" name="email" id="email" placeholder="Email de l'admin" class="form-control"
							value='<%= (lAdmin != null ? lAdmin.getEmail() : "") %>'>
						<label for="email">Email de l'admin</label>
					</div>
					<div class="form-floating mb-3">
						<% if (lAdmin != null) { %>
						<input type="password" name="mdp" id="mdp" placeholder="Redéfinir le mot de passe" class="form-control">
						<label for="mdp">Redéfinir le mot de passe</label>
						<% } else { %>
						<input type="password" name="mdp" id="mdp" placeholder="Mot de passe de l'admin" class="form-control">
						<label for="mdp">Mot de passe de l'admin</label>
						<% } %>
					</div>
					<div class="mb-3">
						<select name="role" class="form-select">
							<% if (lAdmin == null) { %>
							<option value="">Rôle de l'admin</option>
							<% } %>
							<option value="client" <% if (lAdmin != null && lAdmin.getRole().equals("client")) {out.print("selected");} %>>
								Client
							</option>
							<option value="admin" <% if (lAdmin != null && lAdmin.getRole().equals("admin")) {out.print("selected");} %>>
								Administrateur
							</option>
						</select>
					</div>
					<div class="form-floating mb-3">
						<input type="text" name="num_identification" id="num_identification" maxlength="8" placeholder="Numéro d'identification (8 chiffres)" class="form-control"
							value='<%= (lAdmin != null ? lAdmin.getNum_identification() : "") %>' onkeypress="return formatRef(event);">
						<label for="num_identification">Numéro d'identification (8 chiffres)</label>
					</div>
					<div class="mb-3">
						<select name="type" class="form-select">
							<% if (lAdmin == null) { %>
							<option value="">Type d'admin</option>
							<% } %>
							<option value="modo" <% if (lAdmin != null && lAdmin.getType().equals("modo")) {out.print("selected");} %>>
								Modérateur
							</option>
							<option value="admin" <% if (lAdmin != null && lAdmin.getType().equals("admin")) {out.print("selected");} %>>
								<%= (lAdmin != null ? lAdmin.getType() : "Administrateur") %>
							</option>
						</select>
					</div>
				</div>
				<div class="card-footer" style="background-color: #8C8C8C;">
					<div class="row d-flex justify-content-center">
						<div class="col-6">
							<% if (lAdmin != null) { %>
							<a href="index.jsp?page=2" class="btn w-100" style="background-color: #4D4444; color: #FFFFFF;">Retour</a>
							<% } else { %>
							<button type="reset" name="Annuler" class="btn w-100" style="background-color: #FF0000; color: #FFFFFF;">
								Annuler
							</button>
							<% } %>
						</div>
						<div class="col-6">
							<% if (lAdmin != null) { %>
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
				<%= (lAdmin != null ? "<input type='hidden' name='idu' value='"+lAdmin.getIdu()+"'>" : "") %>
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
	
	// Suppression des espaces pour le numéro d'identification
	$("input#num_identification").on({
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
