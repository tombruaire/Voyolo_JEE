<div class="container mt-5">
	<div class="row d-flex justify-content-center">
		<div class="col-auto">
			<div class="card" style="color: #D9D9D9;">
				<div class="card-header" style="background-color: #863E54;">
					<h2 class="text-center" style="color: #FFFFFF;">Liste des trajets</h2>
				</div>
				<div class="card-body" style="background-color: #6D73A9;">
					<table class="table text-center text-light">
						<thead>
							<tr>
								<th scope="col">ID</th>
								<th scope="col">Train</th>
								<th scope="col">D&#233;part</th>
								<th scope="col">Date</th>
								<th scope="col">Heure</th>
								<th scope="col">Arriv&#233;e</th>
								<th scope="col">Date</th>
								<th scope="col">Heure</th>
								<th scope="col">Durée</th>
								<th scope="col">Prix</th>
								<th scope="col">Quai</th>
								<th scope="col">Op&#233;ration</th>
							</tr>
						</thead>
						<tbody style="vertical-align: middle;">
							<%
							String chaineTrajet = "";
							for (VTrajets unTrajet : lesTrajets) {
								chaineTrajet += "<tr><td>" + unTrajet.getIdtrajet() + "</td>";
								chaineTrajet += "<td>" + unTrajet.getNomtrain() + "</td>";
								chaineTrajet += "<td>" + unTrajet.getGare_depart() + "</td>";
								chaineTrajet += "<td>" + unTrajet.getDate_depart() + "</td>";
								chaineTrajet += "<td>" + unTrajet.getHeure_depart() + " &#8364;</td>";
								chaineTrajet += "<td>" + unTrajet.getGare_arrivee() + "</td>";
								chaineTrajet += "<td>" + unTrajet.getDate_arrivee() + "</td>";
								chaineTrajet += "<td>" + unTrajet.getHeure_arrivee() + "</td>";
								chaineTrajet += "<td>" + unTrajet.getDuree() + "</td>";
								chaineTrajet += "<td>" + unTrajet.getPrix() + " &#8364;</td>";
								chaineTrajet += "<td>" + unTrajet.getQuai() + "</td>";
								chaineTrajet += "<td><a href='index.jsp?page=14&action=edit&idtrajet=" + unTrajet.getIdtrajet() + "' class='btn'>";
								chaineTrajet += "<img src='images/edit.png' width='30' height='30' alt=''>";
								chaineTrajet += "</a>";
								chaineTrajet += "<a href='index.jsp?page=14&action=sup&idtrajet=" + unTrajet.getIdtrajet()
								+ "' class='btn' onclick='return(confirm(\"Voulez-vous vraiment supprimer ce trajet ?\"));'>";
								chaineTrajet += "<img src='images/delete.png' width='40' height='40' alt=''>";
								chaineTrajet += "</a></td></tr>";
							}
							out.print(chaineTrajet);
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
									onclick="return(confirm('Voulez-vous vraiment supprimer tous les trajets ?'));">
									Supprimer toutes es trajets</button>
							</form>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
