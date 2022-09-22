<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page isErrorPage="true" %>
<!DOCTYPE html>
<html>
	<head>
		<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" 
			integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
		<title>Login And Registration</title>
	</head>
	
	<body>
		<h1 class="text-center text-primary mt-5">TEST PAGE FOR LOGIN<br/>hi victoria :)</h1>
		<div class="container m-8 mt-5 w-auto d-flex">
			<form:form action="/register" method="post" modelAttribute="newUser">
			
		<!-- Registration -->
			<div class="container m-5 mx-5">
				<table class="table table-borderless">
					<tr class="form-row">
						<td colspan="2"><h2>Register</h2></td>
					</tr>

					<tr class="form-row">
						<td>Email:</td>
						<td/>
						<td>
							<form:errors class="text-danger" path="email"/>
							<form:input class="input" path="email" style="width:90%;"/>
						</td>
					</tr>
					<tr class="form-row">
						<td>Password:</td>
						<td/>
						<td>
							<form:errors class="text-danger" path="password"/>
							<form:input class="input" type="password" path="password" style="width:90%;"/>
						</td>
					</tr>
					<tr class="form-row">
						<td>Confirm Password:</td>
						<td/>
						<td>
							<form:errors class="text-danger" path="confirmPassword"/>
							<form:input class="input" type="password" path="confirmPassword" style="width:90%;"/>
						</td>
					</tr>

					<tr class="form-row">
			        	<td colspan="2" class="text-end"><input class="btn btn-light btn-outline-dark btn-bg-light w-20 m-5" role="button" type="submit" value="Register"/></td>
			        </tr>
				</table>
			</div>
			
			</form:form>
		<!-- Login -->
			<form:form action="/login" method="post" modelAttribute="newLoginUser">
	
			<div class="container m-5">
				<table class="table table-borderless">
					<tr class="form-row">
						<td colspan="2"><h2>Login</h2></td>
					</tr>

					<tr class="form-row">
						<td>Password:</td>
						<td/>
						<td>
							<form:errors class="text-danger" path="password"/>
							<form:input class="input" type="password" path="password" style="width:90%;"/>
						</td>
					</tr>
					<tr class="form-row">
			        	<td colspan="2" class="text-end"><input class="btn btn-light btn-outline-dark btn-bg-light w-20 m-5" role="button" type="submit" value="Login"/></td>
			        </tr>
				</table>
			</div>
			
			</form:form>
		</div>
	</body>
</html>