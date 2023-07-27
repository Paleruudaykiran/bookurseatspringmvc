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
    <link rel="stylesheet" href="<c:url value="/resources/css/style.css"></c:url>">
    <style>
       
    </style>
</head>
<body>
    <nav>
        <div>
            <h3>BYS</h3>
        </div>
        <ul class="items">
            <li class="item"><a  href="#">Home</a></li>
            <c:if test="${uid ne null}">
            	<li class="item"><a href='<c:url value="/logout" />'>Logout</a>
            </c:if>
            <c:if test="${uid == null }">
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
         <form>
                <label for="start">From</label>
                <input class="sinput" type="text" placeholder="Onboarding point" id="start" name="start" >
                <label for="end">To</label>
                <input class="sinput" type="text" placeholder="Droping point" id="end" name="end" >
                <button class="btn" value="submit" onclick="return getSchedule()">Submit</button>
         </form>
        </div>
    </div>
    <div>
        <table id="bavil" >
            <thead style="visibility:hidden;">
                <th>Id</th>
                <th>Travels</th>
                <th>Boarding At</th>
                <th>Stops At</th>
                <th>Seats Available</th>
                <th>Cost</th>
            </thead>
            <tbody>

            </tbody>
        </table>
    </div>
</body>
</html>