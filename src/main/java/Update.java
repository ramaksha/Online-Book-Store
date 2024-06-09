

import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

@MultipartConfig
@WebServlet("/Update")
public class Update extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Update() {
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
		
		String bname=request.getParameter("bname");
		String auth=request.getParameter("auth");
		String price=request.getParameter("price");
		try {
		Part file=request.getPart("image");
			if(file.getContentType().equals("image/jpeg"))
			{
		
		String path="D:/advancejava/Book_Management/src/main/webapp/image/"+bname+".jpeg";
		FileOutputStream fos= new FileOutputStream(path);
		InputStream is= file.getInputStream(); 
		byte[] data= new byte[is.available()];
		is.read(data);
		fos.write(data);
		fos.close();
		}else {
			response.getWriter().write("  incorrect file format");    		}}
		catch(Exception e) {
			e.printStackTrace();
		}
	
	try {
		Class.forName("com.mysql.cj.jdbc.Driver");
		System.out.println("loaded...");
	Connection con=	DriverManager.getConnection("jdbc:mysql://localhost:3309/book","root","root");
		System.out.println("connected..");
		PreparedStatement ps= con.prepareStatement("insert into books(book_name,author,price)values(?,?,?)");
		ps.setString(1, bname);
		ps.setString(2, auth);
		ps.setString(3, price);
		if(ps.executeUpdate()!=0) {
			response.getWriter().write("saved...");
		}
	}catch(Exception e) {
		e.printStackTrace();
	}
	
	}
}
