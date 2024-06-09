<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.ResultSet"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link rel="stylesheet" href="Theme.css">
<title>Insert title here</title>
</head>
<body>
<%
int k=Integer.parseInt(request.getParameter("k"));
session.setAttribute("k", k);
try{
	Class.forName("com.mysql.cj.jdbc.Driver");
	System.out.println("loaded...");
	Connection con= DriverManager.getConnection("jdbc:mysql://localhost:3309/book","root","root");
	System.out.println("connected...");
	PreparedStatement ps= con.prepareStatement("select * from books where bid=?");
	ps.setInt(1, k);
	ResultSet rs1= ps.executeQuery();
	rs1.next();
	
	%>

<form action="buy.jsp">
<h1>BOOK CART</h1>
<div>
<img src="image/<%=rs1.getString(2)%>.jpeg" ><br><br>
<table>
<tr>
<td>Book Name</td><td> <%= rs1.getString("book_name")%></td></tr>
<tr><td>Book Author</td><td> <%=rs1.getString("author")%></td></tr>
<tr><td>Book Price </td><td>&#8377; <%=rs1.getString("price") %> </td></tr>
<tr><td>Quantity </td><td><input type="number" name="q" value=1 required></td></tr>
<tr><td><input type="submit" value="buy"></input></td><td><button><a href="Welcome">cancel</a></button></td></tr>
</table>
</div>

</form>
<% 
}catch(Exception e){
	System.out.println(e);
	response.sendRedirect("./welcome");
}
%>
</body>
</html>