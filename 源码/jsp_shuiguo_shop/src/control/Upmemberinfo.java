package control;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import util.Info;
import dao.CommDAO;

public class Upmemberinfo extends HttpServlet {

	/**
	 * Constructor of the object.
	 */
	public Upmemberinfo() {
		super();
	}

	/**
	 * Destruction of the servlet. <br>
	 */
	public void destroy() {
		super.destroy(); // Just puts "destroy" string in log
		// Put your code here
	}

	/**
	 * The doGet method of the servlet. <br>
	 *
	 * This method is called when a form has its tag value method equals to get.
	 * 
	 * @param request the request send by the client to the server
	 * @param response the response send by the server to the client
	 * @throws ServletException if an error occurred
	 * @throws IOException if an error occurred
	 */
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		this.doPost(request, response);
	}

	/**
	 * The doPost method of the servlet. <br>
	 *
	 * This method is called when a form has its tag value method equals to post.
	 * 
	 * @param request the request send by the client to the server
	 * @param response the response send by the server to the client
	 * @throws ServletException if an error occurred
	 * @throws IOException if an error occurred
	 */
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String id = request.getParameter("id");
         String utype = request.getParameter("utype");
         System.out.println(utype);
	     String upass = request.getParameter("upass");
	     String tname = request.getParameter("tname");
	     String sex = request.getParameter("sex");
	     String age = request.getParameter("age");
	     String tel = request.getParameter("tel");
	     String addr = request.getParameter("addr");
	     String email = request.getParameter("email");
	     String qq = request.getParameter("qq");
	     CommDAO dao = new CommDAO();
			String sql = "update buser set upass='"+upass+"', tname='"+tname+"', sex='"+sex+"', age='"+age+"', tel='"+tel+"', addr='"+addr+"', email='"+email+"', qq='"+qq+"' where id=" +id;
					
			System.out.println(sql);
			dao.commOper(sql);
			request.setAttribute("suc", "");
			if(utype.equals("0"))
			{
			request.getRequestDispatcher("/admin/upmember.jsp").forward(request, response);
	}else{
		request.getRequestDispatcher("/upxx.jsp").forward(request, response);
	}
	}

	/**
	 * Initialization of the servlet. <br>
	 *
	 * @throws ServletException if an error occurs
	 */
	public void init() throws ServletException {
		// Put your code here
	}

}
