<div class="container mt-4">
	<div class="row d-flex justify-content-center">
		<div class="col-xxl-5">
			<div class="card">
				<div class="card-header">
					<h3 class="text-center text-dark">Connexion au site VOYOLO</h3>
				</div>
				<form method="post" action="">
					<div class="card-body">
						<div class="form-floating mb-3">
							<input type="email" name="email" placeholder="Adresse email" class="form-control"
								value="tom.bruaire@gmail.com">
							<!-- SAVE
							<input type="email" name="email" placeholder="Adresse email" class="form-control"
								value='<% if (request.getParameter("email") != null) {out.print(request.getParameter("email"));} %>'>
							-->
							<label for="nom">Adresse email</label>
						</div>
						<div class="form-floating mb-3">
							<input type="password" name="mdp" placeholder="Mot de passe" class="form-control" value="Azerty123">
							<label for="nom">Mot de passe</label>
						</div>	
					</div>
					<div class="card-footer">
						<div class="row d-flex justify-content-center">
							<div class="col-6">
								<button type="reset" class="btn btn-danger w-100">Annuler</button>
							</div>
							<div class="col-6">
								<button type="submit" name="Connexion" class="btn btn-success w-100">Connexion</button>
							</div>
						</div>
					</div>
				</form>
			</div>
		</div>
	</div>
</div>