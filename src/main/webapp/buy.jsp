<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<link rel="stylesheet" href="Theme.css">
</head>
<body>
<form action="./Thank" method="post">
<h1>BOOK CART</h1>
<div class="b">
<table>

<%

try{
	int q=Integer.parseInt(request.getParameter("q"));
	int k=(Integer)session.getAttribute("k");
	Class.forName("com.mysql.cj.jdbc.Driver");
	System.out.println("loaded...");
	Connection con= DriverManager.getConnection("jdbc:mysql://localhost:3309/book","root","root");
	System.out.println("connected...");
	PreparedStatement ps= con.prepareStatement("select * from books where bid=?");
	ps.setInt(1, k);
	
ResultSet rs2= ps.executeQuery();
rs2.next();
System.out.println("hii");
%>
<tr><td>customer Name</td><td><input type="text" name="un"></td></tr>
<tr><td>Address</td><td><input type="text" name="add"></td></tr>
<tr><td>phone no</td><td><input type="number" name="ph"></td></tr>
<tr><td>Book Name</td><td> <%= rs2.getString("book_name")%></td></tr>
<tr><td>Book Author</td><td> <%=rs2.getString("author")%></td></tr>
<tr><td>Book Price </td><td>&#8377;<%=rs2.getString("price") %> </td></tr>
<tr><td>Quantity </td><td><%=q%></td></tr>
<tr><td>Total price</td><td>&#8377;<%= q*rs2.getInt("price")%></td></tr>
<tr><td><input type="submit" value="confirm" onclick="validateForm(this.un,this.ph,this.add)"></input></td><td><button><a href="Welcome">cancel</a></button></td></tr>
</table>
<input type="hidden" name="q" value=<%=q%>>
<% 
}catch(Exception e){
	System.out.println(e);
	response.sendRedirect("./Welcome");
}
%>
</div>
</form>
</body>
</html>