<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page isErrorPage="true" %>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" type="text/css" href="/css/style.css">
<title>Say hello to ${pet.id}</title>
</head>
<body>

    <h1><c:out value="${pet.name}"></c:out></h1>
<p><a href="/home">Back to home page</a></p>

<table>
    <tbody>
        <tr>
            <td>Name: <c:out value="${pet.name}"></c:out></td>
        </tr>
        
        <tr>
            <td>Species: <c:out value="${pet.species}"></c:out></td>
        </tr>

		<tr>
            <td>Gender: <c:out value="${pet.gender}"></c:out></td>
        </tr>

        <tr>
            <td>Age: <c:out value="${pet.age}"></c:out></td>
        </tr>

		<tr>
            <td>Favorite Treat: <c:out value="${pet.favoriteTreat}"></c:out></td>
        </tr>

    </tbody>
</table>
<!-- <c:if test = "${???}"> -->
    <button><a href="/pet/edit/${pet.id}">Edit</a></button>
    <button><a href="/pet/delete/${pet.id}">Delete</a></button>
</c:if>
</body>
</html>
