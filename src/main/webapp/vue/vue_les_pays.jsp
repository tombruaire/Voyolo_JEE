<div class="container mt-5">
	<div class="row d-flex justify-content-center">
		<div class="col-auto">
			<div class="card" style="color: #D9D9D9;">
				<div class="card-header" style="background-color: #863E54;">
					<h2 class="text-center" style="color: #FFFFFF;">Liste des pays</h2>
				</div>
				<div class="card-body" style="background-color: #6D73A9;">
					<table class="table text-center text-light">
					    <thead>
					        <tr>
					            <th scope="col">ID</th>
					            <th scope="col">Nom</th>
					            <th scope="col">Opération</th>
					        </tr>
					    </thead>
					    <tbody style="vertical-align: middle;">
					        <%
								String chainePays = "";
								for (Pays unPays : lesPays) {
									chainePays += "<tr><td>"+unPays.getIdpays()+"</td>";
									chainePays += "<td>"+unPays.getNompays()+"</td>";
									chainePays += "<td><a href='index.jsp?page=10&action=edit&idpays="+unPays.getIdpays()+"' class='btn'>";
									chainePays += "<img src='images/edit.png' width='30' height='30' alt=''>";
									chainePays += "</a>";
									chainePays += "<a href='index.jsp?page=10&action=sup&idpays="+unPays.getIdpays()+"' class='btn' onclick='return(confirm(\"Voulez-vous vraiment supprimer ce pays ?\"));'>";
									chainePays += "<img src='images/delete.png' width='40' height='40' alt=''>";
									chainePays += "</a></td></tr>";
								}
								out.print(chainePays);
							%>
					    </tbody>
					</table>
				</div>
				<div class="card-footer" style="background-color: #8C8C8C;">
					<div class="row d-flex justify-content-center">
						<div class="col-auto">
							<form method="post" action="">
								<button type="submit" name="deleteAll" class="btn btn-lg text-light mt-2 mb-2" style="background-color: #C53939;"
									onclick="return(confirm('Voulez-vous vraiment supprimer tous les pays ?'));">
									Supprimer tous les pays
								</button>
							</form>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
