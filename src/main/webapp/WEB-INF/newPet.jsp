<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ page isErrorPage="true" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"  %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Add new pet</title>
	<link rel="stylesheet" href="/webjars/bootstrap/css/bootstrap.min.css">
    <!-- <link rel="stylesheet" href="/css/main.css"> change to match your file/naming structure -->
    <script src="/webjars/jquery/jquery.min.js"></script>
    <script src="/webjars/bootstrap/js/bootstrap.min.js"></script>
</head>
<body>
    <!-- <div class="row mb-4">
        <h2 class="col">Welcome, <c:out value="${user.userName}"></c:out>!</h2>
        <a href="/logout" class="col mt-2">logout</a>
    </div> -->
    
    <h1 style="text-align: center; margin: 25px;">Tell us about your pets!</h1>
    
    <div class="container" style="border: solid; padding: 50px;">
        
        <div class="container">
            <form:form action="/pet/new" modelAttribute="newPet" class="form" method="post">
                
                <div class="" style="margin: 25px; padding-left: 300px;">
                    <form:errors path="name" class="error"/>
                    <form:label for="name" path="name" style="font-weight: bold;">Name:</form:label>
                    <form:input type="text" path="name" class=""/>

                    <form:errors path="favoriteTreat" class="error"/>
                    <form:label for="favoriteTreat" path="favoriteTreat" style="font-weight: bold;">Favorite Treat:</form:label>
                    <form:input path="favoriteTreat" class=""/>
                </div>
                
                <div class="" style="margin: 25px; padding-left: 200px;">
                    <form:errors path="species" class="error"/>
                    <form:label for="species" path="species" style="font-weight: bold;">Species:</form:label>
                    <form:input type="text" path="species" class=""/>

                    <form:errors path="gender" class="error"/>
                    <form:label for="gender" path="gender" style="font-weight: bold;">Gender:</form:label>
                    <form:select path="gender">
                        <form:option value="Options..." label="Options"/>
                        <form:option value="Male" label="Male"/>
                    <form:option value="Female" label="Female"/>
                    <form:option value="Unknown" label="Unknown"/>
                </form:select>

                <form:errors path="age" class="error"/>
                <form:label for="age" path="age" style="font-weight: bold;">Age:</form:label>
                <form:input path="age" class=""/>
            </div>
                
            <div class="form-row">
                <form:errors path="introduction" class="error"/>
                <form:label for="introduction" path="introduction" style="font-weight: bold;">Introduction:</form:label>
                <form:textarea path="introduction" class="form-control"/>
            </div>
            
            <div class="form-row" style="padding-left: 1000px; margin-top: 20px;">
                <a class="btn btn-primary" href="/home" role="button" style="margin-right: 20px;"> Back </a>
                <input type="submit" value="Submit" class="btn-primary"/>
            </div>
            
        </form:form>
    </div>
    
    
    
</div>

</body>
</html>
