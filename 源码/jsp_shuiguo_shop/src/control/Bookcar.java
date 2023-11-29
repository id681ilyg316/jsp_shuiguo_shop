package control;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import util.Info;

import dao.CommDAO;

public class Bookcar extends HttpServlet {

	/**
	 * Constructor of the object.
	 */
	public Bookcar() {
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
     String bookid = request.getParameter("bookid");
	 HashMap m = (HashMap)request.getSession().getAttribute("user");
	 String num = request.getParameter("num");
	 
	 String uid = (String)m.get("id");
	 String sql = "";
	 CommDAO dao = new  CommDAO();
	 List<HashMap> booklist = dao.select("select * from bookcar where uname='"+uid+"' and bookid='"+bookid+"'");
	 if(booklist.size()==0)
	 {
		 dao.commOper("insert into bookcar(uname,bookid,savetime,booknum) values('"+uid+"','"+bookid+"','"+Info.getDateStr()+"',"+num+")");
	 }else{
		 dao.commOper("update bookcar set booknum=booknum+"+num+" where bookid='"+bookid+"' and uname='"+uid+"'");
	 }
	 
	 response.sendRedirect( "/shuiguo_shop/num.jsp?suc=suc");
	 
	}

	/**
	 * Initialization of the servlet. <br>
	 *
	 * @throws ServletException if an error occure
	 */
	public void init() throws ServletException {
		// Put your code here
	}

}
