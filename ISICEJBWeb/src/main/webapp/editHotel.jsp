<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Modifier hotel</title>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
</head>
<body>
<body>
  

    <div class="container">
        <h1 class="text-center mb-4">Modifier Hotel</h1>

        <form class="custom_class" action="HotelController" method="post" class="form-inline mb-3">
            <div class="form-group">
                <label for="hotelNameInput">Nom :</label>
                <input type="text" name="nom" class="form-control" id="hotelNameInput" placeholder="Entrer hotel " value="${editHotel != null ? editHotel.nom : ''}" required>
            </div>
            <div class="form-group">
                <label for="hotelAddressInput">Adresse :</label>
                <input type="text" name="adresse" class="form-control" id="hotelAddressInput" placeholder="Enter adresse" value="${editHotel != null ? editHotel.adresse : ''}" required>
            </div>
            
            <div class="form-group">
                <label for="hotelTelephoneInput">Telephone :</label>
                <input type="text" name="telephone" class="form-control" id="hotelTelephoneInput" placeholder="Entrer telephone" value="${editHotel != null ? editHotel.telephone : ''}" required>
            </div>

            <input type="hidden" name="action" value="${editHotel != null ? 'update' : 'create'}">
            <input type="hidden" name="id" value="${editHotel != null ? editHotel.id : ''}">
            <button type="submit" class="btn btn-primary">${editHotel != null ? 'Update' : 'Enregistrer'}</button>
        </form>

    </div>

    <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>

    <script>
        function confirmDelete() {
            return confirm("Are you sure you want to delete this Ville and associated hotels?");
        }
    </script>
</body>
</body>
</html>