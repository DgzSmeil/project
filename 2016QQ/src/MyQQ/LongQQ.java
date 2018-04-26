package MyQQ;
import java.awt.Color;
import java.awt.Font;
import java.awt.Image;
import java.awt.Toolkit;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.awt.event.ItemEvent;
import java.awt.event.ItemListener;
import java.awt.event.MouseEvent;
import java.awt.event.MouseListener;
import java.awt.event.MouseMotionListener;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.ObjectInputStream;
import java.io.ObjectOutputStream;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Set;

import javax.swing.ImageIcon;
import javax.swing.JButton;
import javax.swing.JCheckBox;
import javax.swing.JComboBox;
import javax.swing.JFrame;
import javax.swing.JLabel;
import javax.swing.JOptionPane;
import javax.swing.JPasswordField;
public class LongQQ extends JFrame implements MouseListener,ItemListener,ActionListener,MouseMotionListener{

	
	JLabel lblpwd,lblreg,lblmin,lblclose,lblHamig;
	JButton btnlogin;
	JPasswordField txtpassword;
	JComboBox txtQQcode;
	JCheckBox cbjzpass,cbzdlongin;
	HashMap<Integer, Account> user =null;
	
	int x;
	int y;
	public LongQQ() {
		
		setUndecorated(true);
		Toolkit tool =Toolkit.getDefaultToolkit();
		Image icon = tool.getImage("image/QQ3.png");
		setIconImage(icon);
		
		JLabel bg = new JLabel(new ImageIcon("image/login.jpg"));
		bg.setLayout(null);
		add(bg);
		lblmin = new JLabel(new ImageIcon("image/min2.png"));
		lblmin.setForeground(Color.WHITE);
		lblmin.setFont(new Font("黑体",Font.BOLD,20));
		lblmin.setBounds(380, 0, 20, 20);
		lblclose = new JLabel(new ImageIcon("image/close.png"));
		lblclose.setForeground(Color.WHITE);
		lblclose.setFont(new Font("黑体",Font.BOLD,18));
		lblclose.setBounds(405, 0, 20, 20);
		bg.add(lblmin);
		bg.add(lblclose);
		lblmin.addMouseListener(this);
		lblclose.addMouseListener(this);
		txtQQcode = new JComboBox();
		txtQQcode.setEditable(true);
		txtQQcode.setBounds(130, 185, 194, 30);
		txtQQcode.setToolTipText("QQ账号");
		txtQQcode.addItemListener(this);
		bg.add(txtQQcode);
		txtpassword = new JPasswordField();
		txtpassword.setBounds(130, 215, 195, 30);
		txtpassword.setToolTipText("QQ密码");
        bg.add(txtpassword); 
		cbjzpass = new JCheckBox("记住密码");
		cbjzpass.setBounds(127, 244, 80, 30);
		bg.add(cbjzpass);
		cbzdlongin = new JCheckBox("自动登入");
		cbzdlongin.setBounds(254, 244, 80, 30);
		bg.add(cbzdlongin);
		lblpwd = new JLabel("      ");
		lblpwd.setBounds(335, 215, 80, 30);
		bg.add(lblpwd);
		lblreg = new JLabel("      ");
		lblreg.setBounds(335, 185, 80, 30);
		bg.add(lblreg);
		
		lblpwd.addMouseListener(this);
		lblreg.addMouseListener(this);
		cbjzpass.addActionListener(this);
		cbzdlongin.addActionListener(this);
		btnlogin = new JButton(new ImageIcon("image/qqlogin.png"));
		btnlogin.setBounds(130, 278, 195, 30);
		bg.add(btnlogin);
	
		JLabel lblicon2 = new JLabel(new ImageIcon("image/qqma (1).png"));
		lblicon2.setBounds(355, 284, 100, 30);
		bg.add(lblicon2);
		
		JLabel lblicon3 = new JLabel(new ImageIcon("image/qqname.gif"));
		lblicon3.setBounds(0, 0, 430, 175);
		bg.add(lblicon3); 
		
		lblHamig = new JLabel(new ImageIcon("image/tubiao.png"));
		lblHamig.setBounds(70, 185, 60, 60);
		bg.add(lblHamig);
		btnlogin.addActionListener(this);
		readFile();
		//this.setExtendedState(JFrame.MAXIMIZED_BOTH);最大化
		this.addMouseMotionListener(this);
		this.addMouseListener(this);
		
		setSize(427,321);
		setVisible(true);
		setLocationRelativeTo(null);
		setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
	}
	public static void main(String[] args) {
		new LongQQ();
	}
	public void mouseClicked(MouseEvent e) {
		if(e.getSource()==lblmin){
			this.setState(JFrame.HIDE_ON_CLOSE);
			//this.setExtendedState(this.ICONIFIED);最小化
		}else if(e.getSource()==lblclose){
			System.exit(0);
		}else if(e.getSource()==lblreg){
			new RegUI();
		}else if(e.getSource()==lblpwd){
			JOptionPane.showMessageDialog(this, "验证密保问题！");
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
	}
	public void actionPerformed(ActionEvent e) {
		if(e.getSource()==btnlogin){
			String qqcode="";
			String pwd = txtpassword.getText().trim();
			if(txtQQcode.getSelectedItem()==null || txtQQcode.getSelectedItem().toString().equals("") ){
				JOptionPane.showMessageDialog(this,"请输入QQ号码！");
				return;
			}
			if(pwd.equals(" ")){
				JOptionPane.showMessageDialog(this, "请输入QQ密码！");
				return;
			}
			qqcode=txtQQcode.getSelectedItem().toString();
			Account account = new Account();
	        account.setQqCode(Integer.parseInt(qqcode));
			account.setQqPassword(pwd);
			account = new BaseQQ().lonin(account); 
			if(account==null){
				JOptionPane.showMessageDialog(this, "登入失败，账号或者是密码错误！");
				return;
			}else{
				
				Save(account);
				dispose();
				
			  new MainQQ(account);
					
			}
		}else if(e.getSource()==cbjzpass){
			JOptionPane.showMessageDialog(this,"记住密码");
		}
	}
	private void Save(Account account) {
           HashMap<Integer, Account>user = null;
		   File file = new File("account.dat");
		   try {
			   if(!file.exists()){
			file.createNewFile();
			user = new HashMap<Integer, Account>();
			   }else{
				   ObjectInputStream ois = new ObjectInputStream(new FileInputStream(file));
				   user = (HashMap<Integer, Account>)ois.readObject();
				   ois.close();
			   }
			   user.put(account.getQqCode(), account);
			   ObjectOutputStream oos = new ObjectOutputStream(new FileOutputStream(file));
			   oos.writeObject(user);
			   oos.flush();
			   oos.close();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	public void readFile(){
		File file = new File("account.dat");
		if(!file.exists()){
			return;
		}
		try {
			ObjectInputStream ois = new ObjectInputStream(new FileInputStream(file));
			user = (HashMap<Integer, Account>)ois.readObject();
			Set<Integer>set = user.keySet();
			Iterator<Integer>it =set.iterator();
			while(it.hasNext()){
				txtQQcode.addItem(it.next());
			}
		} catch (FileNotFoundException e) {
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
	public void itemStateChanged(ItemEvent e) {
	if(e.getSource()==txtQQcode){
		if(!txtQQcode.getSelectedItem().toString().equals("") && user!=null){
			int qqcode = Integer.parseInt(txtQQcode.getSelectedItem().toString());
			Account account = user.get(qqcode);
			if(account!=null){
		    txtpassword.setText(account.getQqPassword());
			lblHamig.setIcon(new ImageIcon(account.getHeadimg()));
			}
		}
	}
	}
	public void mouseDragged(MouseEvent e) {
		int jiex = this.getLocation().x;
		int jiey = this.getLocation().y;
		this.setLocation(jiex+e.getX()-x, jiey+e.getY()-y);
	}
	public void mouseMoved(MouseEvent e) {
  }
	
	}
	
	

