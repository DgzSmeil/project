package MyQQ;

import java.awt.AWTException;
import java.awt.BorderLayout;
import java.awt.Color;
import java.awt.Component;
import java.awt.Desktop;
import java.awt.Frame;
import java.awt.Image;
import java.awt.MenuItem;
import java.awt.PopupMenu;
import java.awt.SystemTray;
import java.awt.TrayIcon;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.awt.event.ItemEvent;
import java.awt.event.ItemListener;
import java.awt.event.MouseAdapter;
import java.awt.event.MouseEvent;
import java.awt.event.MouseListener;
import java.awt.event.MouseMotionListener;
import java.awt.event.WindowEvent;
import java.awt.event.WindowListener;
import java.io.ByteArrayInputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.ObjectInputStream;
import java.net.DatagramPacket;
import java.net.DatagramSocket;
import java.net.SocketException;
import java.net.URI;
import java.net.URISyntaxException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Hashtable;
import java.util.Vector;

import javax.imageio.ImageIO;
import javax.swing.AbstractListModel;
import javax.swing.DefaultListCellRenderer;
import javax.swing.ImageIcon;
import javax.swing.JButton;
import javax.swing.JFileChooser;
import javax.swing.JFrame;
import javax.swing.JLabel;
import javax.swing.JList;
import javax.swing.JMenuItem;
import javax.swing.JOptionPane;
import javax.swing.JComboBox;
import javax.swing.JPopupMenu;
import javax.swing.JScrollPane;
import javax.swing.JTabbedPane;
import javax.swing.JTextField;
import javax.swing.UIManager;
import javax.swing.event.AncestorListener;
import javax.swing.text.BadLocationException;

public class MainQQ extends JFrame implements ActionListener,MouseListener,MouseMotionListener,WindowListener,ItemListener{

	private Desktop desktop = Desktop.getDesktop();
	/** 定义统一资源标识符对象 */
	private URI uri;
	private TrayIcon traycon;//托盘图标  
	JLabel kongjian,tengxun,youxiang,app,gouwu,qianbao,huiyuan;
	JLabel gupiao,jindong,yingyong,caidan,shezhi,xiaoxigl,wenjian2,shoucang,chazhao,yingbao;
	JLabel youxi;
	JButton close,zuixiao;
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
	public MainQQ(){}
	public MainQQ(Account myInfo) {
		
	    this.myInfo=myInfo;
	    setIconImage(new ImageIcon(myInfo.getHeadimg()).getImage());
		setResizable(false);
		 imag=new JLabel(new ImageIcon("image/meinv.jpg"));
		imag.setLayout(null);
		 Vmyinfo = new Vector<Account>();
		 Vfriend = new Vector<Account>();
		 Vfamily = new Vector<Account>();
		 Vmate = new Vector<Account>();
		 Vhmd = new Vector<Account>();
		 lifriend = new JList();
		 lifamily = new JList();
		 limate = new JList();
		 lihmd = new JList();
		
		 refresh();
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
		lifriend.addMouseListener(this);
		lifamily.addMouseListener(this);
		limate.addMouseListener(this);
		lihmd.addMouseListener(this);
		
	    zuixiao = new JButton(new ImageIcon("tubiao/zuixiao.png"));
		zuixiao.setBounds(250, 0, 22, 20);
		imag.add(zuixiao);
		zuixiao.addActionListener(this);
		close = new JButton(new ImageIcon("tubiao/guanbi.png"));
		close.setBounds(278, 0, 22, 20);
		close.addActionListener(this);
		imag.add(close);
		ImageIcon icn = new ImageIcon(myInfo.getHeadimg());
		String nickname = myInfo.getNickName()+"("+myInfo.getQqCode()+")"+"\n【"+myInfo.getRemark()+"】";
		lblmyinfo = new JLabel(nickname,icn,JLabel.LEFT);
		lblmyinfo.setBounds(2,27,150,60);
		lblmyinfo.setOpaque(false);
		imag.add(lblmyinfo);
		lblmyinfo.addMouseListener(this);
		cbstatu = new JComboBox(Cmd.STATUS);
		cbstatu.removeItemAt(1);
		cbstatu.setBounds(160, 27, 60, 20);
		cbstatu.setBackground(new Color(0,0,0,0));
		cbstatu.setOpaque(false);
		imag.add(cbstatu);
		cbstatu.addItemListener(this);
		JLabel xiaoqq = new JLabel(new ImageIcon("tubiao/xiaoqq.png"));
		xiaoqq.setBounds(2,2, 43, 21);
		imag.add(xiaoqq);
	
		JLabel tianqi = new JLabel(new ImageIcon("tubiao/yun.png"));
		tianqi.setBounds(235,27, 80, 75);
		imag.add(tianqi);
		
		kongjian = new JLabel(new ImageIcon("tubiao/kongjian.png"));
		kongjian.setBounds(68, 90, 22, 20);
		imag.add(kongjian);
		kongjian.addMouseListener(this);
		
	    tengxun = new JLabel(new ImageIcon("tubiao/tengxun.png"));
		tengxun.setBounds(90, 90, 22, 20);
		imag.add(tengxun);
		tengxun.addMouseListener(this);

	    youxiang = new JLabel(new ImageIcon("tubiao/youxiang.png"));
		youxiang.setBounds(115, 90, 22, 20);
		imag.add(youxiang);
		youxiang.addMouseListener(this);
		
	    app = new JLabel(new ImageIcon("tubiao/App.png"));
		app.setBounds(139, 90, 22, 20);
		imag.add(app);
	    app.addMouseListener(this);
	    
	    gouwu = new JLabel(new ImageIcon("tubiao/gouwu.png"));
		gouwu.setBounds(161, 90, 22, 20);
		imag.add(gouwu);
		gouwu.addMouseListener(this);
		
		qianbao = new JLabel(new ImageIcon("tubiao/qianbao.png"));
		qianbao.setBounds(183, 90, 22, 20);
		imag.add(qianbao);
		qianbao.addMouseListener(this);
		
		huiyuan = new JLabel(new ImageIcon("tubiao/huiyuan.png"));
		huiyuan.setBounds(205, 90, 22, 20);
		imag.add(huiyuan);
		huiyuan.addMouseListener(this);
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
		
		youxi = new JLabel(new ImageIcon("tubiao/youxi.png"));
		youxi.setBounds(24,610, 20, 22);
		imag.add(youxi);
		youxi.addMouseListener(this);
		
		JLabel yinyue = new JLabel(new ImageIcon("tubiao/yinyue.png"));
		yinyue.setBounds(47,610, 20, 22);
		imag.add(yinyue);
		
		JLabel zhibo = new JLabel(new ImageIcon("tubiao/zhibo.png"));
		zhibo.setBounds(70,610, 20, 22);
		imag.add(zhibo);
		
		JLabel shiping = new JLabel(new ImageIcon("tubiao/shiping.png"));
		shiping.setBounds(93,610, 20, 22);
		imag.add(shiping);

		
		btnselect = new JButton(new ImageIcon("tubiao/chazhao.png"));
		btnselect.setBounds(202, 115, 60, 24);
		btnhuanfu = new JButton("换肤");
		btnselect.addActionListener(this);
		btnhuanfu.addActionListener(this);
		imag.add(btnselect);
		
		gupiao = new JLabel(new ImageIcon("tubiao/gupiao.png"));
		gupiao.setBounds(116,610, 20, 22);
		imag.add(gupiao);
		
		jindong= new JLabel(new ImageIcon("tubiao/jingdong.png"));
		jindong.setBounds(139,610, 20, 22);
		imag.add(jindong);
		
		
		caidan= new JLabel(new ImageIcon("tubiao/guanli.png"));
		caidan.setBounds(1,634, 20, 22);
		imag.add(caidan);
		
		shezhi= new JLabel(new ImageIcon("tubiao/shezhi.png"));
		shezhi.setBounds(30,634, 20, 22);
		imag.add(shezhi);
		
		xiaoxigl= new JLabel(new ImageIcon("tubiao/xiaoxigl.png"));
		xiaoxigl.setBounds(60,634, 20, 22);
		imag.add(xiaoxigl);
		
		wenjian2= new JLabel(new ImageIcon("tubiao/wenjian.png"));
		wenjian2.setBounds(90,634, 20, 22);
		imag.add(wenjian2);
		
		shoucang= new JLabel(new ImageIcon("tubiao/shoucang.png"));
		shoucang.setBounds(120,634, 20, 22);
		imag.add(shoucang);
		
		chazhao= new JLabel(new ImageIcon("tubiao/chazhao.png"));
		chazhao.setBounds(180,634, 60, 22);
		imag.add(chazhao);
		
		yingbao= new JLabel(new ImageIcon("tubiao/yingbao.png"));
		yingbao.setBounds(240,634, 60, 22);
		imag.add(yingbao);
		
		 addMouseMotionListener(this);
         addMouseListener(this);
         addWindowListener(this);
		cerenMen();
		
		new ReceiveThreah().start();
		Sendcmd.Sendall(Vmyinfo, myInfo, Cmd.CMD_ONLINE);
		setUndecorated(true);
		setSize(300,670);
		setVisible(true);
		Vector acc2 = new Vector();
		acc2=base.readfriend(myInfo.getQqCode());
        if(acc2.size()!=0){
        	int qq=((Integer)acc2.get(0));
        	Account friendinfo = base.getSelectedFriend(qq);
        	ChatUI chat=chatWin.get(friendinfo.getQqCode());
        	if(chat==null){
        		chat=new ChatUI(myInfo,friendinfo);
        		chatWin.put(friendinfo.getQqCode(), chat);
        	}
        	chat.show();
			String str2=acc2.get(3).toString();
			String name=friendinfo.getNickName();
			Date date=new Date();
			SimpleDateFormat sf=new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
			String time=sf.format(date);
			String s=name+""+time+"\n"+str2+"\n";
			System.out.println(str2);
			chat.txtReceive.setText(s);
        }
	    setLocation(700, 50);
		setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
		base.deloffmsg(myInfo.getQqCode());
	}
	public void cerenMen() {
		 popupmenu = new JPopupMenu();
		 miChat = new JMenuItem("聊天");
		 milookinfo = new JMenuItem("查看好友资料");
		 midel = new JMenuItem("删除好友");
		 mifrienf = new JMenuItem("移动到好友");
		 mifamily = new JMenuItem("移动到家人");
		 mimate = new JMenuItem("移动到同学");
		 mihmd = new JMenuItem("移动到黑名单");
		 
		 miChat.addActionListener(this);
		 milookinfo.addActionListener(this);
		 midel.addActionListener(this);
		 mifrienf.addActionListener(this);
		 mifamily.addActionListener(this);
		 mimate.addActionListener(this);
		 mihmd.addActionListener(this);
		 popupmenu.add(miChat);
		 popupmenu.add(milookinfo);
		 popupmenu.add(midel);
		 popupmenu.add(mifrienf);
		 popupmenu.add(mifamily);
		 popupmenu.add(mimate);
		 popupmenu.add(mihmd);
	
	}
	public void refresh(){
		//获取所有的好友信息（好友，家人，同学，黑名单）
		Vmyinfo = BaseQQ.getmyfriend(myInfo.getQqCode());
//		"同学","好友","家人","黑名单"
		//清空Vector的值
		Vmate.clear();
		Vfriend.clear();
		Vfamily.clear();
		Vhmd.clear();
		for (Account acc : Vmyinfo) {
			String groupName = acc.getGropName();
			if(groupName.equals(Cmd.GROUPNAME[0])){
				Vmate.add(acc);
			}else if(groupName.equals(Cmd.GROUPNAME[1])){
				Vfriend.add(acc);
			}else if(groupName.equals(Cmd.GROUPNAME[2])){
				Vfamily.add(acc);
			}else if(groupName.equals(Cmd.GROUPNAME[3])){
				Vhmd.add(acc);
			}
		}
		lifriend.setModel(new DataModel(Vfriend));
		limate.setModel(new DataModel(Vmate));
		lifamily.setModel(new DataModel(Vfamily));
		lihmd.setModel(new DataModel(Vhmd));
		lifriend.setCellRenderer(new MyHeadImg(Vfriend));
		limate.setCellRenderer(new MyHeadImg(Vmate));
		lifamily.setCellRenderer(new MyHeadImg(Vfamily));
		lihmd.setCellRenderer(new MyHeadImg(Vhmd));
		
	}
//	public static void main(String[] args) {
//		new MainQQ();
//	}
	public void actionPerformed(ActionEvent e) {
       if(e.getSource()==btnhuanfu){
    	   JFileChooser jfc = new JFileChooser();
    	   jfc.setDialogType(JFileChooser.OPEN_DIALOG);
    	   jfc.setFileSelectionMode(JFileChooser.FILES_ONLY);
    	   jfc.setDialogTitle("更换皮肤");
    	   if (jfc.showOpenDialog(this) == jfc.APPROVE_OPTION) {
           	File file = jfc.getSelectedFile();
           	String path = file.getPath();
           	imag.setIcon(new ImageIcon(path));
           }
       }else if(e.getSource()==milookinfo){
    	   //friendinfo=Vfriend.get(lifriend.getSelectedIndex());
		    new LookinfoUI(friendinfo);
       }else if(e.getSource()==mifrienf){
    	   BaseQQ.moveGroup(myInfo.getQqCode(), friendinfo.getQqCode(), Cmd.GROUPNAME[1]);
		   refresh();
       }else if(e.getSource()==mifamily){
    	   BaseQQ.moveGroup(myInfo.getQqCode(), friendinfo.getQqCode(), Cmd.GROUPNAME[2]);
    	   refresh();
       }else if(e.getSource()==mimate){
    	   BaseQQ.moveGroup(myInfo.getQqCode(), friendinfo.getQqCode(), Cmd.GROUPNAME[0]);
    	   refresh();
       }else if(e.getSource()==mihmd){
    	   BaseQQ.moveGroup(myInfo.getQqCode(), friendinfo.getQqCode(), Cmd.GROUPNAME[3]);
    	   refresh();
       }else if(e.getSource()==btnselect){
    	  new FindUI(myInfo);
    	 }else if(e.getSource()==close){
    		
    			base.changeStatus(myInfo.getQqCode(), Cmd.STATUS[1]);
    			myInfo.setOnlinestatus(Cmd.STATUS[1]);
    			Sendcmd.Sendall(Vmyinfo, myInfo, Cmd.CMD_OFFLINE);
    			System.exit(0);
    	 }else if(e.getSource()==midel){
    		 base.delFriend(myInfo.getQqCode(), friendinfo.getQqCode());
    		 refresh();
    		 SendMSG msg = new SendMSG();
    		 msg.cmd = Cmd.CMD_DELFRIEND;
    		 msg.myInfo=myInfo;
    		 msg.friendInfo=friendinfo;
    		 Sendcmd.Send(msg);
    	 }else if(e.getSource()==zuixiao){
                Text();
          }else if(e.getSource()==miOpen){
        	  MainQQ.this.setVisible(true);
          }else if(e.getSource()==miExit){
        	  System.exit(0);
          }			
	}
	class DataModel extends AbstractListModel {
		Vector<Account> data;
		public DataModel() {}
		public DataModel(Vector<Account> data) {
			this.data = data;
		}
	    //系统自动运行，下标从0开始计算
	    public Object getElementAt(int index) {
	    	Account info = data.get(index);
	    	return info.getNickName()+"("+info.getQqCode()+")【"+info.getRemark()+"]";
	    }

	    public int getSize() {
	        return data.size();
	    }
	    
	}
	// 获取好友头像
	class MyHeadImg extends DefaultListCellRenderer {
		Vector<Account> datas;
		public MyHeadImg(Vector<Account> datas) {
			this.datas = datas;
		}
		@Override
		public Component getListCellRendererComponent(JList list, Object value,
				int index, boolean isSelected, boolean cellHasFocus) {
			Component c = super.getListCellRendererComponent(list, value,
					index, isSelected, cellHasFocus);
			if (index >= 0 && index < datas.size()) {
				Account user =  datas.get(index);
				String status = user.getOnlinestatus();
				String headImg = user.getHeadimg();
//				STATUS={"在线","离线","忙碌","隐身"};
				String filename = "";
				if(status.equals(Cmd.STATUS[0])){
					filename = headImg;
				}else if(status.equals(Cmd.STATUS[1])){
					int pos = headImg.indexOf('.');
					String pre = headImg.substring(0,pos);
					String fix = headImg.substring(pos,headImg.length());
					filename = pre + "_h"+fix;
				}else if(status.equals(Cmd.STATUS[2])){
					int pos = headImg.indexOf('.');
					String pre = headImg.substring(0,pos);
					String fix = headImg.substring(pos,headImg.length());
					filename = pre + "_l"+fix;
				}else if(status.equals(Cmd.STATUS[3])){
					int pos = headImg.indexOf('.');
					String pre = headImg.substring(0,pos);
					String fix = headImg.substring(pos,headImg.length());
					filename = pre + "_w"+fix;
				}
				// 给列表中好友状态设置头像
				System.out.println(filename);
				setIcon(new ImageIcon(filename));
				//设置文本内容
				setText(user.getNickName()+"("+user.getQqCode()+")【"+user.getRemark()+"】");
				System.out.println(user.getHeadimg());
			}
			// 设置字体颜色
			if (isSelected) {
				setBackground(list.getSelectionBackground());
				setForeground(list.getSelectionForeground());
			} else {
				setBackground(list.getBackground());
				setForeground(list.getForeground());
			}
			//设置有效
			setEnabled(list.isEnabled());
			//设置默认字体
			setFont(list.getFont());
//			setFont(new Font("宋体",Font.BOLD,14));
			//设置透明背景
			setOpaque(false);
			return this;
		}
	}
	//打开聊天窗口
	public ChatUI openwinds(){
		//从Hashtable中获取根该朋友聊天的窗口信息
		ChatUI chat = chatWin.get(friendinfo.getQqCode());
		if(chat==null){
			chat = new ChatUI(myInfo,friendinfo);
			chatWin.put(friendinfo.getQqCode(), chat);
		}
		//显示
		chat.show();
		return chat;
	}
	public void mouseClicked(MouseEvent e) {
		if(e.getSource()==lblmyinfo){
			if(e.getClickCount()==2){
				new MYinfoRegUI(myInfo,this);
			}
		}else if(e.getSource()==lifriend){
			if(lifriend.getSelectedIndex()>=0){
				friendinfo = Vfriend.get(lifriend.getSelectedIndex());
			}
			//右键
			if(e.getButton()==3){
				if(lifriend.getSelectedIndex()>=0){
					popupmenu.show(lifriend, e.getX(), e.getY());
				}
			}else if(e.getClickCount()==2){//双击
				if(lifriend.getSelectedIndex()>=0){
					openwinds();
				}
			}
		}else if(e.getSource()==lifamily){
			if(lifamily.getSelectedIndex()>=0){
				friendinfo = Vfamily.get(lifamily.getSelectedIndex());
			}
			if(e.getButton()==3){
				if(lifamily.getSelectedIndex()>=0){
					popupmenu.show(lifamily, e.getX(), e.getY());
				}
			}else if(e.getClickCount()==2){//双击
				if(lifamily.getSelectedIndex()>=0){
					openwinds();
				}
			}
		}else if(e.getSource()==limate){
			if(limate.getSelectedIndex()>=0){
				friendinfo = Vmate.get(limate.getSelectedIndex());
			}
			if(e.getButton()==3){
				if(limate.getSelectedIndex()>=0){
					popupmenu.show(limate, e.getX(), e.getY());
				}
			}else if(e.getClickCount()==2){//双击
				if(limate.getSelectedIndex()>=0){
					friendinfo = Vmate.get(limate.getSelectedIndex());
					openwinds();
				}
			}
		}else if(e.getSource()==lihmd){
			if(e.getButton()==3){
				if(lihmd.getSelectedIndex()>=0){
					friendinfo = Vhmd.get(lihmd.getSelectedIndex());
					popupmenu.show(lihmd, e.getX(), e.getY());
				}
			}
		}else if(e.getSource()==kongjian){
			//进入空间
			String webSite = "http://user.qzone.qq.com/"; 
			webb(webSite);
		}else if(e.getSource()==tengxun){
			String webSite = "http://www.qq.com/";
			webb(webSite);
		}else if(e.getSource()==youxiang){
			String webSite = "https://mail.qq.com/cgi-bin/loginpage";
			webb(webSite);
		}else if(e.getSource()==app){
			String webSite = "http://123.sogou.com/qita/ruanjian.html";
			webb(webSite);
		}else if(e.getSource()==gouwu){
			String webSite = "https://www.taobao.com/";
			webb(webSite);
		}else if(e.getSource()==qianbao){
			String webSite = "https://www.baifubao.com/";
			webb(webSite);
		}else if(e.getSource()==huiyuan){
			String webSite = "http://vip.qq.com/";
			webb(webSite);
		}else if(e.getSource()==youxi){
			new WebApp("QQ游戏.lnk");
		}
		
	}
	public void mouseEntered(MouseEvent e) {
		// TODO Auto-generated method stub
		
	}
	public void mouseExited(MouseEvent e) {
		// TODO Auto-generated method stub
		
	}
	public void mousePressed(MouseEvent e) {
		x=e.getX();
		y=e.getY();
	}
	public void mouseReleased(MouseEvent e) {
		// TODO Auto-generated method stub
		
	}
	class ReceiveThreah extends Thread{
		public ReceiveThreah() {
		}
		@Override
		public void run() {
			try {
				DatagramSocket socket = new DatagramSocket(myInfo.getPort());
				while(true){
					byte b[] = new byte[1024*512];
				DatagramPacket packet = new DatagramPacket(b,0,b.length);
				socket.receive(packet);
				ByteArrayInputStream bis = new ByteArrayInputStream(packet.getData());
				ObjectInputStream ois = new ObjectInputStream(bis);
				SendMSG msg = (SendMSG)ois.readObject();
				myInfo=msg.friendInfo;
				friendinfo=msg.myInfo;
				switch (msg.cmd) {
				case Cmd.CMD_ONLINE:
					System.out.println("上线通知");
					refresh();
					new Sund(msg.cmd);
					new TipUI(friendinfo);
					break;
				case Cmd.CMD_LEVEL:
				case Cmd.CMD_BUYS:
					refresh();
					break;
				case Cmd.CMD_DELFRIEND:
					refresh();
					break;
				case Cmd.CMD_SEND:
					ChatUI chat=openwinds();
					
					try {
							chat.appenView(msg.myInfo.getNickName(), msg.doc);
						} catch (BadLocationException e) {
							// TODO Auto-generated catch block
							e.printStackTrace();
						}
					break;
					case Cmd.CMD_OFFLINE:
						refresh();
						new TipUI(friendinfo);
						break;
				case Cmd.CMD_CHANGESTATE:
						refresh();
						break;
				case Cmd.CMD_SHAKE:
				 chat = chatWin.get(friendinfo.getQqCode());
					if(chat==null){
						chat = new ChatUI(myInfo,friendinfo);
						chatWin.put(friendinfo.getQqCode(), chat);
					}
					//显示
					chat.show();
					chat.snake();
					break;
				case Cmd.CMD_ADDFRI:
					new Sund(msg.cmd);
					String str = "【"+friendinfo.getNickName()+"】请求添加你为好友，是否同意？";
					SendMSG msg2 = new SendMSG();
					if(JOptionPane.showConfirmDialog(null, str,"添加好友",JOptionPane.OK_CANCEL_OPTION)==JOptionPane.OK_OPTION){
                        					
						msg2.cmd=Cmd.CMD_ARGEE;
						base.addFriend(myInfo.getQqCode(), friendinfo.getQqCode());
						refresh();
					}else{
						msg2.cmd=Cmd.CMD_REFUSE;
					}
						msg2.myInfo=myInfo;
						msg2.friendInfo=friendinfo;
						Sendcmd.Send(msg2);
					    break;
				case Cmd.CMD_ARGEE:
						refresh();
					break;
				case Cmd.CMD_REFUSE:
						str = "【"+friendinfo.getNickName()+"】拒绝了你的好友请求。";
						JOptionPane.showMessageDialog(null, str);
					break;
				case Cmd.CMD_FILE:
					str = friendinfo.getNickName()+"发送了一个【"+msg.filename+"文件】，是否接收？";
					if(JOptionPane.showConfirmDialog(null, "是否接收文件","接收文件",JOptionPane.OK_CANCEL_OPTION)==JOptionPane.OK_OPTION){
						JFileChooser chooser = new JFileChooser(" ");
			            chooser.setDialogType(JFileChooser.SAVE_DIALOG);
			            chooser.setDialogTitle("保存文件");
			            if (chooser.showOpenDialog(null) == chooser.APPROVE_OPTION) {
			            	String ext = msg.filename.substring(msg.filename.indexOf('.'),msg.filename.length());
			            	String filename = chooser.getSelectedFile().getAbsolutePath()+ext;
			            	FileOutputStream fos = new FileOutputStream(filename);
			            	fos.write(msg.b);
			            	fos.flush();
			            	fos.close();
			            }
					}
				}
				
				}
			} catch (SocketException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (ClassNotFoundException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
	}
	public void mouseDragged(MouseEvent e) {
		int jiex = this.getLocation().x;
		int jiey = this .getLocation().y;
		this.setLocation(jiex+e.getX()-x, jiey+e.getY()-y);
		
	}
	public void mouseMoved(MouseEvent e) {
		// TODO Auto-generated method stub
		
	}
	public void windowActivated(WindowEvent e) {
		// TODO Auto-generated method stub
		
	}
	public void windowClosed(WindowEvent e) {
	
	}
	public void windowClosing(WindowEvent e) {
	
	}
	public void windowDeactivated(WindowEvent e) {
		// TODO Auto-generated method stub
		
	}
	public void windowDeiconified(WindowEvent e) {
		// TODO Auto-generated method stub
		
	}
	public void windowIconified(WindowEvent e) {
		// TODO Auto-generated method stub
		
	}
	public void windowOpened(WindowEvent e) {
		// TODO Auto-generated method stub
		
	}
	public void itemStateChanged(ItemEvent e) {
		if(e.getSource()==cbstatu){
			updatestatu();
			String statu = cbstatu.getSelectedItem().toString();
			base.changeStatus(myInfo.getQqCode(), statu);
			Sendcmd.Sendall(Vmyinfo, myInfo, Cmd.CMD_CHANGESTATE);
		}
		
	}
	public void updatestatu(){
		String statu = cbstatu.getSelectedItem().toString();
		String filename = myInfo.getHeadimg();
		String headimg = myInfo.getHeadimg();
		if(cbstatu.equals(Cmd.STATUS[0])){
			filename = headimg;
		}else if(cbstatu.equals(Cmd.STATUS[2])){
			int pow = headimg.indexOf('.');
			String fil = headimg.substring(0, pow);
			String fix = headimg.substring(pow,headimg.length());
			filename = fil + "_l"+fix;
		}else if(cbstatu.equals(Cmd.STATUS[3])){
			int pow = headimg.indexOf('.');
			String fil = headimg.substring(0,pow);
			String fix = headimg.substring(pow,headimg.length());
			filename = fil + "_w"+fix;
		}
		lblmyinfo.setIcon(new ImageIcon(filename));
		
	}
	//创建托盘菜单
	
	public void Text(){
		popTray = new PopupMenu();
		miOpen = new MenuItem("打开");
		miExit = new MenuItem("退出");
		miOnline = new MenuItem("在线");
		miLevel = new MenuItem("隐身");
		miBuys = new MenuItem("忙碌");
		miOpen.addActionListener(this);
		miExit.addActionListener(this);
		miOnline.addActionListener(this);
		miLevel.addActionListener(this);
		miBuys.addActionListener(this);
		
		popTray.add(miOpen);
		popTray.add(miExit);
		popTray.add(miOnline);
		popTray.add(miLevel);
		popTray.add(miBuys);
	
		//获取系统托盘
		SystemTray tray = SystemTray.getSystemTray();
		if(traycon!=null){
			tray.remove(traycon);
		}
		try {
			Image image = new ImageIcon("image/9.png").getImage();
			traycon = new TrayIcon(image,"QQ2016",popTray);
			//系统自动调整图标的大小
			traycon.setImageAutoSize(true);
			tray.add(traycon);
			//隐藏当前窗口
			this.dispose();
			traycon.addMouseListener(  
	                new MouseAdapter(){  
	                    public void mouseClicked(MouseEvent e){  
	                        if(e.getClickCount() == 2)//双击托盘窗口再现  
	                            setExtendedState(Frame.NORMAL);  
	                            setVisible(true);  
	                    }  
	                });          

		} catch (AWTException e1) {
			e1.printStackTrace();
		}
	}
	public void webb(String webSite){
		try {
			// 定义网址为webSite的内容
			uri = new URI(webSite);
			desktop.browse(uri);
			} catch (URISyntaxException e1) {
			e1.printStackTrace();
			}catch (IOException e2) {
				e2.printStackTrace();
			}
}
	
}


