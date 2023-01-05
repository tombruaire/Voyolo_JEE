<div class="container mt-5">
	<div class="row d-flex justify-content-center">
		<div class="col-auto">
			<div class="card" style="color: #D9D9D9;">
				<div class="card-header" style="background-color: #863E54;">
					<h2 class="text-center" style="color: #FFFFFF;">Liste des questions</h2>
				</div>
				<div class="card-body" style="background-color: #6D73A9;">
					<table class="table text-center text-light">
						<thead>
							<tr>
								<th scope="col">ID</th>
								<th scope="col">&#201;noncé</th>
								<th scope="col">Op&#233;ration</th>
							</tr>
						</thead>
						<tbody style="vertical-align: middle;">
							<%
							String chaineQuestion = "";
							for (Questions uneQuestion : lesQuestions) {
								chaineQuestion += "<tr><td>" + uneQuestion.getIdquestion() + "</td>";
								chaineQuestion += "<td>" + uneQuestion.getEnonce() + "</td>";
								chaineQuestion += "<td><a href='index.jsp?page=11&action=edit&idquestion=" + uneQuestion.getIdquestion() + "' class='btn'>";
								chaineQuestion += "<img src='images/edit.png' width='30' height='30' alt=''>";
								chaineQuestion += "</a>";
								chaineQuestion += "<a href='index.jsp?page=11&action=sup&idquestion=" + uneQuestion.getIdquestion()
								+ "' class='btn' onclick='return(confirm(\"Voulez-vous vraiment supprimer cette question ?\"));'>";
								chaineQuestion += "<img src='images/delete.png' width='40' height='40' alt=''>";
								chaineQuestion += "</a></td></tr>";
							}
							out.print(chaineQuestion);
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
									onclick="return(confirm('Voulez-vous vraiment supprimer toutes les questions ?'));">
									Supprimer toutes les questions</button>
							</form>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
