<div class="container mt-5">
	<div class="row d-flex justify-content-center">
		<div class="col-auto">
			<div class="card" style="color: #D9D9D9;">
				<div class="card-header" style="background-color: #863E54;">
					<h2 class="text-center" style="color: #FFFFFF;">Liste des &#233;nergies consomm&#233;es par les trains</h2>
				</div>
				<div class="card-body" style="background-color: #6D73A9;">
					<table class="table text-center text-light">
						<thead>
							<tr>
								<th scope="col">ID</th>
								<th scope="col">Train</th>
								<th scope="col">&#201;nergies consomm&#233;es</th>
								<th scope="col">Op&#233;ration</th>
							</tr>
						</thead>
						<tbody style="vertical-align: middle;">
							<%
							String chaineEnergie = "";
							for (VEnergies uneEnergie : lesEnergies) {
								chaineEnergie += "<tr><td>" + uneEnergie.getIdenergie() + "</td>";
								chaineEnergie += "<td>" + uneEnergie.getNomtrain() + "</td>";
								chaineEnergie += "<td>" + uneEnergie.getEnergie_consommee() + "</td>";
								chaineEnergie += "<td><a href='index.jsp?page=5&action=edit&idenergie=" + uneEnergie.getIdenergie() + "&numtrain=" + uneEnergie.getNumtrain() + "' class='btn'>";
								chaineEnergie += "<img src='images/edit.png' width='30' height='30' alt=''>";
								chaineEnergie += "</a>";
								chaineEnergie += "<a href='index.jsp?page=5&action=sup&idenergie=" + uneEnergie.getIdenergie()
								+ "&numtrain=" + uneEnergie.getNumtrain() + "' class='btn' onclick='return(confirm(\"Voulez-vous vraiment supprimer cette consommation d\'énergie ?\"));'>";
								chaineEnergie += "<img src='images/delete.png' width='40' height='40' alt=''>";
								chaineEnergie += "</a></td></tr>";
							}
							out.print(chaineEnergie);
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
									onclick="return(confirm('Voulez-vous vraiment supprimer toutes les consommations d\'énergies ?'));">
									Supprimer toutes les consommations d'&#233;nergies</button>
							</form>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
