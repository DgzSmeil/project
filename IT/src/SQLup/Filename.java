package SQLup;

import java.io.File;
import java.util.Date;

import com.oreilly.servlet.multipart.FileRenamePolicy;
public class Filename implements FileRenamePolicy{
	public File rename(File file) {
		String filename="";
		String filehouzui="";
		String srcfilename = file.getName()+".jpg";
		int port = srcfilename.lastIndexOf(".");
		if(port!=-1){
			filehouzui = srcfilename.substring(port);
			filename = new Date().getTime()+"";
		}else {
			filename = (new Date()).getTime()+"";
			filehouzui="";
		}
		String filerealname = filename+filehouzui;
		file = new File(file.getParent(),filerealname);
		return file;
	}
}
