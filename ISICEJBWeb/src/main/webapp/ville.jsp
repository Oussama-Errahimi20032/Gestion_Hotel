<%@page import="entities.Ville"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="ISO-8859-1">
<title>Ville</title>
<!-- Add Bootstrap CSS -->
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
<style>
body {
	background-color: #f8f9fa; /* Light background color */
	color: #495057; /* Text color in a dark shade for good contrast */
	font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
}
</style>
</head>

<body>

	<nav class="navbar navbar-expand-lg navbar-light bg-light">
		<div>
			<a class="navbar-brand" href=""> <img src="machine.png"
				style="margin-left: 80px;" alt="Logo" width="30" height="30">
			</a>
		</div>
		<div class="collapse navbar-collapse" id="navbarNav">
			<ul class="navbar-nav">
				<li class="nav-item"><a class="nav-link" href="ville.jsp">Ville</a></li>
				<li class="nav-item"><a class="nav-link" href="hotel.jsp">Hotel</a></li>
				<li class="nav-item"><a class="nav-link" href="recherche.jsp">Hotel
						par ville</a></li>
			</ul>
		</div>
	</nav>


	<div class="container mt-4">
		<h1 class="text-center">Ville Management</h1>

		<form action="VilleController" method="post" class="form-inline mb-4">
			<div class="form-group mr-2">
				<label for="villeInput" class="sr-only">Nom :</label> <input
					type="text" name="ville" class="form-control" id="villeInput"
					placeholder="Entrer une nouvelle ville"
					value="${editVille != null ? editVille.nom : ''}" required>
			</div>
			<input type="hidden" name="action"
				value="${editVille != null ? 'update' : 'create'}"> <input
				type="hidden" name="id"
				value="${editVille != null ? editVille.id : ''}">
			<button type="submit" class="btn btn-primary">${editVille != null ? 'Update' : 'Enregistrer'}</button>
		</form>

		<div class="container mt-5">
			<h2 class="text-center mb-4">Liste des villes :</h2>
			<div class="table-responsive">
				<table class="table table-striped">
					<thead>
						<tr>
							<th>ID</th>
							<th>Nom</th>
							<th>Action</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${villes}" var="v">
							<tr>
								<td>${v.id}</td>
								<td>${v.nom}</td>
								<td class="text-center">
									<div class="btn-group" role="group">
										<form action="VilleController" method="post"
											onsubmit="return confirmDelete();" class="inline-form">
											<input type="hidden" name="action" value="delete"> <input
												type="hidden" name="id" value="${v.id}">
											<button type="submit" class="btn btn-danger btn-sm">Supprimer</button>
										</form>
										<form action="VilleController" method="get"
											class="inline-form">
											<input type="hidden" name="action" value="edit"> <input
												type="hidden" name="id" value="${v.id}">
											<button type="submit" class="btn btn-primary btn-sm">Modifier</button>
										</form>
									</div>
								</td>

							</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>
		</div>



		<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"></script>
		<script
			src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"></script>
		<script
			src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>

		<script>
			function confirmDelete() {
				return confirm("vous risquez de perdre les hotels associes a cette ville?");
			}
		</script>
</body>
</html>
