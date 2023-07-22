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
<title><c:out value="${page}" /></title>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
<style>
table {
	border-collapse: collapse;
	width: 100%;
	color: #333;
	font-family: Arial, sans-serif;
	font-size: 14px;
	text-align: center;
	border-radius: 10px;
	overflow: hidden;
	box-shadow: 0 0 20px rgba(0, 0, 0, 0.1);
	margin: auto;
	margin-top: 50px;
	margin-bottom: 50px;
}

table th {
	background-color: #ff9800;
	color: #fff;
	font-weight: bold;
	padding: 10px;
	text-transform: uppercase;
	letter-spacing: 1px;
	border-top: 1px solid #fff;
	border-bottom: 1px solid #ccc;
}

table tr:nth-child(even) td {
	background-color: #f2f2f2;
}

table tr:hover td {
	background-color: #ffedcc;
}

table td {
	background-color: #fff;
	padding: 10px;
	border-bottom: 1px solid #ccc;
	font-weight: bold;
}

.split {
	display: flex;
	justify-content: space-around;
	align-items: center;
}

.btn {
	background-color: inherit;
	border: 1px solid blue;
	display: block;
	padding: 5px 10px;
	border-radius: 2px;
	font-size: 1.2rem;
}

.btn:hover {
	background-color: skyblue;
}

#addbus {
	background-color: skyblue;
	box-shadow: 1px 2px black;
	padding: 5px 10px;
	width: 400px;
	margin-left: auto;
	margin-right: auto;
}

.form-group {
	margin: 15px 5px;
}

.form-group>* {
	display: inline-block;
}

.form-group input {
	border: none;
	background-color: inherit;
	color: black;
	border-bottom: 1px solid black;
}

.form-group input:focus {
	outline: none;
	border-bottom: 2px solid black;
}

.btn {
	display: block;
	padding: 5px 10px;
	background-color: inherit;
	border: 1px solid black;
}

.btn:hover {
	border: 1px solid darkblue;
}

.search {
	text-align: center;
}

.add-btn {
	text-decoration: none;
	border: 2px solid blue;
	text-align: center;
	padding: 3px 5px;
	font-size: bold;
	color: black;
	border-radius: 10px;
	text-align: center;
}

.add-btn:hover {
	border: 2px solid red;
}

.icon {
	display: inline;
}

.icon:hover {
	color: blue;
}

.icon-delete {
	color: red;
	margin-right: 10px;
}

.icon-edit {
	color: green;
}

.confirm-btn:hover {
	background-color: red;
}
</style>
</head>
<body>
	<div class="container">
		<div class="split">
			<h3 style="color: #333">Welcome Admin</h3>
			<a href='<c:url value="/add" />' class="add-btn"><i
				class="fa-solid fa-plus" style="margin-right: 5px;"></i>Add Bus</a>
		</div>
		<div class="form-group search">
			<form method="get" action="search">
				<input type="text" id="ssource" placeholder="Boarding point"
					name="ssource" /> <input type="text" id="sdestination"
					placeholder="Stop Point" name="sdestination" /> <input class="btn"
					style="text-align: center; margin: 10px auto; border: 1px solid red;"
					type="submit" value="Search" />
			</form>
		</div>
		<div>
			
			 <c:if test="${page == 'edit'}">
			 <div id="addbus" >
			 	<h1>Edit Bus Details</h1>
	<form:form action="updateBus" method="post" modelAttribute="bus">
		<div class="form-group">
			<form:label for="id" path="id">Id</form:label>
			<form:input path="id" id="id" name="id" cssClass="id rightalign" value="${bus.id}"/>
		</div>
		<div class="form-group">
			<form:label for="tname" path="travelsName">Travels name</form:label>
			<form:input path="travelsName" cssClass="tname" type="text"
				placeholder="Travels name" id="tname" name="tname" value='${bus.travelsName}'/>
		</div>
		<div class="form-group">
			<form:label for="boards" path="boards">Starting Point</form:label>
			<form:input class="boards" path="boards" type="text"
				placeholder="Boarding at" id="boards" name="boards" value='${bus.boards}'/>
		</div>
		<div class="form-group">
			<form:label for="stops" path="stops">Stopping Point</form:label>
			<form:input path="stops" cssClass="stops" type="text"
				placeholder="Stops at" id="stops" name="stops" value='${bus.stops}' />
		</div>
		<div class="form-group">
			<form:label for="savail" path="seats">Seats Available</form:label>
			<form:input cssClass="savail" path="seats" type="number"
				placeholder="Seats Available" id="savail" name="savail" value='${bus.seats}' />
		</div>
		<div class="form-group">
			<form:label for="price" path="price">Cost</form:label>
			<form:input path="price" cssClass="cost" type="number"
				placeholder="price" id="price" name="price" value='${bus.price}'/>
		</div>
		<button
			style="text-align: center; margin-left: auto; margin-right: auto;"
			class="btn confirm-btn" type="submit">Save Details</button>
	</form:form>
	</div>
			 </c:if>
			
			<c:if test="${fn:length(list) == 0} && ${page} ne ${'add'} ">
				<p style="color: red; text-align: center;">No records found</p>
			</c:if>
			<c:if test="${fn:length(list) > 0}">
				<h3 class="header">Here are the results</h3>
				<div>
					<table id="bavil">
						<thead>
							<th>Id</th>
							<th>Travels</th>
							<th>Boarding At</th>
							<th>Stops At</th>
							<th>Total Seats</th>
							<th>Cost</th>
							<th>Actions</th>
						</thead>
						<tbody>
							<c:forEach items="${list}" var="bus">
								<tr>
									<td>${bus.id}</td>
									<td>${bus.travelsName}</td>
									<td>${bus.boards}</td>
									<td>${bus.stops}</td>
									<td>${bus.seats}</td>
									<td>${bus.price}</td>
									<td><a href='<c:url value="/delete/${bus.id }" />'
										class="icon icon-delete"> <i
											class="fa-solid fa-trash-can fa-xl"></i></a> <a
										href='<c:url value="/edit/${bus.id }" />'
										class="icon icon-edit"><i
											class="fa-solid fa-pen-to-square fa-xl"></i></a></td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
				</div>
			</c:if>
			<c:if test="${page == 'add'}">
				<div id="addbus">
					<h3 class="header"
						style="text-align: center; color: black; font-weight: 100; border-bottom: 1px solid black;">Fill
						in details</h3>
					<form:form action="saveBus" method="post" modelAttribute="bus">
						<div class="form-group">
							<form:label for="id" path="id">Id</form:label>
							<form:input path="id" id="id" name="id" cssClass="id rightalign" />
						</div>
						<div class="form-group">
							<form:label for="tname" path="travelsName">Travels name</form:label>
							<form:input path="travelsName" cssClass="tname" type="text"
								placeholder="Travels name" id="tname" name="tname" />
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
							class="btn confirm-btn" type="submit">Confirm Details</button>
					</form:form>
				</div>
			</c:if>
		</div>
	</div>
</body>
</html>
