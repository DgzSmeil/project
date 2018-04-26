package SQLservlet;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.Enumeration;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import SQLBase.SQLSentenceimp;
import SQLBean.NewmsgBean;
import SQLBean.PagingBean;
import SQLBean.TeacherBean;
import SQLup.ContextUtils;
import SQLup.Filename;

import com.oreilly.servlet.MultipartRequest;

public class Newmsgservlet extends HttpServlet {
	SQLSentenceimp sql = new SQLSentenceimp();
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		doPost(request, response);
	}
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String order = request.getParameter("order");
		HttpSession session = request.getSession();
		if(order.equals("list")){
			paginglist(request, response);
			request.getRequestDispatcher("data/newmsglist.jsp").forward(request, response);
		}else if(order.equals("studentlist")){
			paginglist(request, response);
			request.getRequestDispatcher("data/newmsgliststudent.jsp").forward(request, response);
		}else if (order.equals("add")) {
			TeacherBean teacherbean = (TeacherBean)session.getAttribute("teacherbean");
			String path = getServletContext().getRealPath("/")+"upfile";
			 // 保存文件的路径，必须是tomcat里面当前项目下的子路径 
			File file = new File(path);
			if (!file.exists()) {
				file.mkdir();
			}  
	        // 文件最大容量 3M  
	        int fileMaxSize = 3 * 1024 * 1024;  
	        // 存放文件描述  
	        @SuppressWarnings("unused")  
	        String[] fileDiscription = { null, null };  
	        // 文件名  
	        String fileName = null;  
	        // 上传文件数  
	        int fileCount = 0;  
	        // 重命名策略  
	        Filename rfrp = new Filename();  
	        // 上传文件  
	        MultipartRequest mulit =null;
	        try{
	        	mulit = new MultipartRequest(request, path,fileMaxSize, "utf-8", rfrp);//取得上传文件  
	        }catch(Exception e){
	        	request.setAttribute("msg", "上传文件的大小不能超过3M");
	        	getServletContext().getRequestDispatcher("/newsMsgAdd.jsp").forward(request, response);
	        	return;
	        }
	        //获取普通控件的值，不能使用request对象
	        String msgName = mulit.getParameter("msgname");  
	        String oneWord = mulit.getParameter("msgmain");  
	        String msgContent = mulit.getParameter("msgContent");  
	        String publishDate = mulit.getParameter("data");  
	        String effective = mulit.getParameter("zhuangtai");  
	        String seq = mulit.getParameter("paixu");  
	        String newsType = mulit.getParameter("leibie");
	        Enumeration filesname = mulit.getFileNames();//取得上传的所有文件(相当于标识)   
	        while (filesname.hasMoreElements()) {  
	            String name = (String) filesname.nextElement();  
	            fileName = mulit.getFilesystemName(name); 
	            String contentType = mulit.getContentType(name);
	            System.out.println("文件名：" + fileName);  
	            System.out.println("文件类型： " + contentType);   
	            //out.println("<img src='upfile/"+fileName+"' />");
	        } 
	        String msgContentUrl="upfile/"+ContextUtils.getFilename()+".html";
	        //把新闻公告的内容生成静态的html页面
	        makehtml(msgContent, msgContentUrl, request);
			NewmsgBean newsmsg = new NewmsgBean();
			newsmsg.setEffective(Integer.parseInt(effective));
			newsmsg.setImageurl("upfile/"+fileName);
			newsmsg.setMsgcontent(msgContent);
			newsmsg.setMsgcontenturl(msgContentUrl);
			newsmsg.setMsgname(msgName);
			newsmsg.setNewsType(Integer.parseInt(newsType));
			newsmsg.setOneword(oneWord);
			newsmsg.setPublishdate(publishDate);
			newsmsg.setPublishusername(teacherbean.getTeachername());
			newsmsg.setSeq(Integer.parseInt(seq));
			sql.newsmsgadd(newsmsg);
			paginglist(request,response);
			request.getRequestDispatcher("data/newmsglist.jsp").forward(request, response);
		}else if (order.equals("delete")) {
			String newmsgid = request.getParameter("newmsgid");
			sql.newsmsgdelete(newmsgid);
			paginglist(request,response);
			request.getRequestDispatcher("data/newmsglist.jsp").forward(request, response);
		}else if (order.equals("update")) {
			String newmsgid = request.getParameter("newmsgid");
			NewmsgBean newmsgbean = sql.findnewsmsg(newmsgid);
			request.setAttribute("newmsgbean", newmsgbean);
			session.setAttribute("newmsg", newmsgbean);
			request.getRequestDispatcher("data/newmsgupdate.jsp").forward(request, response);
		}else if (order.equals("updatesave")) {
			TeacherBean teacherbean = (TeacherBean)session.getAttribute("teacherbean");
			String path = getServletContext().getRealPath("/")+"upfile";
			 // 保存文件的路径，必须是tomcat里面当前项目下的子路径 
			File file = new File(path);
			if (!file.exists()) {
				file.mkdir();
			}  
	        // 文件最大容量 3M  
	        int fileMaxSize = 3 * 1024 * 1024;  
	        // 存放文件描述  
	        @SuppressWarnings("unused")  
	        String[] fileDiscription = { null, null };  
	        // 文件名  
	        String fileName = null;  
	        // 上传文件数  
	        int fileCount = 0;  
	        // 重命名策略  
	        Filename rfrp = new Filename();  
	        // 上传文件  
	        MultipartRequest mulit =null;
	        try{
	        	mulit = new MultipartRequest(request, path,fileMaxSize, "UTF-8", rfrp);//取得上传文件  
	        }catch(Exception e){
	        	request.setAttribute("msg", "上传文件的大小不能超过3M");
	        	getServletContext().getRequestDispatcher("/newsMsgAdd.jsp").forward(request, response);
	        	return;
	        }
	        //获取普通控件的值，不能使用request对象
	        String newmsgid = mulit.getParameter("newmsgid");
	        String msgName = mulit.getParameter("msgname");  
	        String oneWord = mulit.getParameter("msgmain");  
	        String msgContent = mulit.getParameter("msgContent");  
	        String publishDate = mulit.getParameter("date");  
	        String effective = mulit.getParameter("zhuangtai");  
	        String seq = mulit.getParameter("paixu");  
	        String newsType = mulit.getParameter("leibie");
	        String publishusername = mulit.getParameter("publishusername");
	        Enumeration filesname = mulit.getFileNames();//取得上传的所有文件(相当于标识)   
	        while (filesname.hasMoreElements()) {  
	            String name = (String) filesname.nextElement();  
	            fileName = mulit.getFilesystemName(name); 
	            String contentType = mulit.getContentType(name);
	            System.out.println("文件名：" + fileName);  
	            System.out.println("文件类型： " + contentType);   
	            //out.println("<img src='upfile/"+fileName+"' />");
	        } 
	        String msgContentUrl="upfile/"+ContextUtils.getFilename()+".html";
	        //把新闻公告的内容生成静态的html页面
	        makehtml(msgContent, msgContentUrl, request);
			NewmsgBean newsmsg = new NewmsgBean();
			newsmsg.setNewmsgid(Integer.parseInt(newmsgid));
			newsmsg.setEffective(Integer.parseInt(effective));
			if(fileName==null || fileName.equals("")){
				newsmsg.setImageurl(mulit.getParameter("imageurl"));
			}else {
				newsmsg.setImageurl("upfile/"+fileName);
			}
			newsmsg.setMsgcontent(msgContent);
			newsmsg.setMsgcontenturl(msgContentUrl);
			newsmsg.setMsgname(msgName);
			newsmsg.setNewsType(Integer.parseInt(newsType));
			newsmsg.setOneword(oneWord);
			newsmsg.setPublishdate(publishDate);
			newsmsg.setPublishusername(publishusername);
			newsmsg.setSeq(Integer.parseInt(seq));
			sql.newsmsgupdte(newsmsg);
			paginglist(request,response);
			request.getRequestDispatcher("data/newmsglist.jsp").forward(request, response);
		}
	}
	public void paginglist(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		// 实例化javabean，取参数
		PagingBean page = new PagingBean();
		// 总记录条数，计算总页数
		page.setPagebarsum(sql.pagebarsum("newmsg"));
		// 当前页
		String currenpage = request.getParameter("currenpage");
		// 操作
		String handle = request.getParameter("handle");
		if (currenpage == null || currenpage.equals("")) {
			// 当前页为第一页
			page.setCurrentpage(1);
		} else {
			page.setCurrentpage(Integer.parseInt(currenpage));
		}
		if (handle == null || handle.equals("")) {
			//当前页的操作
			page.setHandle("firstpage");
		} else {
			page.setHandle(handle);
		}
		List<NewmsgBean> msglist = sql.msglist(page.getPagebarsize(),
				page.getStarlocal());
		request.setAttribute("msglist", msglist);
		request.setAttribute("pager", page);
	}
	private void makehtml(String content,String filename,HttpServletRequest request){
		String PAGE_HEAD="<!DOCTYPE HTML PUBLIC \"-//W3C//DTD HTML 4.01 Transitional//EN\"><html><head><meta http-equiv=\"Content-Type\" content=\"text/html; charset=utf-8\"></head><body>";
		String PAGE_TAIL="</body></html>";

		content = PAGE_HEAD + content + PAGE_TAIL;
		String savePath = request.getRealPath("/") + filename;
		File file = new File(savePath);
		FileOutputStream fos;
		try {
			fos = new FileOutputStream(file);
			fos.write(content.getBytes());
			fos.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
