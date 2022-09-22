<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page isErrorPage="true" %>
<!DOCTYPE html>
<html>
	<head>
		<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" 
			integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
		<title>Pet Page</title>
	</head>
	
	<body>
		<div class="row m-5 border-primary">
			<div class="row mb-4">
				<h2 class="col">Say hello to <c:out value="${pet.name}"/>!</h2>
				<div class="col mt-2">
					<a href="/home" class="col mt-2">Home</a>
					<a href="/logout" class="col mt-2">Logout</a>
				</div>
			</div>
			<br/>
	
			<div class="col mx-5">
				<table class="table table-borderless border" style="width:400px;">
		        	<tr>
		            	<td>Species: <c:out value="${pet.species}"/></td>
		        	</tr>
					<tr>
		            	<td>Gender: <c:out value="${pet.gender}"/></td>
			        </tr>
			        <tr>
		    	        <td>Age: <c:out value="${pet.age}"/></td>
		        	</tr>
					<tr>
		    	        <td>Favorite Treat: <c:out value="${pet.favoriteTreat}"/></td>
		        	</tr>
				</table>
			</div>
			<div class="col mx-5">
				<h3>Meet ${pet.name}:</h3>
			</div>
			
			<div class="form-row">
				<a href="/pet/edit/${pet.id}" class="btn btn-primary" role="button">Edit</a>
		    	<a href="/pet/delete/${pet.id}" class="btn btn-primary" role="button">Delete</a>
			</div>
		</div>
	</body>
</html>