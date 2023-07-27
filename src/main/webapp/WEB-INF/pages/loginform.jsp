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
    <title>loginform</title>
    <style>
        .container { 
            border: 1px solid black;
            margin:auto;
            padding: 10px;
            width:400px;
            background-color: aliceblue;

        }
        .header { 
            text-align:center;
            display:block; 
            padding:5px;
            color : rgb(157, 118, 210); 
        }
        .container * {
            display: block;
        }
        label { 
            color:black;
            display:block;
            margin:5px;
        }
        input {
            line-height:1.5rem;
            border-style:none;
            border-bottom:1px solid black;
            display:block;
            background-color: inherit;
        }
        input:focus { 
            background-color:inherit;
            outline:none;
            border-bottom:2px solid black;
        }
        .btn { 
            width:100%;
            background-color:inherit; 
            color:red;
            border:1px solid black;
            padding:5px;
            text-transform:uppercase;
        }
        .btn:hover { 
            background-color:rgb(157, 118, 210); 
            color:white;
        }
        .setwidth {
                width:90%;
        }
    </style>
</head>
<body>
    <section>
        <h3 class="header">Login Form</h3>
        <div class="container">
         <p id="error"></p>
         <form action="login" method="post">
            <label for="uname">Username</label>
            <input class="setwidth" type="text" name="uname" id="uname" placeholder="username"> 
            <label for="pass">Password</label>
            <input class="setwidth" type="password" name="pass" id="pass" placeholder="password">
            <a style="margin:5px 0;" href="#" onclick="showpass()" style="color:blue;">show password</a>
            <input class="btn" type="submit" value="submit" />
         </form>
        </div>
    </section>
</body>
</html>