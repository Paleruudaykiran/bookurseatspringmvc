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
    <title>Confirm booking</title>
    <style>
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
            width:90%;
            padding:5px 10px;
            background-color: inherit;
            border: 1px solid black;
        }
        a {
            text-decoration: none;
            text-align: center;
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
        #busdetails {
            background-color: whitesmoke;
            width:400px;
            
        }
        .ditem {
            display: flex;
            justify-content:space-between;
            align-items:center;
            border-bottom: 1px solid skyblue;
            padding:10px;
        }
        .ditem:hover {
            background-color: aliceblue;
        }
        .header {
            color:blue;
            text-align: center;
            text-transform: uppercase;
        }
        #cseats {
            display: grid;
            grid-template-columns: 40px 80px 40px 40px;
            gap:10px;
            background-color: antiquewhite;
            padding:5px;
        }
        #cseats > * {
            border:1px solid green;
            /* height:50px; */
            text-align: center;
            border-radius: 10px;
            padding:20px 5px;
        }
        .seat:hover {
            background-color: gainsboro;
        }
        .oddseat {
            width:30px;
        }
    </style>
</head>
<body>
    <h3 class="header">Start Your Booking</h3>
    <div class="display:grid;grid-template-columns:auto auto;">
    <div id="busdetails" style="margin:auto;">
        <h4 style="text-align: center;margin-top:5px;padding:5px">Bus Details</h4>
        <div class="ditem">
            <p>Bus Id: </p>
            <p id="tid">${busDetails.getId()}</p>
        </div>
        <div class="ditem">
            <p>Travels Name</p>
            <p id="tname">${busDetails.getTravelsName()}</p>
        </div>
        <div class="ditem">
            <p>Boarding At</p>
            <p id="boards">${busDetails.getBoards()}</p>
        </div>
        <div class="ditem">
            <p>Stops At</p>
            <p id="stops">${busDetails.getStops()}</p>
        </div>
        <div class="ditem">
            <p>Seats Available</p>
            <p id="seats">${busDetails.getSeats()}</p>
        </div>
        <div class="ditem">
            <p>Price</p>
            <p id="cost">${busDetails.getPrice()}</p>
        </div>
    </div>
    <h2 style="text-align: center;letter-spacing: 1px;color:brown;">Choose Your Seats</h2>
    <div class="" style="display:grid;grid-template-columns: auto auto; gap:20px;align-items: center;margin:auto;">
    <div id="cseats" style="margin:auto; background-color: inherit;">
        <div class="seat">1</div>
        <div class="seat oddseat">2</div>
        <div class="seat">3</div>
        <div class="seat">4</div>
        <div class="seat">5</div>
        <div class="seat oddseat">6</div>
        <div class="seat">7</div>
        <div class="seat">8</div>
        <div class="seat">9</div>
        <div class="seat oddseat">10</div>
        <div class="seat">11</div>
        <div class="seat">12</div>
        <div class="seat">13</div>
        <div class="seat oddseat">14</div>
        <div class="seat">15</div>
        <div class="seat">16</div>
        <div class="seat">17</div>
        <div class="seat oddseat">18</div>
        <div class="seat">19</div>
        <div class="seat">20</div>
        <div class="seat">21</div>
        <div class="seat oddseat">22</div>
        <div class="seat">23</div>
        <div class="seat">24</div>
    </div>
    <div>
    	<form action="confirmbooking" method="post">
    	    <label for="seatnos">Your seat no: </label>
    	    <input class="sinput" id="seatsYouSelected" name="seatsYouSelected" />
    	    <input type="submit" value="confirm booking" class="btn"/>
        </form>
    </div>
</div>
</div>
    <div class="twocollayout">
        <div class="firstcol">
            Will have a <span style="color:red;"> safe Journey</span>, make it special with your visit
        </div>
        <div class="secondcol">
                <label for="cname">Name</label>
                <input class="sinput" type="text" placeholder="name" id="cname" name="cname" value="${loginuser.getName() }" >
                <label for="email">Email</label>
                <input class="sinput" type="text" placeholder="email (optional)" id="email" name="email" value="${loginuser.getEmail() }" >
                <label for="mno">Mobile Number</label>
                <input class="sinput" type="number" placeholder="mobile no" id="mno" name="mno" value="${loginuser.getMno() }" >
                <button class="btn" onclick="addDetails();">Confirm Booking</button>
        </div>
    </div>
    
    <script>
    let allseats = document.getElementsByClassName('seat');
    for (let i = 0; i < allseats.length; i++) {
        let seat = allseats[i];
        seat.addEventListener('click', function () {
            this.style.backgroundColor = 'green';
            if (this.hasAttribute('seat-id')) {
                this.style.backgroundColor = 'inherit';
                this.removeAttribute('seat-id');
            }
            else {
                this.setAttribute('seat-id', this.innerText);
            }
            updatePrice();
        });
    }
    function updatePrice() {
        console.log("updating");
        let seatnos = [];
        let count = 0;
        let allseats = document.getElementsByClassName('seat');
        for (let j = 0; j < allseats.length; j++) {
            let curr = allseats[j];
            if (curr.hasAttribute('seat-id')) {
                seatnos.push(curr.innerText);
                count++;
            }
        }
        let dseats = document.getElementById('seatsYouSelected');
        let pseats = document.getElementById('priceForYourSelection');
        dseats.value = "";
        dseats.value = seatnos.toString();
    }
    </script>
</body>
</html>