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
		<div class="row mb-4">
				<h2 class="col">Welcome, <c:out value="${user.userName}"></c:out>!</h2>
				<a href="/logout" class="col mt-2">logout</a>
		</div>
		<br/>
		
		<!-- All Pets -->
		<table class="table table-striped table-bordered">
			<tr>
				<th>Pet Name</th>
				<th>Owner</th>
				<th>Give Pets</th>
				<th>Actions</th>
			</tr>
			<c:forEach var="pet" items="${pets}">
			<tr>
				<td>${pet.name}</td>
				<td>${pet.user_id}</td>
				<td><a href="/${pet.id}">view</a></td>
			</tr>
			</c:forEach>
		</table>
		
		<!-- User's Pet List -->
		<table class="table table-striped table-bordered">
			<tr>
				<th>Pet Name</th>
				<th>Actions</th>
			</tr>
			<c:forEach var="pet" items="${pets}">
			<tr>
				<td><a href="/${pet.id}">view</a></td>
				<td><c:out value="${pet.id}"/></td>
			</tr>
			</c:forEach>
		</table>
		<a href="/pet/new" class="btn btn-outline-dark btn-bg-light w-25 mt-4">Add Pet!</a>
		

	</body>




</html>