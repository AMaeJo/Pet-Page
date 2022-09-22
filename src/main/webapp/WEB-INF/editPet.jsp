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
		<title>Edit Pet</title>
		<link rel="stylesheet" href="/webjars/bootstrap/css/bootstrap.min.css">
	    <link rel="stylesheet" href="/css/main.css">
	    <script src="/webjars/jquery/jquery.min.js"></script>
	    <script src="/webjars/bootstrap/js/bootstrap.min.js"></script>
	</head>
	
	<body>
		<h1 style="text-align: center; margin: 25px;">Forgot to add something?</h1>
    
	    <div class="container" style="border: solid; padding: 50px;">
	        
	        <div class="container">
	            <form:form action="/pet/${pet.id}/update" modelAttribute="editPet" class="form" method="put">
	                
	                <div class="" style="margin: 25px; padding-left: 300px;">
	                    <form:label for="name" path="name" style="font-weight: bold;">Name:</form:label>
	                    <form:input type="text" path="name" class=""/>
	
	                    <form:label for="favoriteTreat" path="favoriteTreat" style="font-weight: bold;">Favorite Treat:</form:label>
	                    <form:input path="favoriteTreat" class=""/>
	                </div>
	                
	                <div class="" style="margin: 25px; padding-left: 200px;">
	                    <form:label for="species" path="species" style="font-weight: bold;">Species:</form:label>
	                    <form:input type="text" path="species" class=""/>
	
	                	<form:label for="age" path="age" style="font-weight: bold;">Age:</form:label>
	                	<form:input path="age" class=""/>
				
	                	<form:label for="gender" path="gender" style="font-weight: bold;">Gender:</form:label>
	                	<form:select path="gender">
	                 	<form:option value="Options..." label="Options"/>
	                        <form:option value="Male" label="Male"/>
	                    	<form:option value="Female" label="Female"/>
	                    	<form:option value="Unknown" label="Unknown"/>
	                	</form:select>
	            	</div>
	                
	            	<div class="form-row">
	               	 	<form:label for="introduction" path="introduction" style="font-weight: bold;">Introduction:</form:label>
	               	 	<form:textarea path="introduction" class="form-control"/>
	            	</div>
	            	
					<form:errors path="user" class="error text-danger"/>
					<form:input type="hidden" path="user" value="${user.id}"/>
	            
	            <!-- Error Messages -->
		            <div>
		            	<form:errors path="name" class="error text-danger"/>
		            	<br/>
		            	<form:errors path="favoriteTreat" class="error text-danger"/>
		            	<br/>
		            	<form:errors path="species" class="error text-danger"/>
		            	<br/>
		            	<form:errors path="age" class="error text-danger"/>
		            	<form:errors path="gender" class="error text-danger"/>
		            	<br/>
		            	<form:errors path="introduction" class="error text-danger"/>
		            </div>
	            
		            <div class="form-row" style="padding-left: 1000px; margin-top: 20px;">
		                <a class="btn btn-primary" href="/pet/${pet.id}" role="button" style="margin-right: 20px;"> Back </a>
		                <a class="btn btn-primary" href="/pet/${pet.id}" role="button" style="margin-right: 20px;"> Submit </a>
		            </div>
	            
	       		</form:form>
	    	</div>
	    
	    
	    
		</div>

	</body>
</html>
