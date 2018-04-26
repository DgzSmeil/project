package SQLup;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.Random;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.fileupload.FileItemFactory;
import org.apache.commons.fileupload.FileItemIterator;
import org.apache.commons.fileupload.FileItemStream;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import org.apache.commons.fileupload.util.Streams;

import com.alibaba.fastjson.JSON;

public class Fileup extends HttpServlet {

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		doPost(request, response);
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String contentType = request.getContentType();
		ServletContext application = getServletContext();
		PrintWriter out = response.getWriter();
		if (contentType.indexOf("multipart/form-data") >= 0) {
			Result result = new Result();
			result.avatarUrls = new ArrayList();
			result.success = false;
			result.msg = "Failure!";

			FileItemFactory factory = new DiskFileItemFactory();
			ServletFileUpload upload = new ServletFileUpload(factory);
			FileItemIterator fileItems = null;
			try {
				fileItems = upload.getItemIterator(request);
			} catch (FileUploadException e) {
				e.printStackTrace();
			}
			int avatarNumber = 1;
			SimpleDateFormat simpleDateFormat = new SimpleDateFormat(
					"yyyyMMddHHmmssS");
			String fileName = simpleDateFormat.format(new Date());
			Random random = new Random();
			String randomCode = "";
			for (int i = 0; i < 8; i++) {
				randomCode += Integer.toString(random.nextInt(36), 36);
			}
			fileName = fileName + randomCode;
			String initParams = "";
			BufferedInputStream inputStream;
			BufferedOutputStream outputStream;
			try {
				while (fileItems.hasNext()) {
					FileItemStream fileItem = fileItems.next();
					String fieldName = fileItem.getFieldName();
					Boolean isSourcePic = fieldName.equals("__source");
					if (fieldName.equals("__initParams")) {
						inputStream = new BufferedInputStream(fileItem
								.openStream());
						byte[] bytes = new byte[inputStream.available()];
						inputStream.read(bytes);
						initParams = new String(bytes, "UTF-8");
						inputStream.close();
					} else if (isSourcePic || fieldName.startsWith("__avatar")) {
						String virtualPath = "/upload/" + avatarNumber + "_"
								+ fileName + ".jpg";
						if (isSourcePic) {
							result.sourceUrl = virtualPath = "/upload"
									+ fileName + ".jpg";
						} else {
							result.avatarUrls.add(virtualPath);
							avatarNumber++;
						}
						inputStream = new BufferedInputStream(fileItem
								.openStream());
						outputStream = new BufferedOutputStream(
								new FileOutputStream(application
										.getRealPath("/")
										+ virtualPath.replace("/", "\\")));
						Streams.copy(inputStream, outputStream, true);
						inputStream.close();
						outputStream.flush();
						outputStream.close();
					}
				}
			} catch (FileUploadException e) {
				e.printStackTrace();
			}
			if (result.sourceUrl != null) {
				result.sourceUrl += initParams;
			}
			result.success = true;
			result.msg = "Success!";
			out.println(JSON.toJSONString(result));
		}

	}

}
