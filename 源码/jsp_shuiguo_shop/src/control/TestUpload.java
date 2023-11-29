package control;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.fileupload.*;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import org.apache.commons.fileupload.servlet.ServletRequestContext;

import util.Info;

public class TestUpload extends HttpServlet {

	/**
	 * Constructor of the object.
	 */
	public TestUpload() {
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
     
		request.setCharacterEncoding("UTF-8");
		//这里对request进行封装，RequestContext提供了对request多个访问方法
		RequestContext requestContext = new ServletRequestContext(request);
		//判断表单是否是Multipart类型的。这里可以直接对request进行判断，不过已经以前的用法了
		if(FileUpload.isMultipartContent(requestContext)){

		   DiskFileItemFactory factory = new DiskFileItemFactory();
		   //设置文件的缓存路径
		   factory.setRepository(new File(request.getRealPath("/upfile/")+"/"));
		   ServletFileUpload upload = new ServletFileUpload(factory);
		   //设置上传文件大小的上限，-1表示无上限
		   upload.setSizeMax(100*1024*1024);
		   List items = new ArrayList();
		    try {
		        //上传文件，并解析出所有的表单字段，包括普通字段和文件字段
		     items = upload.parseRequest(request);
		    } catch (FileUploadException e1) {
		     System.out.println("文件上传发生错误" + e1.getMessage());
		    }
		     //下面对每个字段进行处理，分普通字段和文件字段
		    
		    FileItem fileItem1 = (FileItem) items.get(0);
		    System.out.println(Info.getUTFStr(fileItem1.getString()));
		    
		   
		    FileItem fileItem = (FileItem) items.get(1);
		    //如果是普通字段
		   
		     //保存文件，其实就是把缓存里的数据写到目标路径下
		     if(fileItem.getName()!=null && fileItem.getSize()!=0){
		      File fullFile = new File(fileItem.getName());
		      File newFile = new File(request.getRealPath("/upfile/")+"/" +Info.generalFileName(fullFile.getName()) );
		      try {
		       fileItem.write(newFile);
		      } catch (Exception e) {
		       e.printStackTrace();
		      }
		     }else{
		      System.out.println("文件没有选择 或 文件内容为空");
		     }
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
