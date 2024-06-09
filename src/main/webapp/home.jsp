<%@page import="java.sql.ResultSet"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<style type="text/css">
body{

background-image: url("image/back.jpg");

}
img{
height:10vw;
width:7.6vw;

}
table{
position: absolute;
left: 5vw;
display:flex;
flex-direction: column;
background-image: url("image/page.jpeg");
padding-bottom: 4vw;
display: table;
font-size: 2vw;
}
tr{

padding-bottom:5vw;
outline:black;
outline-style:solid;
}
tr:hover {
color:brown;
border-color: aquamarine;
box-shadow: 10px 10px 5px aqua;
}
h1{

width:100%;
font-size:3.4vw;
background-color: black;
color: white;
text-align: center;
}
button:hover{
                z-index: 1;
                background-color: black;
                color: white;
            }
            button{
                    z-index: 2;
                    font-size: 3vw;
                    
                    background-color:transparent;
                    
                    position: fixed;
                    width: 4%;
                    height: 9%;
                   right: 1%;
                   bottom: 7%;
            }
            b{
                
                padding: 5%;
            }
 
   
</style>
</head>
<body>
<button id="b" onclick="window.scrollTo(50, 0);"><b >&#8593</b></button>
<h1>BOOK CART</h1>
<table style="width:90%"> 
<%
ResultSet rs=(ResultSet)session.getAttribute("rs");
while(rs.next()){
%>
<tr onclick="document.location='details.jsp?k=<%=rs.getInt(1)%>'">
<td><img src="image/<%= rs.getString(2)%>.jpeg" ></td>
<td><%= rs.getString("book_name")%></td>
<td><%=rs.getString("author")%></td>
<td> &#8377;<%=rs.getString("price")%></td>
</tr>


<%
}

%>
</table>

</body>
</html>