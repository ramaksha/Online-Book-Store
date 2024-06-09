<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<style type="text/css">
body{
text-align: center;
background-image: url("image/back.jpg");
}
div{
position: absolute;
left:30%;
border-style: solid;
border-color: black;
width:30%;
padding:5%;
font-size: 2vw;
border-radius: 8%;
background-image: url("image/page.jpeg");
}
img{
height: 40%;
width: 56%;
}
img:hover {
	height: 80%;
	width: 112%;
}
button,input[type=submit]{
border-style: solid;
                border-radius: 02vw;
                padding: 1vw;
                background-color: aqua;
                display: inline-block;
                width:7vw;
}
 button:hover{
                background-color: antiquewhite;
            }
input[type=submit]:hover {
	background-color: antiquewhite;
}
input[type=number]{
position:relative;
width: 18vw;
}
h1{
position:relative;
width:100%;
background-color: black;
color: white;
text-align: center;
}
</style>
</head>
<body>
<h1>BOOK CART</h1>
<form action="./Update" method="post" enctype="multipart/form-data">
<div>
BOOK DETAILS
<hr>
<table>
<tr>
<td>Book Name</td><td><input type="text" name="bname"></td></tr>
<tr><td>Book Author</td><td><input type="text" name="auth"> </td></tr>
<tr><td>Book Price </td><td>&#8377; <input type="number" name="price"> </td></tr>
<tr><td>Book image </td><td><input type="file" name="image"></td></tr>
<tr><td><input type="submit" ></input></td><td><button><a href="Welcome">cancel</a></button></td></tr>
</table>
</div>
</form>
</body>
</html>