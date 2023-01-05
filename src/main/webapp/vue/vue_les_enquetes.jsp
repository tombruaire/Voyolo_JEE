<div class="container mt-5">
	<div class="row d-flex justify-content-center">
		<div class="col-auto">
			<div class="card" style="color: #D9D9D9;">
				<div class="card-header" style="background-color: #863E54;">
					<h2 class="text-center" style="color: #FFFFFF;">Liste des enqu&#234;tes</h2>
				</div>
				<div class="card-body" style="background-color: #6D73A9;">
					<table class="table text-center text-light">
						<thead>
							<tr>
								<th scope="col">ID</th>
								<th scope="col">Nom</th>
								<th scope="col">Description</th>
								<th scope="col">Création</th>
								<th scope="col">Op&#233;ration</th>
							</tr>
						</thead>
						<tbody style="vertical-align: middle;">
							<%
							String chaineEnquete = "";
							for (VEnquetes uneEnquete : lesEnquetes) {
								chaineEnquete += "<tr><td>" + uneEnquete.getIdenquete() + "</td>";
								chaineEnquete += "<td>" + uneEnquete.getNom_enquete() + "</td>";
								chaineEnquete += "<td>" + uneEnquete.getDescription() + "</td>";
								chaineEnquete += "<td>" + uneEnquete.getDate_creation_enquete() + "</td>";
								chaineEnquete += "<td><a href='index.jsp?page=6&action=edit&idenquete=" + uneEnquete.getIdenquete() + "' class='btn'>";
								chaineEnquete += "<img src='images/edit.png' width='30' height='30' alt=''>";
								chaineEnquete += "</a>";
								chaineEnquete += "<a href='index.jsp?page=6&action=sup&idenquete=" + uneEnquete.getIdenquete()
								+ "' class='btn' onclick='return(confirm(\"Voulez-vous vraiment supprimer cette enquête ?\"));'>";
								chaineEnquete += "<img src='images/delete.png' width='40' height='40' alt=''>";
								chaineEnquete += "</a></td></tr>";
							}
							out.print(chaineEnquete);
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
									onclick="return(confirm('Voulez-vous vraiment supprimer toutes les enquêtes ?'));">
									Supprimer toutes les enqu&#234;tes</button>
							</form>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
