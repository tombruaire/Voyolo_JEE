<div class="container mt-5">
	<div class="row d-flex justify-content-center">
		<div class="col-auto">
			<div class="card" style="color: #D9D9D9;">
				<div class="card-header" style="background-color: #863E54;">
					<h2 class="text-center" style="color: #FFFFFF;">Liste des films</h2>
				</div>
				<div class="card-body" style="background-color: #6D73A9;">
					<table class="table text-center text-light">
						<thead>
							<tr>
								<th scope="col">ID</th>
								<th scope="col">Service</th>
								<th scope="col">Film</th>
								<th scope="col">R&#233;f&#233;rence</th>
								<th scope="col">Réalisateur</th>
								<th scope="col">Dur&#233;e</th>
								<th scope="col">Disponible</th>
								<th scope="col">Sortie le</th>
								<th scope="col">Op&#233;ration</th>
							</tr>
						</thead>
						<tbody style="vertical-align: middle;">
							<%
							String chaineFilm = "";
							for (VFilms unFilm : lesFilms) {
								chaineFilm += "<tr><td>" + unFilm.getIdservice() + "</td>";
								chaineFilm += "<td>" + unFilm.getNomservice() + "</td>";
								chaineFilm += "<td>" + unFilm.getNomfilm() + "</td>";
								chaineFilm += "<td>" + unFilm.getReffilm() + "</td>";
								chaineFilm += "<td>" + unFilm.getRealisateur() + "</td>";
								chaineFilm += "<td>" + unFilm.getDuree() + "</td>";
								if (unFilm.getDisponible().equals("true")) {
									chaineFilm += "<td>Oui</td>";
								} else if (unFilm.getDisponible().equals("false")) {
									chaineFilm += "<td>Non</td>";
								}
								chaineFilm += "<td>" + unFilm.getDate_sortie() + "</td>";
								chaineFilm += "<td><a href='index.jsp?page=7&action=edit&idservice=" + unFilm.getIdservice()
								+ "&reffilm=" + unFilm.getReffilm() + "' class='btn'>";
								chaineFilm += "<img src='images/edit.png' width='30' height='30' alt=''>";
								chaineFilm += "</a>";
								chaineFilm += "<a href='index.jsp?page=7&action=sup&idservice=" + unFilm.getIdservice()
								+ "&reffilm=" + unFilm.getReffilm()
								+ "' class='btn' onclick='return(confirm(\"Voulez-vous vraiment supprimer ce film ?\"));'>";
								chaineFilm += "<img src='images/delete.png' width='40' height='40' alt=''>";
								chaineFilm += "</a></td></tr>";
							}
							out.print(chaineFilm);
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
									onclick="return(confirm('Voulez-vous vraiment supprimer tous les films ?'));">
									Supprimer tous les films</button>
							</form>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
