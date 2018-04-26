package MyQQ;

import java.awt.Color;
import java.awt.Toolkit;

import javax.swing.ImageIcon;
import javax.swing.JFrame;
import javax.swing.JLabel;

import com.sun.awt.AWTUtilities;


public class TipUI extends JFrame {

	JLabel lblmyinfo;
	public TipUI(Account myInfo) {
		setUndecorated(true);
		getContentPane().setBackground(Color.ORANGE);
		String str = myInfo.getNickName()+"("+myInfo.getQqCode()+")";
		if(myInfo.getOnlinestatus().equals(Cmd.STATUS[0])){
			str +="上线了";
		}else{
			str +="下线了";
		}
		String heaimag = changeStatus(myInfo);
		lblmyinfo = new JLabel(str,new ImageIcon(heaimag),JLabel.RIGHT);
		add(lblmyinfo);
		
		setAlwaysOnTop(true);
		setSize(200, 100);
		Toolkit toolkit = Toolkit.getDefaultToolkit();
		int width = toolkit.getScreenSize().width-200;
		int heigth = toolkit.getScreenSize().height;
		setVisible(true);
		for(int i=0;i<100;i++){
			setLocation(width,heigth-i);
			try {
				Thread.sleep(50);
			} catch (InterruptedException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		for(int i=100;i>0;i--){
			AWTUtilities.setWindowOpacity(this, 0.01f*i);
            try {
				Thread.sleep(50);
			} catch (InterruptedException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		dispose();
	}
	public static void main(String[] args) {
		new TipUI(null);
	}
	public String changeStatus(Account myInfo) {
		String cbstatu = myInfo.getOnlinestatus();
		String filename = myInfo.getHeadimg();
		String headimg = myInfo.getHeadimg();
		if(cbstatu.equals(Cmd.STATUS[0])){
			filename = headimg;
		}else if(cbstatu.equals(Cmd.STATUS[1])){
			int pow = headimg.indexOf('.');
			String fil = headimg.substring(0, pow);
			String fix = headimg.substring(pow,headimg.length());
			filename = fil + "_h"+fix;
		}
		return filename;
	}
}
