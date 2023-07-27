<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ page isELIgnored="false"%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Book Your seat</title>
    <link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
	<link rel="stylesheet" href="<c:url value="/resources/css/style.css"></c:url>">
    <style>
        * {
            margin:0;
            padding:0;
            box-sizing: border-box;
        }
        nav {
            display:flex;
            justify-content:space-between;
            align-items:center;
            padding:10px;
            background-color: violet;
        }
        .items {
            margin-left:auto;
            display:flex;
            justify-content: space-around;
            align-items: center;
        }
        .item {
            list-style-type: none;
            margin-left: 40px;
            font-size: 20px;
        }
        .item:hover {
            opacity:0.8;
        }
        a {
            text-decoration: none;
            color:black;
        }
        a::after {
            width: 100%;
            height:10px;
            position: absolute;

        }
        .bg-container {
            #background-image: url(./backgroundimage.jpg);
            background-size: cover;
            background-repeat: no-repeat;
            background-position: center;
            height:90vh;
        }
        .bg {
            height:90vh;
            background-color: rgba(0,0,0,0.6);
            display:table;
            width:100%;
        }
        .bg-content {
            margin:auto 10px;
            color:white;
            display: table-cell;
            vertical-align: middle;
            text-align: center;
        }
        .twocollayout {
            display:flex;
            justify-content: center;
            align-items:center;
            background-color:aliceblue;
            padding:15px;
        }
        .sinput {
            border:none;
            display:block;
            margin:10px 0;
            background-color: inherit;
            border-bottom: 1px solid black;
            padding:4px 6px;
            width:90%;
        }
        .sinput:focus {
            border-bottom: 2px solid black;
            outline:none;
        }
        label {
            display:block;
        }
        .btn {
            display:block;
            width:100%;
            padding:5px 10px;
            background-color: inherit;
            border: 1px solid black;
        }
        .btn:hover {
            background-color: skyblue;
        }
        .firstcol {
            font-size: 2rem;
            width:500px;
            text-align: center;
        }
        .secondcol {
            background-color: aqua;
            font-size: 1.5rem;
            padding:10px;
            box-shadow: 1px 2px 1px black;
            width:25%;
        }
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
.book {
	display:inline;
	text-align:center;
	
}
    </style>
</head>
<body>
    <nav>
        <div style="display:flex;justify-content:space-between;align-items:center;">
            <h3><i class="fa-solid fa-bus"></i></h3>
            <c:if test="${loginuser ne null}">
            	<h2 style="margin-left:10px;">Welcome <span style="color:red;">${loginuser.getName()}</span></h2>
            </c:if>
        </div>
        <ul class="items">
            <li class="item"><a  href="./home.html">Home</a></li>
            <c:if test="${loginuser ne null}">
            	<li class="item"><a href='/projectmvc/logout'>Logout</a>
            </c:if>
            <c:if test="${loginuser == null }">
            <li class="item"><a  href='<c:url value="/loginpage" />'>Login</a></li>
            <li class="item"><a href='<c:url value="/register" />'>Register</a></li>
            </c:if>
            <li class="item"><a href="#bys">Book Your Seat</a></li>
            <li class="item"><a href='<c:url value="/adminloginpage" />'>Admin</a></li>
        </ul>
    </nav>
    <div class="bg-container">
        <div class="bg">
            <h1 class="bg-content">
                The <span style="color:red">journey</span> of a thousand miles begins with a single step.
            </h1>
        </div>
    </div>
    <div id="bys" class="twocollayout">
        <div class="firstcol">
            Make Your <span style="color:red;">Journey</span> Special, Choose right thing in right time
        </div>
        <div class="secondcol">
         <form action="usersearch" method="get">
                <label for="start">From</label>
                <input class="sinput" type="text" placeholder="Onboarding point" id="start" name="start" >
                <label for="end">To</label>
                <input class="sinput" type="text" placeholder="Droping point" id="end" name="end" >
                <button class="btn" type="submit" value="submit">Submit</button>
         </form>
        </div>
    </div>
    <div>
        <table id="bavil" >
            <thead>
                <th>Id</th>
                <th>Travels</th>
                <th>Boarding At</th>
                <th>Stops At</th>
                <th>Seats Available</th>
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
									<td><a href='<c:url value="/book/${bus.id }" />'
										class="btn book">Book</a></td>
								</tr>
							</c:forEach>
            </tbody>
        </table>
    </div>
</body>
</html>