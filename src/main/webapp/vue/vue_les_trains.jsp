<div class="container mt-5">
	<div class="row d-flex justify-content-center">
		<div class="col-auto">
			<div class="card" style="color: #D9D9D9;">
				<div class="card-header" style="background-color: #863E54;">
					<h2 class="text-center" style="color: #FFFFFF;">Liste des trains</h2>
				</div>
				<div class="card-body" style="background-color: #6D73A9;">
					<table class="table text-center text-light">
						<thead>
							<tr>
								<th scope="col">ID</th>
								<th scope="col">Nom</th>
								<th scope="col">NB Wagons</th>
								<th scope="col">Cr&#233;ation</th>
								<th scope="col">Op&#233;ration</th>
							</tr>
						</thead>
						<tbody style="vertical-align: middle;">
							<%
							String chaineTrain = "";
							for (VTrains unTrain : lesTrains) {
								chaineTrain += "<tr><td>" + unTrain.getNumtrain() + "</td>";
								chaineTrain += "<td>" + unTrain.getNomtrain() + "</td>";
								chaineTrain += "<td>" + unTrain.getNbwagon() + "</td>";
								chaineTrain += "<td>" + unTrain.getDate_creation_train() + "</td>";
								chaineTrain += "<td><a href='index.jsp?page=13&action=edit&numtrain=" + unTrain.getNumtrain() + "' class='btn'>";
								chaineTrain += "<img src='images/edit.png' width='30' height='30' alt=''>";
								chaineTrain += "</a>";
								chaineTrain += "<a href='index.jsp?page=13&action=sup&numtrain=" + unTrain.getNumtrain()
								+ "' class='btn' onclick='return(confirm(\"Voulez-vous vraiment supprimer ce train ?\"));'>";
								chaineTrain += "<img src='images/delete.png' width='40' height='40' alt=''>";
								chaineTrain += "</a></td></tr>";
							}
							out.print(chaineTrain);
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
									onclick="return(confirm('Voulez-vous vraiment supprimer tous les trains ?'));">
									Supprimer tous les trains</button>
							</form>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
