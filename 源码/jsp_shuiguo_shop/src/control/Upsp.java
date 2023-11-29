package control;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileUpload;
import org.apache.commons.fileupload.RequestContext;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import org.apache.commons.fileupload.servlet.ServletRequestContext;

import util.Info;
import dao.CommDAO;

public class Upsp extends HttpServlet {

	/**
	 * Constructor of the object.
	 */
	public Upsp() {
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

        try {
			String id = request.getParameter("id");
			String proname ="";
			String cpcj	 ="";
			String cand	 ="";
			String protype	 ="";
			String mprice ="";
			String price	 ="";
			String tgrs	 ="";
			String discount = "";
			String kucun	 ="";
			String yujin	 ="";
			String filename=new CommDAO().select("select * from pros where id="+id).get(0).get("img").toString();	 
			String content ="";
		RequestContext  requestContext = new ServletRequestContext(request);
		if(FileUpload.isMultipartContent(requestContext)){

		   DiskFileItemFactory factory = new DiskFileItemFactory();
		   factory.setRepository(new File(request.getRealPath("/upfile/")+"/"));
		   ServletFileUpload upload = new ServletFileUpload(factory);
		   upload.setSizeMax(100*1024*1024);
		   List items = new ArrayList();
		    
		     items = upload.parseRequest(request);
		    
		     proname = Info.getUTFStr(((FileItem) items.get(0)).getString()) ;
		     cpcj = Info.getUTFStr(((FileItem) items.get(1)).getString()) ;
		     cand = Info.getUTFStr(((FileItem) items.get(2)).getString()) ;
		     protype = Info.getUTFStr(((FileItem) items.get(3)).getString()) ;
		     mprice = Info.getUTFStr(((FileItem) items.get(4)).getString()) ;
		     price = Info.getUTFStr(((FileItem) items.get(5)).getString()) ;
		     tgrs = Info.getUTFStr(((FileItem) items.get(6)).getString()) ;
		     discount = Info.getUTFStr(((FileItem) items.get(7)).getString()) ;
		     kucun = Info.getUTFStr(((FileItem) items.get(8)).getString()) ;
		     yujin = Info.getUTFStr(((FileItem) items.get(9)).getString()) ;
		     content = Info.getUTFStr(((FileItem) items.get(11)).getString()) ;
		     
		   FileItem fileItem = (FileItem) items.get(10);
		     if(fileItem.getName()!=null && fileItem.getSize()!=0){
		      File fullFile = new File(fileItem.getName());
		      filename = Info.generalFileName(fullFile.getName());
		      File newFile = new File(request.getRealPath("/upfile/")+"/" + filename);
		      try {
		       fileItem.write(newFile);
		      } catch (Exception e) {
		       e.printStackTrace();
		      }
		     }else{
		     }
		    }
		String sql = "update pros set proname='"+proname+"',cpcj='"+cpcj+"',cand='"+cand+"',protype='"+protype+"',mprice='"+mprice+"',price='"+price+"',tgrs='"+tgrs+"',discount='"+discount+"',kucun='"+kucun+"',yujin='"+yujin+"',img='"+filename+"',content='"+content+"' where id="+id;
	
		new CommDAO().commOper(sql);
		
		request.getRequestDispatcher("/admin/upsp.jsp?id="+id).forward(request, response);
		
		} catch (Exception e1) {
			request.setAttribute("error", "");
		     request.getRequestDispatcher("/admin/fbsp.jsp").forward(request, response);
		    }
		    
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
