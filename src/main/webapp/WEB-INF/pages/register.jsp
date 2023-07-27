<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ page isELIgnored="false"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Register</title>
<style>
* {
	margin: 0;
	box-sizing: border-box;
}

section {
	width: 400px;
	margin: 10px auto;
}

.container {
	border: 1px solid black;
	margin: 2px 2px 5px 5px;
	padding: 5px;
	background-color: aliceblue;
}

.header {
	text-align: center;
	display: block;
	padding: 5px;
	color: rgb(157, 118, 210);
}

#signup-form {
	margin: 20px 0;
}

.form-field * {
	display: block;
	margin: 5px;
	margin-bottom:8px;
}

label {
	color: black;
	display: block;
	margin: 5px;
}

input {
	line-height: 1.5rem;
	border-style: none;
	border-bottom: 1px solid black;
	display: block;
	background-color: inherit;
}

input:focus {
	background-color: inherit;
	outline: none;
	border-bottom: 2px solid black;
}

.message {
	display: flex;
}

.message>* {
	width: 100%;
}

i {
	position: absolute;
}

.fa-check, .fa-exclamation {
	visibility: hidden;
	width: 17px;
}

.fa-check {
	color: black;
	background-color: green;
	border-radius: 50%;
}

.fa-exclamation {
	text-align: center;
	width: 15px;
	color: black;
	background-color: red;
	border-radius: 50%;
}

small {
	text-align: right;
	visibility: hidden;
	margin-left: 25px;
}

button {
	width: 100%;
	background-color: inherit;
	color: red;
	border: 1px solid black;
	padding: 5px;
	text-transform: uppercase;
}

button:hover {
	background-color: rgb(157, 118, 210);
	color: white;
}

.setwidth {
	width: 90%;
}

.btn {
	display: block;
	width: 100%;
	padding: 2px;
	background-color: inherit;
	border: 1px solid black;
}

.btn:hover {
	background-color: skyblue;
}
.error{
 	color:red;
}
</style>

</head>
<body>
<section>
    <p id="success"></p>
    <h3 class="header">Customer registration</h3>
    <div class="container"> 
	<form:form action="saveUser" modelAttribute="user">
			<div class="form-field" style="visibility:hidden;">
			<form:label for="id" path="id">Id</form:label> 
			<form:input path="id" cssClass="setwidth" name="id"
				id="id" placeholder="Id"></form:input>
		</div>
		<div class="form-field">
			<form:label for="name" path="name">Name</form:label> 
			<form:input path="name" cssClass="setwidth" name="name"
				id="name" placeholder="Enter your name"></form:input>
			<form:errors path="name" cssClass="error message"/>
		</div>
		<div class="form-field">
			<form:label for="email" path="email">Email</form:label> 
			<form:input path="email" cssClass="setwidth" 
				name='email' id="email" placeholder="Enter your email"></form:input>
				<form:errors path="email" cssClass="error message"/>
		</div>
		<div class="form-field">
			<form:label path="password" for="pass">Password</form:label> 
			<form:input path="password" cssClass="setwidth" 
				name="pass" id="pass" placeholder="password"></form:input>
				<form:errors path="password" cssClass="error message"/>
		</div>
			<div class="form-field">
			<form:label for="mno" path="mno">Mobile no</form:label> 
			<form:input path="mno" cssClass="setwidth" name="mno"
				id="mno" placeholder="Enter your mobile no"></form:input>
				<form:errors path="mno" cssClass="error message"/>
		</div>
		<button type="submit" class="btn">Submit</button>
	</form:form>
	</div>
	</section>
</body>
</html>