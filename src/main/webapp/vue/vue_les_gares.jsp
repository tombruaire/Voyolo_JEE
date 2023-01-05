<div class="container mt-5">
	<div class="row d-flex justify-content-center">
		<div class="col-auto">
			<div class="card" style="color: #D9D9D9;">
				<div class="card-header" style="background-color: #863E54;">
					<h2 class="text-center" style="color: #FFFFFF;">Liste des gares</h2>
				</div>
				<div class="card-body" style="background-color: #6D73A9;">
					<table class="table text-center text-light">
						<thead>
							<tr>
								<th scope="col">ID</th>
								<th scope="col">Nom</th>
								<th scope="col">Type</th>
								<th scope="col">Pays</th>
								<th scope="col">Ville</th>
								<th scope="col">Op&#233;ration</th>
							</tr>
						</thead>
						<tbody style="vertical-align: middle;">
							<%
							String chaineGare = "";
							for (VGares uneGare : lesGares) {
								chaineGare += "<tr><td>" + uneGare.getIdgare() + "</td>";
								chaineGare += "<td>" + uneGare.getNomgare() + "</td>";
								chaineGare += "<td>" + uneGare.getType() + "</td>";
								chaineGare += "<td>" + uneGare.getNompays() + "</td>";
								chaineGare += "<td>" + uneGare.getNomville() + "</td>";
								chaineGare += "<td><a href='index.jsp?page=8&action=edit&idgare=" + uneGare.getIdgare() + "' class='btn'>";
								chaineGare += "<img src='images/edit.png' width='30' height='30' alt=''>";
								chaineGare += "</a>";
								chaineGare += "<a href='index.jsp?page=8&action=sup&idgare=" + uneGare.getIdgare()
								+ "' class='btn' onclick='return(confirm(\"Voulez-vous vraiment supprimer cette gare ?\"));'>";
								chaineGare += "<img src='images/delete.png' width='40' height='40' alt=''>";
								chaineGare += "</a></td></tr>";
							}
							out.print(chaineGare);
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
									onclick="return(confirm('Voulez-vous vraiment supprimer toutes les gares ?'));">
									Supprimer toutes les gares</button>
							</form>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
