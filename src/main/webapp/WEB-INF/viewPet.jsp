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
				<h1 class="col">Say hello to <c:out value="${pet.name}"/>!</h1>
				<div class="col mt-2">
					<a href="/home" class="col mt-2">Home</a>
					<a href="/logout" class="col mt-2">Logout</a>
				</div>
			</div>
			<br/>
			<div class="row mx-5" style=" margin-top:50px; width:900px; justify-content:center;">
				<div class="col ml-5">
					<table class="table table-borderless border" style="width:400px;">
						<tr>
							<td>Belongs to: <c:out value="${pet.user.userName}"/></td>
						</tr>
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
				<div class="col mr-5" >
					<h3 style="margin-left:140px;">Meet ${pet.name}</h3>
					<p style="width:auto; text-align:center;">${pet.introduction}</p>
				</div>
				
				<div>
				<c:if test="${pet.user.id==user.id}">
					<a href="/pet/${pet.id}/edit" class="btn btn-primary" role="button">Edit</a>
			    	<a href="/pet/${pet.id}/delete" class="btn btn-primary" role="button">Delete</a>
				</c:if>
				</div>
			</div>
		</div>
	</body>
</html>