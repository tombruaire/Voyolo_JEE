<div class="container mt-5">
	<div class="row d-flex justify-content-center">
		<div class="col-auto">
			<div class="card" style="color: #D9D9D9;">
				<div class="card-header" style="background-color: #863E54;">
					<h2 class="text-center" style="color: #FFFFFF;">Liste des consommations</h2>
				</div>
				<div class="card-body" style="background-color: #6D73A9;">
					<table class="table text-center text-light">
						<thead>
							<tr>
								<th scope="col">ID</th>
								<th scope="col">Service</th>
								<th scope="col">Article</th>
								<th scope="col">R&#233;f&#233;rence</th>
								<th scope="col">Prix</th>
								<th scope="col">Quantit&#233;</th>
								<th scope="col">Expiration</th>
								<th scope="col">Ajout</th>
								<th scope="col">Op&#233;ration</th>
							</tr>
						</thead>
						<tbody style="vertical-align: middle;">
							<%
							String chaineConsommation = "";
							for (VConsommations uneConsommation : lesConsommations) {
								chaineConsommation += "<tr><td>" + uneConsommation.getIdservice() + "</td>";
								chaineConsommation += "<td>" + uneConsommation.getNomservice() + "</td>";
								chaineConsommation += "<td>" + uneConsommation.getArticle() + "</td>";
								chaineConsommation += "<td>" + uneConsommation.getRefarticle() + "</td>";
								chaineConsommation += "<td>" + uneConsommation.getPrix() + " &#8364;</td>";
								chaineConsommation += "<td>" + uneConsommation.getQuantite() + "</td>";
								chaineConsommation += "<td>" + uneConsommation.getDate_expiration() + "</td>";
								chaineConsommation += "<td>" + uneConsommation.getDate_ajout() + "</td>";
								chaineConsommation += "<td><a href='index.jsp?page=4&action=edit&idservice=" + uneConsommation.getIdservice()
								+ "&refarticle=" + uneConsommation.getRefarticle() + "' class='btn'>";
								chaineConsommation += "<img src='images/edit.png' width='30' height='30' alt=''>";
								chaineConsommation += "</a>";
								chaineConsommation += "<a href='index.jsp?page=4&action=sup&idservice=" + uneConsommation.getIdservice()
								+ "&refarticle=" + uneConsommation.getRefarticle()
								+ "' class='btn' onclick='return(confirm(\"Voulez-vous vraiment supprimer cette consommation ?\"));'>";
								chaineConsommation += "<img src='images/delete.png' width='40' height='40' alt=''>";
								chaineConsommation += "</a></td></tr>";
							}
							out.print(chaineConsommation);
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
									onclick="return(confirm('Voulez-vous vraiment supprimer toutes les consommations ?'));">
									Supprimer toutes les consommations</button>
							</form>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
