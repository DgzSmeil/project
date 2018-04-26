package MyQQ;

import java.awt.BorderLayout;
import java.awt.Color;
import java.awt.Component;
import java.awt.Font;
import java.awt.Image;
import java.awt.Toolkit;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.awt.event.MouseEvent;
import java.awt.event.MouseListener;
import java.awt.event.MouseMotionListener;
import java.io.File;
import java.net.InetAddress;
import java.net.UnknownHostException;

import javax.sound.midi.MidiSystem;
import javax.sound.midi.Sequence;
import javax.sound.midi.Sequencer;
import javax.swing.ButtonGroup;
import javax.swing.Icon;
import javax.swing.ImageIcon;
import javax.swing.JButton;
import javax.swing.JCheckBox;
import javax.swing.JComboBox;
import javax.swing.JFrame;
import javax.swing.JLabel;
import javax.swing.JOptionPane;
import javax.swing.JPanel;
import javax.swing.JPasswordField;
import javax.swing.JRadioButton;
import javax.swing.JScrollPane;
import javax.swing.JTextArea;
import javax.swing.JTextField;

public class RegUI extends JFrame implements ActionListener,MouseMotionListener,MouseListener{

	private JLabel lblQQcode,lblPassword,lblnickName,lblcfgpwd,lblAge,lblSex;
	private JLabel lblNation,lblStar,lblBlood,lblIpAddr,lblport,lblHobit,lblRemark;
	private JLabel lblHeadimg;
	private JTextField txtQQcode,txtnickName,txtAge,txtIpAddr,txtport,txtHobit;
	private JPasswordField txtPassword,txtcfgpwd;
	private JComboBox txtNation,txtStar,txtBlood,txtHeadimg;
	private JRadioButton rbMale,rbRemale;
	private ButtonGroup bg;
	private JTextArea txtRemark;
	private JButton btnSave;
	private JCheckBox deal;
	int x;
	int y;
 
	private String sNation[]={"汉族","苗族","壮族","高山族","回族","侗族",
			                 "傣族","藏族","朝鲜族","其他"};
	private String sStar[]={"双鱼座","金牛座","摩羯座","天蝎座","处女座","狮子座","白羊座",
			"水瓶座","射手座","天秤座","巨蟹座","双子座",};
	private String sBlood[]={"A","B","O","AB"};
	private String sHeadimg[]={"image/0.png","image/1.png","image/2.png",
			"image/3.png","image/4.png","image/5.png",
			"image/6.png","image/7.png","image/8.png",
			"image/9.png","image/10.png"}; 
	private ImageIcon[]sheadimg={
			new ImageIcon(sHeadimg[0]),
			new ImageIcon(sHeadimg[1]),
			new ImageIcon(sHeadimg[2]),
			new ImageIcon(sHeadimg[3]),
			new ImageIcon(sHeadimg[4]),
			new ImageIcon(sHeadimg[5]),
			new ImageIcon(sHeadimg[6]),
			new ImageIcon(sHeadimg[7]),
			new ImageIcon(sHeadimg[8]),
			new ImageIcon(sHeadimg[9]),
			};
	public RegUI() {
		super("QQ注册界面");
		Toolkit tool =Toolkit.getDefaultToolkit();
		Image icon = tool.getImage("image/QQ.png");
		setIconImage(icon);
		JLabel lblBg = new JLabel(new ImageIcon("image/nvzi.jpg"));
		add(lblBg);
	    lblBg.setLayout(null);
	    
	    btnSave = new JButton(new ImageIcon("image/q2.png"));
		btnSave.setBounds(150, 540, 200,40);
		lblBg.add(btnSave);
	    
		
		JLabel lbltitle = new JLabel("用户注册",JLabel.CENTER);
		lbltitle.setFont(new Font("楷体",Font.BOLD,36));
		lbltitle.setForeground(Color.RED);
		lbltitle.setBounds(150, 40, 200, 40);
		lblBg.add(lbltitle);
		lblQQcode = new JLabel("QQ号码:",JLabel.RIGHT);
		lblQQcode.setFont(new Font("楷体",Font.BOLD,18));
		lblQQcode.setForeground(Color.RED);
		txtQQcode = new JTextField(10);
		txtQQcode.setEditable(false);
		lblQQcode.setBounds(100, 100, 100, 25);
		txtQQcode.setBounds(200, 100, 150, 25);
		lblBg.add(lblQQcode);
		lblBg.add(txtQQcode);
		
		lblPassword = new JLabel("QQ密码:",JLabel.RIGHT);
		lblPassword.setFont(new Font("楷体",Font.BOLD,18));
		lblPassword.setForeground(Color.RED);
		txtPassword = new JPasswordField(10);
		txtPassword.setEchoChar('@');
		lblPassword.setBounds(100, 135, 100, 25);
		txtPassword.setBounds(200, 135, 150,25);
		lblBg.add(lblPassword);
		lblBg.add(txtPassword);
		
		lblnickName = new JLabel("QQ昵称:",JLabel.RIGHT);
		lblnickName.setFont(new Font("楷体",Font.BOLD,18));
		lblnickName.setForeground(Color.RED);
		txtnickName = new JTextField(10);
		lblnickName.setBounds(100, 205, 100, 25);
		txtnickName.setBounds(200, 205, 150,25);
		lblBg.add(lblnickName);
		lblBg.add(txtnickName);
		
		lblHeadimg = new JLabel("头像:",JLabel.RIGHT);
		txtHeadimg = new JComboBox(sheadimg);
		lblHeadimg.setFont(new Font("楷体",Font.BOLD,18));
		lblHeadimg.setForeground(Color.RED);
		lblHeadimg.setBounds(320, 100, 80, 60);
		txtHeadimg.setBounds(400, 100, 80, 60);
		lblBg.add(lblHeadimg);
		lblBg.add(txtHeadimg);
		lblcfgpwd = new JLabel("确认密码:",JLabel.RIGHT);
		lblcfgpwd.setFont(new Font("楷体",Font.BOLD,18));
		lblcfgpwd.setForeground(Color.RED);
		txtcfgpwd = new JPasswordField(10);
		txtcfgpwd.setEchoChar('@');
		lblcfgpwd.setBounds(100, 170, 100, 25);
		txtcfgpwd.setBounds(200, 170, 150,25);
		lblBg.add(lblcfgpwd);
		lblBg.add(txtcfgpwd);
		
		lblAge = new JLabel("年龄:",JLabel.RIGHT);
		lblAge.setFont(new Font("楷体",Font.BOLD,18));
		lblAge.setForeground(Color.RED);
		txtAge = new JTextField(5);
		lblAge.setBounds(5, 280, 100, 25);
		txtAge.setBounds(105, 280, 130,25);
		lblBg.add(lblAge);
		lblBg.add(txtAge);
		
		lblSex = new JLabel("性别:",JLabel.RIGHT);
		lblSex.setFont(new Font("楷体",Font.BOLD,18));
		lblSex.setForeground(Color.RED);
		rbMale = new JRadioButton("男",true);
		rbRemale = new JRadioButton("女"); 
		bg = new ButtonGroup();
		bg.add(rbMale);
		bg.add(rbRemale);
		lblSex.setBounds(240, 280, 80, 25);
		rbMale.setBounds(320, 280, 40,25);
		rbRemale.setBounds(380, 280, 40,25);
		rbMale.setOpaque(false);
		rbRemale.setOpaque(false);
        lblBg.add(lblSex);
		lblBg.add(rbMale);
		lblBg.add(rbRemale);
		
		
        lblNation = new JLabel("民族:",JLabel.RIGHT);
        lblNation.setFont(new Font("楷体",Font.BOLD,18));
        lblNation.setForeground(Color.RED);
        txtNation = new JComboBox(sNation); 
        lblNation.setBounds(5, 315, 100, 25);
        txtNation.setBounds(105, 315, 130,25);
		lblBg.add(lblNation);
		lblBg.add(txtNation);
        
        lblStar = new JLabel("星座:",JLabel.RIGHT);
        lblStar.setFont(new Font("楷体",Font.BOLD,18));
        lblStar.setForeground(Color.RED);
        txtStar = new JComboBox(sStar);
        lblStar.setBounds(220, 315, 100, 25);
        txtStar.setBounds(320, 315, 100,25);
		lblBg.add(lblStar);
		lblBg.add(txtStar);
        
        lblBlood = new JLabel("血型:",JLabel.RIGHT);
        lblBlood.setFont(new Font("楷体",Font.BOLD,18));
        lblBlood.setForeground(Color.RED);
        txtBlood = new JComboBox(sBlood);
        lblBlood.setBounds(5, 350, 100, 25);
        txtBlood.setBounds(105, 350, 130,25);
		lblBg.add(lblBlood);
		lblBg.add(txtBlood);
		
		InetAddress addr = null;
		try {
			addr=InetAddress.getLocalHost();
		} catch (UnknownHostException e) {
			e.printStackTrace();
		}
        lblIpAddr = new JLabel("本机地址:",JLabel.RIGHT);
        lblIpAddr.setFont(new Font("楷体",Font.BOLD,18));
        lblIpAddr.setForeground(Color.RED);
        txtIpAddr = new JTextField(addr.getHostAddress());
        lblIpAddr.setBounds(5, 385, 100, 25);
        txtIpAddr.setBounds(105, 385, 130,25);
		lblBg.add(lblIpAddr);
		lblBg.add(txtIpAddr);
        
        lblport = new JLabel("端口:",JLabel.RIGHT);
        lblport.setFont(new Font("楷体",Font.BOLD,18));
        lblport.setForeground(Color.RED);
        txtport = new JTextField(10);
        lblport.setBounds(220, 385, 100, 25);
        txtport.setBounds(320, 385, 100,25);
		lblBg.add(lblport);
		lblBg.add(txtport);
        
        lblHobit = new JLabel("爱好:",JLabel.RIGHT);
        lblHobit.setFont(new Font("楷体",Font.BOLD,18));
        lblHobit.setForeground(Color.RED);
        txtHobit = new JTextField(20);
        lblHobit.setBounds(220, 350, 100, 25);
        txtHobit.setBounds(320, 350, 100,25);
		lblBg.add(lblHobit);
		lblBg.add(txtHobit);
        
        lblRemark = new JLabel("心情:",JLabel.RIGHT);
        lblRemark.setFont(new Font("楷体",Font.BOLD,18));
        lblRemark.setForeground(Color.RED);
        txtRemark = new JTextArea(3,80);
        lblRemark.setBounds(5, 420, 100, 25);
        JScrollPane jsp = new JScrollPane(txtRemark);
        jsp.setBounds(105, 420, 350,70);
		lblBg.add(lblRemark);
		lblBg.add(jsp);
		deal = new JCheckBox("我同意本协议。");
		deal.setFont(new Font("楷体",Font.BOLD,18));
		deal.setForeground(Color.RED);
		deal.setBounds(105, 500, 200,30);
		deal.setOpaque(false);
		lblBg.add(deal);
        btnSave.addActionListener(this);
        this.addMouseMotionListener(this);
        
        setResizable(false);
        setSize(520,650);
        setVisible(true);
        setLocationRelativeTo(null);
        setDefaultCloseOperation(JFrame.DISPOSE_ON_CLOSE);
		
	}
	public static void main(String[] args) {
		new RegUI();
	}
	public void actionPerformed(ActionEvent e) {
		if(e.getSource()==btnSave){
			String nickName = txtnickName.getText().trim();
			if(nickName.equals("")){
				JOptionPane.showMessageDialog(this, "请输入昵称!");
				return;
			}
			String Pass = txtPassword.getText().trim();
			String cfgpwd = txtcfgpwd.getText().trim();
			if(Pass.equals("")){
				JOptionPane.showMessageDialog(this, "请输入密码!");
				return;
			}
			if(!Pass.equals(cfgpwd)){
				JOptionPane.showMessageDialog(this, "密码不一致");
				return;
			}
			
			int age=0;
			String str = txtAge.getText().trim();
			if(txtAge.equals("")){
				JOptionPane.showMessageDialog(this, "请输入年龄！");
				txtAge.setText("0");
				return;
			}
			try {
				age=Integer.parseInt(str);
			} catch (Exception e1) {
			JOptionPane.showMessageDialog(this, "请输入1~150之间的数！");
			return;
			}
			if(age<0||age>150){
				JOptionPane.showMessageDialog(this, "请输入1~150之间的数！");
				return;
             }
		     
			
			Account account = new Account();
			account.setNickName(nickName);
			account.setHeadimg(sHeadimg[txtHeadimg.getSelectedIndex()]);
			account.setBlood(sBlood[txtBlood.getSelectedIndex()]);
		    account.setHobit(txtHobit.getText().trim());
		    account.setQqPassword(Pass);
			account.setAge(age);
			if(rbMale.isSelected()){
				account.setSex("男");
			}else{
				account.setSex("女");
			}
			account.setIpAddr(txtIpAddr.getText().trim());
			account.setNation(sNation[txtNation.getSelectedIndex()]);
			account.setStar(sStar[txtStar.getSelectedIndex()]);
			account.setRemark(txtRemark.getText().trim());
			BaseQQ baseQQ = new BaseQQ();
			//保存信息到数据库中的account表
			account=baseQQ.saveAccount(account);
			//给txtQQcode文本框赋值
			txtQQcode.setText(account.getQqCode() +"");
			txtport.setText("0");
			JOptionPane.showMessageDialog(this, "恭喜你注册成功，您的QQ号码是："+account.getQqCode());
		}
		
	}
	public void mouseDragged(MouseEvent e) {
			int jiex = this.getLocation().x;
			int jiey = this.getLocation().y;
			this.setLocation(jiex+e.getX()-x,jiey+e.getY()-y);
	}
	public void mouseMoved(MouseEvent e) {
		// TODO Auto-generated method stub
		
	}
	public void mouseClicked(MouseEvent e) {
		// TODO Auto-generated method stub
		
	}
	public void mouseEntered(MouseEvent e) {
		// TODO Auto-generated method stub
		
	}
	public void mouseExited(MouseEvent e) {
		// TODO Auto-generated method stub
		
	}
	public void mousePressed(MouseEvent e) {
			x = this.getX();
			y = this.getY();
	}
	public void mouseReleased(MouseEvent e) {
		// TODO Auto-generated method stub
		
	}
}


