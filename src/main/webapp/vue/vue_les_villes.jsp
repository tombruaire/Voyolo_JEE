<div class="container mt-5">
	<div class="row d-flex justify-content-center">
		<div class="col-auto">
			<div class="card" style="color: #D9D9D9;">
				<div class="card-header" style="background-color: #863E54;">
					<h2 class="text-center" style="color: #FFFFFF;">Liste des villes</h2>
				</div>
				<div class="card-body" style="background-color: #6D73A9;">
					<table class="table text-center text-light">
						<thead>
							<tr>
								<th scope="col">ID</th>
								<th scope="col">Nom</th>
								<th scope="col">Pays</th>
								<th scope="col">Op&#233;ration</th>
							</tr>
						</thead>
						<tbody style="vertical-align: middle;">
							<%
							String chaineVille = "";
							for (VVilles uneVille : lesVilles) {
								chaineVille += "<tr><td>" + uneVille.getIdville() + "</td>";
								chaineVille += "<td>" + uneVille.getNomville() + "</td>";
								chaineVille += "<td>" + uneVille.getNompays() + "</td>";
								chaineVille += "<td><a href='index.jsp?page=15&action=edit&idville=" + uneVille.getIdville() + "' class='btn'>";
								chaineVille += "<img src='images/edit.png' width='30' height='30' alt=''>";
								chaineVille += "</a>";
								chaineVille += "<a href='index.jsp?page=15&action=sup&idville=" + uneVille.getIdville()
								+ "' class='btn' onclick='return(confirm(\"Voulez-vous vraiment supprimer cette ville ?\"));'>";
								chaineVille += "<img src='images/delete.png' width='40' height='40' alt=''>";
								chaineVille += "</a></td></tr>";
							}
							out.print(chaineVille);
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
									onclick="return(confirm('Voulez-vous vraiment supprimer toutes les villes ?'));">
									Supprimer toutes les villes</button>
							</form>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
