<div class="container mt-5">
	<div class="row d-flex justify-content-center">
		<div class="col-auto">
			<div class="card" style="color: #D9D9D9;">
				<div class="card-header" style="background-color: #863E54;">
					<h2 class="text-center" style="color: #FFFFFF;">Liste des admins</h2>
				</div>
				<div class="card-body" style="background-color: #6D73A9;">
					<table class="table text-center text-light">
					    <thead>
					        <tr>
					            <th scope="col">ID</th>
					            <th scope="col">Nom</th>
					            <th scope="col">Prénom</th>
					            <th scope="col">Email</th>
					            <th scope="col">Rôle</th>
					            <th scope="col">Type</th>
					            <th scope="col">Création</th>
					            <th scope="col">Opération</th>
					        </tr>
					    </thead>
					    <tbody style="vertical-align: middle;">
					        <%
								String chaineAdmin = "";
								for (VAdmins unAdmin : lesAdmins) {
									chaineAdmin += "<tr><td>"+unAdmin.getIdu()+"</td>";
									chaineAdmin += "<td>"+unAdmin.getNom()+"</td>";
									chaineAdmin += "<td>"+unAdmin.getPrenom()+"</td>";
									chaineAdmin += "<td>"+unAdmin.getEmail()+"</td>";
									chaineAdmin += "<td>"+unAdmin.getRole()+"</td>";
									chaineAdmin += "<td>"+unAdmin.getType()+"</td>";
									chaineAdmin += "<td>"+unAdmin.getCreation_compte()+"</td>";
									chaineAdmin += "<td><a href='index.jsp?page=2&action=edit&idu="+unAdmin.getIdu()+"' class='btn'>";
									chaineAdmin += "<img src='images/edit.png' width='30' height='30' alt=''>";
									chaineAdmin += "</a>";
									chaineAdmin += "<a href='index.jsp?page=2&action=sup&idu="+unAdmin.getIdu()+"' class='btn' onclick='return(confirm(\"Voulez-vous vraiment supprimer cet admin ?\"));'>";
									chaineAdmin += "<img src='images/delete.png' width='40' height='40' alt=''>";
									chaineAdmin += "</a></td></tr>";
								}
								out.print(chaineAdmin);
							%>
					    </tbody>
					</table>
				</div>
				<div class="card-footer" style="background-color: #8C8C8C;">
					<div class="row d-flex justify-content-center">
						<div class="col-auto">
							<form method="post" action="">
								<button type="submit" name="deleteAll" class="btn btn-lg text-light mt-2 mb-2" style="background-color: #C53939;"
									onclick="return(confirm('Voulez-vous vraiment supprimer tous les admins ?'));">
									Supprimer tous les admins
								</button>
							</form>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
