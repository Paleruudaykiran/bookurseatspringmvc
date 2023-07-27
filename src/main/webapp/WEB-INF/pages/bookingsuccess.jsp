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
    <title>Booking confirmed</title>
    <style>
        .card {
            background-color: aliceblue;
            border: 1px solid black;
            margin:10px auto;
            padding:10px;
            width:500px;
        }
        .header {
            color:blue;
            text-align: center;
            text-transform: uppercase;
        }
        #busdetails {
            background-color: orange;
            width:400px;
            display: inline;
        }
        .ditem {
            display: flex;
            justify-content:space-between;
            align-items:center;
            border-bottom: 1px solid skyblue;
            padding:5px;
        }
        .ditem:hover {
            background-color: skyblue;
        }
    </style>
</head>
<body">
    <div class="card">
        <h3 class="header">Booking Confirmed!</h3>
        <div id="busdetails">
            <h4 style="text-align: center;margin-top:5px;padding:5px">Here are details for Your reference</h4>
            <div class="ditem">
                <p>PNR no: </p>
                <p id="pnr">${pnr }</p>
            </div>
            <div class="ditem">
                <p>Bus Id: </p>
                <p id="tid">${busDetails.getId() }</p>
            </div>
            <div class="ditem">
                <p>Travels Name</p>
                <p id="tname">${busDetails.getTravelsName() }</p>
            </div>
            <div class="ditem">
                <p>Boarding At</p>
                <p id="boards">${busDetails.getBoards() }</p>
            </div>
            <div class="ditem">
                <p>Stops At</p>
                <p id="stops">${busDetails.getStops() }</p>
            </div>
            <div class="ditem">
                <p>Total Price</p>
                <p id="tprice">${tprice }</p>
            </div>
            <div class="ditem">
                <p>Your Seats</p>
                <p id="yseats">${seatnos}</p>
            </div>
            <div>
                Person details: 
                <div class="ditem">
                    <p>Name: </p>
                    <p id="cname">${loginuser.getName() }</p>
                </div>
                <div class="ditem">
                    <p>Email: </p>
                    <p id="email">${loginuser.getEmail() }</p>
                </div>
                <div class="ditem">
                    <p>Mobile no: </p>
                    <p id="mno">${loginuser.getMno() }</p>
                </div>
            </div>
        </div>
        <div class="ditem">
            <button onclick="print()">Print</button>
            <a href="./home.html">Go home</a>
        </div>
    </div>
</body>
</html>