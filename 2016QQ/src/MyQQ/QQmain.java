package MyQQ;
import java.awt.Color;
import java.awt.MenuItem;
import java.awt.PopupMenu;
import java.util.Hashtable;
import java.util.Vector;

import javax.swing.ImageIcon;
import javax.swing.JButton;
import javax.swing.JComboBox;
import javax.swing.JFrame;
import javax.swing.JLabel;
import javax.swing.JList;
import javax.swing.JMenuItem;
import javax.swing.JPopupMenu;
import javax.swing.JTabbedPane;
import javax.swing.JTextField;
import javax.swing.UIManager;

	public class QQmain  extends JFrame{

		JLabel imag,lblmyinfo;
		JTabbedPane tablepane;
		JList lifriend,lifamily,limate,lihmd;
		JButton btnselect,btnhuanfu;
		JComboBox cbstatu;
		JPopupMenu popupmenu;
		JTextField shousuo;
		JMenuItem miChat,milookinfo,midel;
		JMenuItem mifrienf,mifamily,mimate,mihmd;
		Account myInfo,friendinfo;
		Vector<Account> Vmyinfo,Vfriend,Vfamily,Vmate,Vhmd;
		BaseQQ base = new BaseQQ();
		//托盘对应的菜单
		PopupMenu popTray;
		MenuItem miOpen,miExit,miOnline,miLevel,miBuys;
		int x,y;
		Hashtable<Integer, ChatUI> chatWin = new Hashtable<Integer, ChatUI>();
		public QQmain() {
			
		    this.myInfo=myInfo;
			setResizable(false);
			 imag=new JLabel(new ImageIcon("tubiao/meinv.jpg"));
			imag.setLayout(null);
			imag.setOpaque(false);
			 Vmyinfo = new Vector<Account>();
			 Vfriend = new Vector<Account>();
			 Vfamily = new Vector<Account>();
			 Vmate = new Vector<Account>();
			 Vhmd = new Vector<Account>();
			 lifriend = new JList();
			 lifamily = new JList();
			 limate = new JList();
			 lihmd = new JList();
			
			lifriend.setOpaque(false);
		    lifamily.setOpaque(false);
		    limate.setOpaque(false);
		    lihmd.setOpaque(false);
			UIManager.put("TabbedPane.contentOpaque", false);
			tablepane = new JTabbedPane();
			tablepane.setOpaque(false);
			tablepane.add("好友",lifriend);
			tablepane.add("家人",lifamily);
			tablepane.add("同学",limate);
			tablepane.add("黑名单",lihmd);
			tablepane.setBounds(0 ,140, 300, 460);
			imag.add(tablepane);
			add(imag);
			
			
		   
			imag.add(lblmyinfo);
			cbstatu = new JComboBox(Cmd.STATUS);
			cbstatu.removeItemAt(1);
			cbstatu.setBounds(160, 27, 60, 20);
			cbstatu.setBackground(new Color(0,0,0,0));
			cbstatu.setOpaque(false);
			imag.add(cbstatu);
			JLabel xiaoqq = new JLabel(new ImageIcon("tubiao/xiaoqq.png"));
			xiaoqq.setBounds(2,2, 43, 21);
			imag.add(xiaoqq);
			
			JLabel tianqi = new JLabel(new ImageIcon("tubiao/yun.png"));
			tianqi.setBounds(235,27, 80, 75);
			imag.add(tianqi);
			
			JLabel qita = new JLabel(new ImageIcon("tubiao/qita.png"));
			qita.setBounds(230, 90, 22, 20);
			imag.add(qita);
			JLabel yifu = new JLabel(new ImageIcon("tubiao/yifu.png"));
			yifu.setBounds(257, 90, 22, 20);
			imag.add(yifu);
			JLabel xiaoxi = new JLabel(new ImageIcon("tubiao/xiaoxi.png"));
			xiaoxi.setBounds(280, 90, 22, 20);
			imag.add(xiaoxi);
			shousuo = new JTextField(15);
			shousuo.setOpaque(false);
			shousuo.setBounds(0, 115, 200, 24);
			imag.add(shousuo);
			
			JLabel liulan = new JLabel(new ImageIcon("tubiao/liulan.png"));
			liulan.setBounds(1,610, 20, 22);
			imag.add(liulan);
			
			
		
			
		
			
			Sendcmd.Sendall(Vmyinfo, myInfo, Cmd.CMD_ONLINE);
			setUndecorated(true);
			setSize(300,670);
			setVisible(true);
	        
		    setLocation(700, 50);
			setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
			base.deloffmsg(myInfo.getQqCode());
		}
		public static void main(String[] args) {
			new QQmain();
		}
		
}
