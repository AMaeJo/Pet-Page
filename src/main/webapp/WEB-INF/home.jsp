<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page isErrorPage="true" %>
<!DOCTYPE html>
<html>
	<head>
		<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" 
			integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
		<title>Home</title>
	</head>
	
	<body>
		<div class="m-5">
			<div class="row mb-3">
				<h1 class="col">Welcome, <c:out value="${user.userName}"/>!</h1>
				<a href="/logout" class="col mt-3">logout</a>
			</div>
			<br/>
			
			<!-- All Pets -->
			<div class="mx-5">
				<table class="table table-striped table-bordered">
					<tr>
						<th>Pet Name</th>
						<th>Owner</th>
						<th>Actions</th>
					</tr>
					<c:forEach var="pet" items="${allPets}">
					<tr>
						<td>${pet.name}</td>
						<td>${pet.user.userName}</td>
						<td><a href="/pet/${pet.id}">view</a></td>
					</tr>
					</c:forEach>
				</table>
			</div>
			<br/>
			
			<!-- User's Pet List -->
			<!-- <div class="mx-5">
				<h2>Your Pets</h2>
				<table class="table table-striped table-bordered">
					<tr>
						<th>Pet Name</th>
						<th>Actions</th>
					</tr>
					<c:forEach var="pet" items="${allPets}">
					<tr>
						<td>${user.id}</td>
						<td><a href="/pet/${pet.id}">view</a></td>
						
					</tr>
					</c:forEach>
				</table>
			</div>  -->
			<a href="/pet/new" class="btn btn-outline-dark btn-bg-light w-15 mt-4">Add Pet!</a>
		</div>
	</body>




</html>