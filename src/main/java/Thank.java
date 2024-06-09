

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.time.LocalDate;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class Thank
 */
@WebServlet("/Thank")
public class Thank extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Thank() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
		HttpSession s= request.getSession();
		int k=(Integer)s.getAttribute("k");
		int q=Integer.parseInt(request.getParameter("q"));
		String d=LocalDate.now().toString();
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			Connection con= DriverManager.getConnection("jdbc:mysql://localhost:3309/book","root","root");
			PreparedStatement ps=con.prepareStatement("insert into Order_Details(book_id,name,address,phone,odate,quantity)values(?,?,?,?,?,?)");
			ps.setInt(1,k);
			ps.setString(2,request.getParameter("un"));
			ps.setString(3,request.getParameter("add"));
			ps.setLong(4,Long.parseLong(request.getParameter("ph")));
			ps.setString(5,d);
			ps.setInt(6, q);
			if(ps.executeUpdate()!=0)
				response.sendRedirect("Success.jsp");
		} catch (ClassNotFoundException | SQLException e) {
			// TODO Auto-generated catch block
			System.out.println(e);
			response.sendRedirect("./welcome");
		}
		
	}

}
