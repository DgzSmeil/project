package SQLup;

import java.io.BufferedInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.io.Writer;
import java.net.MalformedURLException;
import java.net.URL;
import java.net.URLConnection;

import com.sun.org.apache.bcel.internal.generic.NEW;

public class URLDemo {

	public static void main(String[] args) {
		try {
			URL url = new URL("https://51cto.com/edu/index/images/sublogo01.png");
			URLConnection un = url.openConnection();
			InputStream in = un.getInputStream();
			FileOutputStream file = new FileOutputStream("F:\\sublogo01.png");
			BufferedInputStream bf = new BufferedInputStream(in);
			int n=0;
			byte b[] = new byte[2048];
			while ((n=bf.read(b))!=-1) {
				file.write(b, 0, n);
				System.out.println(new String(b,0,n));
			}
			in.close();
			bf.close();
			System.out.println("保存成功！！！");
		} catch (MalformedURLException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
}
