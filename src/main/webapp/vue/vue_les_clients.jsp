<div class="container mt-5">
	<div class="row d-flex justify-content-center">
		<div class="col-auto">
			<div class="card" style="color: #D9D9D9;">
				<div class="card-header" style="background-color: #863E54;">
					<h2 class="text-center" style="color: #FFFFFF;">Liste des clients</h2>
				</div>
				<div class="card-body" style="background-color: #6D73A9;">
					<table class="table text-center text-light">
					    <thead>
					        <tr>
					            <th scope="col">ID</th>
					            <th scope="col">Nom</th>
					            <th scope="col">Prénom</th>
					            <th scope="col">Pseudo</th>
					            <th scope="col">Email</th>
					            <th scope="col">DateNaissance</th>
					            <th scope="col">Téléphone</th>
					            <th scope="col">CarteAvantage</th>
					            <th scope="col">Opération</th>
					        </tr>
					    </thead>
					    <tbody style="vertical-align: middle;">
					        <%
								String chaineClient = "";
								for (VClients unClient : lesClients) {
									chaineClient += "<tr><td>"+unClient.getIdu()+"</td>";
									chaineClient += "<td>"+unClient.getNom()+"</td>";
									chaineClient += "<td>"+unClient.getPrenom()+"</td>";
									chaineClient += "<td>"+unClient.getPseudo()+"</td>";
									chaineClient += "<td>"+unClient.getEmail()+"</td>";
									chaineClient += "<td>"+unClient.getDate_naissance()+"</td>";
									chaineClient += "<td>"+unClient.getTel()+"</td>";
									chaineClient += "<td>"+unClient.getCarte_avantage()+"</td>";
									chaineClient += "<td><a href='index.jsp?page=3&action=edit&idu="+unClient.getIdu()+"' class='btn'>";
									chaineClient += "<img src='images/edit.png' width='30' height='30' alt=''>";
									chaineClient += "</a>";
									chaineClient += "<a href='index.jsp?page=3&action=sup&idu="+unClient.getIdu()+"' class='btn' onclick='return(confirm(\"Voulez-vous vraiment supprimer ce client ?\"));'>";
									chaineClient += "<img src='images/delete.png' width='40' height='40' alt=''>";
									chaineClient += "</a></td></tr>";
								}
								out.print(chaineClient);
							%>
					    </tbody>
					</table>
				</div>
				<div class="card-footer" style="background-color: #8C8C8C;">
					<div class="row d-flex justify-content-center">
						<div class="col-auto">
							<form method="post" action="">
								<button type="submit" name="deleteAll" class="btn btn-lg text-light mt-2 mb-2" style="background-color: #C53939;"
									onclick="return(confirm('Voulez-vous vraiment supprimer tous les clients ?'));">
									Supprimer tous les clients
								</button>
							</form>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
