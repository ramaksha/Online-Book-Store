

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


@SuppressWarnings("serial")
@WebServlet("/Welcome")
public class Welcome extends HttpServlet {
   protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			System.out.println("loaded...");
			Connection con= DriverManager.getConnection("jdbc:mysql://localhost:3309/book","root","root");
			System.out.println("connected...");
			Statement stm= con.createStatement();
			ResultSet rs=stm.executeQuery("select * from books");
			HttpSession s= req.getSession();
			s.setAttribute("rs", rs);
			s.setAttribute("con", con);
			
		} catch (ClassNotFoundException | SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		res.sendRedirect("home.jsp");
	}

}
