<div class="container mt-5">
	<div class="row d-flex justify-content-center">
		<div class="col-auto">
			<div class="card" style="color: #D9D9D9;">
				<div class="card-header" style="background-color: #863E54;">
					<h2 class="text-center" style="color: #FFFFFF;">Liste des réservations</h2>
				</div>
				<div class="card-body" style="background-color: #6D73A9;">
					<table class="table text-center text-light">
						<thead>
							<tr>
								<th scope="col">ID</th>
								<th scope="col">Statut</th>
								<th scope="col">NB Personne</th>
								<th scope="col">Personne</th>
								<th scope="col">Train</th>
								<th scope="col">Op&#233;ration</th>
							</tr>
						</thead>
						<tbody style="vertical-align: middle;">
							<%
							String chaineReservation = "";
							for (VReservations uneReservation : lesReservations) {
								chaineReservation += "<tr><td>" + uneReservation.getIdreservation() + "</td>";
								chaineReservation += "<td>" + uneReservation.getStatut_reservation() + "</td>";
								chaineReservation += "<td>" + uneReservation.getNbpersonne() + "</td>";
								chaineReservation += "<td>" + uneReservation.getPrenom() + " " + uneReservation.getNom() + "</td>";
								chaineReservation += "<td>" + uneReservation.getNomtrain() + "</td>";
								chaineReservation += "<td><a href='index.jsp?page=12&action=edit&idreservation=" + uneReservation.getIdreservation() + "' class='btn'>";
								chaineReservation += "<img src='images/edit.png' width='30' height='30' alt=''>";
								chaineReservation += "</a>";
								chaineReservation += "<a href='index.jsp?page=12&action=sup&idreservation=" + uneReservation.getIdreservation()
								+ "' class='btn' onclick='return(confirm(\"Voulez-vous vraiment supprimer cette réservation ?\"));'>";
								chaineReservation += "<img src='images/delete.png' width='40' height='40' alt=''>";
								chaineReservation += "</a></td></tr>";
							}
							out.print(chaineReservation);
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
									onclick="return(confirm('Voulez-vous vraiment supprimer toutes les réservations ?'));">
									Supprimer toutes les réservations</button>
							</form>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
