<div class="container mt-5">
	<div class="row d-flex justify-content-center">
		<div class="col-auto">
			<div class="card" style="color: #D9D9D9;">
				<div class="card-header" style="background-color: #863E54;">
					<h2 class="text-center" style="color: #FFFFFF;">Liste des livres</h2>
				</div>
				<div class="card-body" style="background-color: #6D73A9;">
					<table class="table text-center text-light">
						<thead>
							<tr>
								<th scope="col">ID</th>
								<th scope="col">Service</th>
								<th scope="col">Livre</th>
								<th scope="col">R&#233;f&#233;rence</th>
								<th scope="col">Auteur</th>
								<th scope="col">&#201;dition</th>
								<th scope="col">NB Pages</th>
								<th scope="col">Disponible</th>
								<th scope="col">Sortie le</th>
								<th scope="col">Op&#233;ration</th>
							</tr>
						</thead>
						<tbody style="vertical-align: middle;">
							<%
							String chaineLivre = "";
							for (VLivres unLivre : lesLivres) {
								chaineLivre += "<tr><td>" + unLivre.getIdservice() + "</td>";
								chaineLivre += "<td>" + unLivre.getNomservice() + "</td>";
								chaineLivre += "<td>" + unLivre.getNomlivre() + "</td>";
								chaineLivre += "<td>" + unLivre.getReflivre() + "</td>";
								chaineLivre += "<td>" + unLivre.getAuteur() + "</td>";
								chaineLivre += "<td>" + unLivre.getEdition() + "</td>";
								chaineLivre += "<td>" + unLivre.getNbpages() + " pages</td>";
								if (unLivre.getDisponible().equals("true")) {
									chaineLivre += "<td>Oui</td>";
								} else if (unLivre.getDisponible().equals("false")) {
									chaineLivre += "<td>Non</td>";
								}
								chaineLivre += "<td>" + unLivre.getDate_sortie() + "</td>";
								chaineLivre += "<td><a href='index.jsp?page=9&action=edit&idservice=" + unLivre.getIdservice()
								+ "&reflivre=" + unLivre.getReflivre() + "' class='btn'>";
								chaineLivre += "<img src='images/edit.png' width='30' height='30' alt=''>";
								chaineLivre += "</a>";
								chaineLivre += "<a href='index.jsp?page=9&action=sup&idservice=" + unLivre.getIdservice()
								+ "&reflivre=" + unLivre.getReflivre()
								+ "' class='btn' onclick='return(confirm(\"Voulez-vous vraiment supprimer ce livre ?\"));'>";
								chaineLivre += "<img src='images/delete.png' width='40' height='40' alt=''>";
								chaineLivre += "</a></td></tr>";
							}
							out.print(chaineLivre);
							%>
						</tbody>
					</table>
				</div>
				<div class="card-footer" style="background-color: #8C8C8C;">
					<div class="row d-flex justify-content-center">
						<div class="col-auto">
							<form method="post" action="">
								<button type="submit" name="deleteAll"
									class="btn btn-lg text-light mt-2 mb-2"
									style="background-color: #C53939;"
									onclick="return(confirm('Voulez-vous vraiment supprimer tous les livres ?'));">
									Supprimer tous les livres</button>
							</form>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
