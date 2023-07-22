<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ page isELIgnored="false"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Edit Bus Details</title>
</head>
<body>
	<h1>Edit Bus Details</h1>
	<form:form action="updateBus" method="post" modelAttribute="bus">
		<div class="form-group">
			<form:label for="id" path="id">Id ${bus.id }</form:label>
			<form:input path="id" id="id" name="id" cssClass="id rightalign" value="${bus.id}"/>
		</div>
		<div class="form-group">
			<form:label for="tname" path="travelsName">Travels name ${bus.travelsName }</form:label>
			<form:input path="travelsName" cssClass="tname" type="text"
				placeholder="Travels name" id="tname" name="tname" value="${bus.travelsName}"/>
		</div>
		<div class="form-group">
			<form:label for="boards" path="boards">Starting Point</form:label>
			<form:input class="boards" path="boards" type="text"
				placeholder="Boarding at" id="boards" name="boards" />
		</div>
		<div class="form-group">
			<form:label for="stops" path="stops">Stopping Point</form:label>
			<form:input path="stops" cssClass="stops" type="text"
				placeholder="Stops at" id="stops" name="stops" />
		</div>
		<div class="form-group">
			<form:label for="savail" path="seats">Seats Available</form:label>
			<form:input cssClass="savail" path="seats" type="number"
				placeholder="Seats Available" id="savail" name="savail" />
		</div>
		<div class="form-group">
			<form:label for="price" path="price">Cost</form:label>
			<form:input path="price" cssClass="cost" type="number"
				placeholder="price" id="price" name="price" />
		</div>
		<button
			style="text-align: center; margin-left: auto; margin-right: auto;"
			class="btn confirm-btn" type="submit">Save Details</button>
	</form:form>
</body>
</html>