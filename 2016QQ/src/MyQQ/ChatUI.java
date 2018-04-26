package MyQQ;
import java.awt.Color;
import java.awt.FileDialog;
import java.awt.Font;
import java.awt.Insets;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.awt.event.ItemEvent;
import java.awt.event.ItemListener;
import java.awt.event.MouseEvent;
import java.awt.event.MouseListener;
import java.awt.event.MouseMotionListener;
import java.io.FileInputStream;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.swing.ImageIcon;
import javax.swing.JButton;
import javax.swing.JColorChooser;
import javax.swing.JComboBox;
import javax.swing.JFrame;
import javax.swing.JLabel;
import javax.swing.JOptionPane;
import javax.swing.JTextPane;
import javax.swing.text.BadLocationException;
import javax.swing.text.Element;
import javax.swing.text.SimpleAttributeSet;
import javax.swing.text.StyleConstants;
import javax.swing.text.StyledDocument;
public class ChatUI extends JFrame implements ActionListener,ItemListener,MouseListener,MouseMotionListener{

	JLabel title;
	JTextPane txtsend,txtReceive;
	JButton btnclose,btnsend;
	JButton btnface,btncolor,btnshske,btnfile,jieping;
	JComboBox cbfont,cbsize;
	Account myInfo,friendinfo;
	Font font;
	int x,y;
	JLabel close2,mosth;
	BaseQQ basee = new BaseQQ();
	JLabel yuyin,shipin,yuancheng,wenjian,yying;
	JButton yiyue;
	String sFont[] = {"宋体","黑体","楷体","隶书"};
	String sSize[]={"8","10","12","14","16","18","24","28","32","36","72"};
	public ChatUI(Account myInfo,Account friendinfo) {
		
		setUndecorated(true);
		JLabel mainimage = new JLabel(new ImageIcon("tubiao/liaotian.png"));
		add(mainimage);
		mainimage.setLayout(null);
		String str = myInfo.getNickName()+"("+myInfo.getQqCode()+")和";
		       str += friendinfo.getNickName()+"("+friendinfo.getQqCode()+")聊天中";
	    setTitle(str);
	    this.myInfo=myInfo;  
	    this.friendinfo=friendinfo;
	    setIconImage(new ImageIcon(friendinfo.getHeadimg()).getImage());
	    title = new JLabel(str,new ImageIcon(friendinfo.getHeadimg()),JLabel.LEFT);
	    title.setBounds(2, 2, 400, 55);
	    mainimage.add(title);
	    
	    close2 = new JLabel(new ImageIcon("tubiao/close2.png"));
	    close2.setBounds(600, 0, 20, 22);
	    mainimage.add(close2);
	    close2.addMouseListener(this);
	    mosth = new JLabel(new ImageIcon("tubiao/qqmin.png"));
	    mosth.setBounds(575, 0, 20, 22);
	    mainimage.add(mosth);
	    
	    yuyin = new JLabel(new ImageIcon("tubiao/yuyin.png"));
	    yuyin.setBounds(1, 60, 40, 30);
	    mainimage.add(yuyin);
	    
	    shipin = new JLabel(new ImageIcon("tubiao/shiping2.png"));
	    shipin.setBounds(46, 60, 40, 30);
	    mainimage.add(shipin);
	    shipin.addMouseListener(this);
	    
	    yuancheng = new JLabel(new ImageIcon("tubiao/yuancheng.png"));
	    yuancheng.setBounds(96, 60, 40, 30);
	    mainimage.add(yuancheng);
	    
	    btnfile = new JButton(new ImageIcon("tubiao/chuanshu.png"));
	    btnfile.setBounds(148, 60, 40, 30);
	    mainimage.add(btnfile);
        
	    yying = new JLabel(new ImageIcon("tubiao/yying.png"));
	    yying.setBounds(195, 60, 130, 30);
	    mainimage.add(yying);
       
	    txtReceive = new JTextPane();
	    txtReceive.setBounds(0, 92, 450, 250);
	    txtReceive.setEditable(false);
	    txtReceive.setOpaque(false);
	    mainimage.add(txtReceive);
	    
	    
	    
	    cbfont = new JComboBox(sFont);
	    cbfont.setOpaque(false);
	    cbfont.setBounds(1, 344, 55, 22);
	    mainimage.add(cbfont);
	    
	   
	    cbsize = new JComboBox(sSize);
	    cbsize.setOpaque(false);
	    cbsize.setBounds(57, 344, 55, 22);
	    mainimage.add(cbsize);
	    
	    btnface = new JButton(new ImageIcon("tubiao/fase.png"));
	    btnface.setMargin(new Insets(0,0,0,0));
	    btnface.setBounds(114, 344, 22, 22);
	    mainimage.add(btnface);
	    
	    btncolor = new JButton(new ImageIcon("tubiao/mofa.png"));
	    btncolor.setBounds(138, 344, 22, 22);
	    mainimage.add(btncolor);
	    
	    btnshske = new JButton(new ImageIcon("tubiao/doudong.png"));
	    btnshske.setMargin(new Insets(0,0,0,0));
	    btnshske.setBounds(162, 344, 22, 22);
	    mainimage.add(btnshske);
	    
	    JButton tuyu = new JButton(new ImageIcon("tubiao/tuyu.png"));
	    tuyu.setBounds(186, 344, 100, 22);
	    mainimage.add(tuyu);
	    
	    yiyue = new JButton(new ImageIcon("tubiao/yiyue.png"));
	    yiyue.setMargin(new Insets(0,0,0,0));
	    yiyue.setBounds(288, 344, 22, 22);
	    mainimage.add(yiyue);
	    yiyue.addActionListener(this);
	    
	    
	   jieping = new JButton(new ImageIcon("tubiao/jieping.png"));
	   jieping.setMargin(new Insets(0,0,0,0));
	   jieping.setBounds(312, 344, 30, 22);
	    mainimage.add(jieping);
	    jieping.addActionListener(this);
	    
	    
	    txtsend = new JTextPane();
	    txtsend.setOpaque(false);
	    txtsend.setBounds(0, 366, 450, 90);
	    mainimage.add(txtsend);
	    
	    btnclose = new JButton("关闭(X)"); 
	    btnclose.setMnemonic('X');
	    btnclose.setBackground(new Color(0,0,0,0));
	    btnclose.setOpaque(false);
	    btnclose.setBounds(292, 460, 80, 20);
	    mainimage.add(btnclose);
	    btnsend = new JButton("发送(S)"); 
        btnsend.setMnemonic('S');
	    btnsend.setBackground(new Color(0,0,0,0));
	    btnsend.setOpaque(false);
	    btnsend.setBounds(372, 460, 80, 20);
	    mainimage.add(btnsend);
	    
        
        btnclose.addActionListener(this);
        btnsend.addActionListener(this);
    	btnface.addActionListener(this);
    	btncolor.addActionListener(this);
    	btnshske.addActionListener(this);
    	btnfile.addActionListener(this);
    	
    	 cbfont.addItemListener(this);
    	cbsize.addItemListener(this);
    	addMouseListener(this);
    	addMouseMotionListener(this);
        
        setSize(620,510);
        setVisible(true);
        setLocationRelativeTo(null);
        setDefaultCloseOperation(JFrame.DISPOSE_ON_CLOSE);
	}
	public void appenView(String name,StyledDocument xx)throws BadLocationException{
		StyledDocument vdoc = txtReceive.getStyledDocument();
		Date date = new Date();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
		String time = sdf.format(date);
		SimpleAttributeSet as=new SimpleAttributeSet();
		String s =name + "    " + time + "\n";
		vdoc.insertString(vdoc.getLength(), s, as);
		int end = 0;
		while(end<xx.getLength()){
			Element e0 = xx.getCharacterElement(end);
			SimpleAttributeSet sab = new SimpleAttributeSet();
			StyleConstants.setForeground(sab, StyleConstants.getForeground(e0.getAttributes()));
			StyleConstants.setFontSize(sab, StyleConstants.getFontSize(e0.getAttributes()));
			StyleConstants.setFontFamily(sab,StyleConstants.getFontFamily(e0.getAttributes()));
			s=e0.getDocument().getText(end, e0.getEndOffset()-end);
			if("icon".equals(e0.getName())){
				vdoc.insertString(vdoc.getLength(), s, e0.getAttributes());
			}else{
				vdoc.insertString(vdoc.getLength(), s, sab);
			}
			end=e0.getEndOffset();
		}
		vdoc.insertString(vdoc.getLength(),"\n", as);
		txtReceive.setCaretPosition(vdoc.getLength());
	}
	public static void main(String[] args) {
		new ChatUI(null,null);
	}
    // 设置字体
	public void setFont (){
    	String sf = sFont[cbfont.getSelectedIndex()];
    	String size = sSize[cbsize.getSelectedIndex()];
    	font = new Font(sf,Font.PLAIN,Integer.parseInt(size));
    	txtsend.setFont(font);
    }
    // 改变字体大小
	public void itemStateChanged(ItemEvent e) {
        if(e.getSource()==cbfont){
        	setFont();
        }else if(e.getSource()==cbsize){
        	setFont();
        }
		
	}
	// 发送窗口抖动
	public void snake(){
		int x = this.getLocation().x;
		int y = this.getLocation().y;
		for(int i=0;i<=20;i++){
			if(i%2==0){
				this.setLocation(x+2,y+2);
			}else{
				this.setLocation(x-2, y-2);
			}
			try {
				Thread.sleep(50);
			} catch (InterruptedException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
	}
	// 事件监听
	public void actionPerformed(ActionEvent e) {
		if(e.getSource()==btnshske){
			SendMSG msg = new SendMSG();
			msg.cmd = Cmd.CMD_SHAKE;
			msg.myInfo = myInfo;
			msg.friendInfo = friendinfo;
			Sendcmd.Send(msg);
			snake();
		}else if(e.getSource()==btncolor){
			JColorChooser chooser = new JColorChooser();
			Color color = chooser.showDialog(this,"请选择字体颜色",Color.WHITE );
			txtsend.setForeground(color);
		}else if(e.getSource()==btnface){
			int x = this.getLocation().x+70;
			int y = this.getLocation().y;
			new BQUI(this,x,y);
			
		}else if(e.getSource()==btnsend){
			if(txtsend.getText().equals(" ")){
				JOptionPane.showMessageDialog(this, "请输入发送内容！");
				return;
			}
			try {
				appenView(myInfo.getNickName(),txtsend.getStyledDocument());
				friendinfo=basee.Onefriend(friendinfo.getQqCode());
				if(friendinfo.getOnlinestatus().equals(Cmd.STATUS[1])){
					String ffige=txtsend.getText();
					basee.StatuFriend(myInfo.getQqCode(), friendinfo.getQqCode(),Cmd.CMD_SEND,ffige);
					System.out.println("离线消息");
					txtsend.setText("");
					return;
				}else{
				SendMSG msg= new SendMSG();
				msg.cmd = Cmd.CMD_SEND;
				msg.myInfo = myInfo;
				msg.friendInfo = friendinfo;
				msg.doc = txtsend.getStyledDocument();
				Sendcmd.Send(msg);
				txtsend.setText(" ");
			}
			} catch (BadLocationException e1) {
				// TODO Auto-generated catch block
				e1.printStackTrace();
			}
		}else if(e.getSource()==btnclose){
			dispose();
		}else if(e.getSource()==btnfile){
			FileDialog fileDialog = new FileDialog(this,"选择文件（64K以下）",FileDialog.LOAD);
			fileDialog.show();
			String filename = fileDialog.getDirectory()+fileDialog.getFile();
			try {
				FileInputStream fis = new FileInputStream(filename);
				int size = fis.available();
				byte b[] = new byte[size];
				
				fis.read(b);
				SendMSG msg = new SendMSG();
				msg.cmd = Cmd.CMD_FILE;
				msg.myInfo=myInfo;
				msg.friendInfo = friendinfo;
				msg.b = b;
				msg.filename = fileDialog.getFile();
				Sendcmd.Send(msg);
				
			} catch (Exception e1) {
				e1.printStackTrace();
			}
		}else if(e.getSource()==yiyue){
			new WebApp("QQ音乐.lnk");
		}else if(e.getSource()==jieping){
			new CaptureScreen();
		}
		
	}
	public void mouseClicked(MouseEvent e) {
		if(e.getSource()==close2){
			dispose();
		}
		
	}
	public void mouseEntered(MouseEvent e) {
		// TODO Auto-generated method stub
		
	}
	public void mouseExited(MouseEvent e) {
		// TODO Auto-generated method stub
		
	}
	public void mousePressed(MouseEvent e) {
		x = e.getX();
		y = e.getY();
		
	}
	public void mouseReleased(MouseEvent e) {
		// TODO Auto-generated method stub
		
	}
	public void mouseDragged(MouseEvent e) {
		int jiex = this.getLocation().x;
		int jiey = this.getLocation().y;
		this.setLocation(jiex+e.getX()-x, jiey+e.getY()-y);
		
	}
	public void mouseMoved(MouseEvent e) {
		// TODO Auto-generated method stub
		
	}
}
