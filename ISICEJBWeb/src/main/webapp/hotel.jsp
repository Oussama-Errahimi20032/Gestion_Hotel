<%@page import="entities.Hotel"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="ISO-8859-1">
<title>Gestion des Hotels</title>
<!-- Add Bootstrap CSS -->
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">


</head>
<body>
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
	<form action="HotelController" method="post" class="mb-4">
    <div class="form-group">
        <label for="filterVille" class="form-label">Filtrage par Ville:</label>
        <div class="input-group">
            <select name="filterVille" class="form-control">
                <option value="0">All</option>
                <c:forEach items="${villes}" var="ville">
                    <option value="${ville.id}">${ville.nom}</option>
                </c:forEach>
            </select>
            <input type="hidden" name="action" value="filterByVille">
            <button type="submit" class="btn btn-primary">Filter</button>
        </div>
    </div>
</form>

	<div class="container">
		<form class="my_form" action="HotelController" method="post">
			<div class="form-group">
				<label for="nom">Nom :</label> <input type="text" name="nom"
					class="form-control" required>
			</div>
			<div class="form-group">
				<label for="adresse">Adresse :</label> <input type="text"
					name="adresse" class="form-control" required>
			</div>
			<div class="form-group">
				<label for="telephone">Telephone :</label> <input type="text"
					name="telephone" class="form-control" required>
			</div>

			<c:if test="${not empty villes}">
				<div class="form-group">
					<label for="ville">Ville :</label> <select name="ville"
						class="form-control">
						<c:forEach items="${villes}" var="v">
							<option value="${v.id}">${v.nom}</option>
						</c:forEach>
					</select>
				</div>
			</c:if>

			<button type="submit" class="btn btn-primary">Enregistrer</button>
		</form>

		<!-- Table to showcase hotel information -->
		<h2 class="text-center mt-4">Liste des Hôtels :</h2>
		<div class="table-responsive">
			<table class="table  table-striped">

				<thead>
					<tr>
						<th>ID</th>
						<th>Nom</th>
						<th>Adresse</th>
						<th>Telephone</th>
						<th>Ville</th>
						<th>Action</th>
					</tr>
				</thead>
				<tbody>
					<!-- Add a loop to iterate over the list of hotels -->
					<c:forEach items="${Hotels}" var="hotel">
						<tr>
							<td>${hotel.id}</td>
							<td>${hotel.nom}</td>
							<td>${hotel.adresse}</td>
							<td>${hotel.telephone}</td>
							<td>${hotel.ville.nom}</td>
							<td>
							<td class="text-center">
								<div class="btn-group" role="group">
									<form action="HotelController" method="post"
										onsubmit="return confirmDelete();" class="inline-form">
										<input type="hidden" name="action" value="delete"> <input
											type="hidden" name="id" value="${hotel.id}">
										<button type="submit"
											class="btn btn-danger btn-sm action-buttons">Supprimer</button>
									</form>
									<form action="HotelController" method="get" class="inline-form">
										<input type="hidden" name="action" value="edit"> <input
											type="hidden" name="id" value="${hotel.id}">
										<button type="submit"
											class="btn btn-primary btn-sm action-buttons">Modifier</button>
									</form>
								</div>
							</td>



						</tr>
					</c:forEach>
				</tbody>
			</table>

			<script>
				function confirmDelete() {
					return confirm("etes vous sur de supprimer hotel?");
				}
			</script>
		</div>

		<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"></script>
		<script
			src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"></script>
		<script
			src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
</body>

</body>
</html>
