package MyQQ;

import java.awt.Color;
import java.awt.Font;
import java.awt.Image;
import java.awt.Toolkit;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.net.InetAddress;
import java.net.UnknownHostException;

import javax.swing.ButtonGroup;
import javax.swing.ImageIcon;
import javax.swing.JButton;
import javax.swing.JComboBox;
import javax.swing.JFrame;
import javax.swing.JLabel;
import javax.swing.JOptionPane;
import javax.swing.JRadioButton;
import javax.swing.JScrollPane;
import javax.swing.JTextArea;
import javax.swing.JTextField;

public class MYinfoRegUI extends JFrame implements ActionListener{
	private JLabel lblQQcode,lblnickName,lblAge,lblSex;
	private JLabel lblNation,lblStar,lblBlood,lblHobit,lblRemark;
	private JLabel lblHeadimg;
	private JTextField txtQQcode,txtnickName,txtAge,txtHobit;
	private JComboBox txtNation,txtStar,txtBlood,txtHeadimg;
	private JRadioButton rbMale,rbRemale;
	private ButtonGroup bg;
	private JTextArea txtRemark;
	private JButton btnSave;
	private Account myInfo;
	private MainQQ mainqq;
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
	public MYinfoRegUI(){}
	public MYinfoRegUI(Account myInfo,MainQQ mainqq) {
		super("修改个人资料");
		this.myInfo=myInfo;
		this.mainqq=mainqq;
		Toolkit tool =Toolkit.getDefaultToolkit();
		Image icon = tool.getImage("image/QQ.png");
		setIconImage(icon);
		JLabel lblBg = new JLabel(new ImageIcon("image/q11.jpg"));
		add(lblBg);
	    lblBg.setLayout(null);
	    
	    btnSave = new JButton(new ImageIcon("image/baocun.png"));
		btnSave.setBounds(230, 450, 100,40);
		lblBg.add(btnSave);
	    
	
		JLabel lbltitle = new JLabel("个人信息",JLabel.CENTER);
		lbltitle.setFont(new Font("楷体",Font.BOLD,36));
		lbltitle.setForeground(Color.ORANGE);
		lbltitle.setBounds(150, 40, 200, 40);
		lblBg.add(lbltitle);
		lblQQcode = new JLabel("QQ号码:",JLabel.RIGHT);
		lblQQcode.setFont(new Font("楷体",Font.BOLD,18));
		lblQQcode.setForeground(Color.ORANGE);
		txtQQcode = new JTextField(10);
		txtQQcode.setText(myInfo.getQqCode()+"");
		txtQQcode.setEditable(false);
		lblQQcode.setBounds(100, 100, 100, 25);
		txtQQcode.setBounds(200, 100, 150, 25);
		lblBg.add(lblQQcode);
		lblBg.add(txtQQcode);
		
		
		lblnickName = new JLabel("QQ昵称:",JLabel.RIGHT);
		lblnickName.setFont(new Font("楷体",Font.BOLD,18));
		lblnickName.setForeground(Color.ORANGE);
		txtnickName = new JTextField(myInfo.getNickName());
		lblnickName.setBounds(100, 150, 100, 25);
		txtnickName.setBounds(200, 150, 150,25);
		lblBg.add(lblnickName);
		lblBg.add(txtnickName);
		
		lblHeadimg = new JLabel("头像:",JLabel.RIGHT);
		txtHeadimg = new JComboBox(sheadimg);
		for(int i=0;i<sHeadimg.length;i++){
			if(sHeadimg[i].equals(myInfo.getHeadimg())){
				txtHeadimg.setSelectedIndex(i);
				break;
			}
		}
		lblHeadimg.setFont(new Font("楷体",Font.BOLD,18));
		lblHeadimg.setForeground(Color.ORANGE);
		lblHeadimg.setBounds(320, 100, 80, 60);
		txtHeadimg.setBounds(400, 100, 80, 60);
		lblBg.add(lblHeadimg);
		lblBg.add(txtHeadimg);
		
		
		lblAge = new JLabel("年龄:",JLabel.RIGHT);
		lblAge.setFont(new Font("楷体",Font.BOLD,18));
		lblAge.setForeground(Color.ORANGE);
		txtAge = new JTextField(myInfo.getAge()+"");
		lblAge.setBounds(5, 200, 100, 25);
		txtAge.setBounds(105, 200, 130,25);
		lblBg.add(lblAge);
		lblBg.add(txtAge);
		
		lblSex = new JLabel("性别:",JLabel.RIGHT);
		lblSex.setFont(new Font("楷体",Font.BOLD,18));
		lblSex.setForeground(Color.ORANGE);
		if(myInfo.getSex().equals("男")){
			rbMale = new JRadioButton("男",true);
			rbRemale = new JRadioButton("女"); 
		}else{
			rbMale = new JRadioButton("男");
			rbRemale = new JRadioButton("女",true); 
			}
		bg = new ButtonGroup();
		bg.add(rbMale);
		bg.add(rbRemale);
		lblSex.setBounds(240, 200, 80, 25);
		rbMale.setBounds(320, 200, 40,25);
		rbRemale.setBounds(380, 200, 40,25);
		rbMale.setOpaque(false);
		rbRemale.setOpaque(false);
        lblBg.add(lblSex);
		lblBg.add(rbMale);
		lblBg.add(rbRemale);
		
		
        lblNation = new JLabel("民族:",JLabel.RIGHT);
        lblNation.setFont(new Font("楷体",Font.BOLD,18));
        lblNation.setForeground(Color.ORANGE);
        txtNation = new JComboBox(sNation); 
        for(int i=0;i<sNation.length;i++){
        	if(sNation[i].equals(myInfo.getNation())){
        		txtNation.setSelectedIndex(i);
        		break;
        	}
        }
        lblNation.setBounds(5, 250, 100, 25);
        txtNation.setBounds(105, 250, 130,25);
		lblBg.add(lblNation);
		lblBg.add(txtNation);
        
        lblStar = new JLabel("星座:",JLabel.RIGHT);
        lblStar.setFont(new Font("楷体",Font.BOLD,18));
        lblStar.setForeground(Color.ORANGE);
        txtStar = new JComboBox(sStar);
        for(int i=0;i<sStar.length;i++){
        	if(sStar[i].equals(myInfo.getStar())){
        		txtStar.setSelectedIndex(i);
        		break;
        	}
        }
        lblStar.setBounds(220, 250, 100, 25);
        txtStar.setBounds(320, 250, 100,25);
		lblBg.add(lblStar);
		lblBg.add(txtStar);
        
        lblBlood = new JLabel("血型:",JLabel.RIGHT);
        lblBlood.setFont(new Font("楷体",Font.BOLD,18));
        lblBlood.setForeground(Color.ORANGE);
        txtBlood = new JComboBox(sBlood);
        for(int i=0;i<sBlood.length;i++){
        	if(sBlood[i].equals(myInfo.getBlood())){
        		txtBlood.setSelectedIndex(i);
        		break;
        	}
        }
        lblBlood.setBounds(5, 300, 100, 25);
        txtBlood.setBounds(105, 300, 130,25);
		lblBg.add(lblBlood);
		lblBg.add(txtBlood);
		
		InetAddress addr = null;
		try {
			addr=InetAddress.getLocalHost();
		} catch (UnknownHostException e) {
			e.printStackTrace();
		}
       
        lblHobit = new JLabel("爱好:",JLabel.RIGHT);
        lblHobit.setFont(new Font("楷体",Font.BOLD,18));
        lblHobit.setForeground(Color.ORANGE);
        txtHobit = new JTextField(myInfo.getHobit());
        lblHobit.setBounds(220, 300, 100, 25);
        txtHobit.setBounds(320, 300, 100,25);
		lblBg.add(lblHobit);
		lblBg.add(txtHobit);
        
        lblRemark = new JLabel("心情:",JLabel.RIGHT);
        lblRemark.setFont(new Font("楷体",Font.BOLD,18));
        lblRemark.setForeground(Color.ORANGE);
        txtRemark = new JTextArea(myInfo.getRemark());
        lblRemark.setBounds(5, 350, 100, 25);
        JScrollPane jsp = new JScrollPane(txtRemark);
        jsp.setBounds(105, 350, 350,70);
		lblBg.add(lblRemark);
		lblBg.add(jsp);
		
        btnSave.addActionListener(this);
        setUndecorated(true);
        setResizable(false);
        setSize(500,580);
        setVisible(true);
        setLocationRelativeTo(null);
        setDefaultCloseOperation(JFrame.DISPOSE_ON_CLOSE);
		
	}
	public static void main(String[] args) {
		new MYinfoRegUI();
	}
	public void actionPerformed(ActionEvent e) {
		if(e.getSource()==btnSave){
			String nickName = txtnickName.getText().trim();
			if(nickName.equals("")){
				JOptionPane.showMessageDialog(this, "请输入昵称!");
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
		     
			
			myInfo.setNickName(nickName);
			myInfo.setHeadimg(sHeadimg[txtHeadimg.getSelectedIndex()]);
			myInfo.setBlood(sBlood[txtBlood.getSelectedIndex()]);
			myInfo.setHobit(txtHobit.getText().trim());
			myInfo.setAge(age);
			if(rbMale.isSelected()){
				myInfo.setSex("男");
			}else{
				myInfo.setSex("女");
			}
			myInfo.setNation(sNation[txtNation.getSelectedIndex()]);
			myInfo.setStar(sStar[txtStar.getSelectedIndex()]);
			myInfo.setRemark(txtRemark.getText().trim());
			BaseQQ baseQQ = new BaseQQ();
			//保存信息到数据库中的account表
			myInfo=baseQQ.UpdatAccount(myInfo);
			//给txtQQcode文本框赋值
			txtQQcode.setText(myInfo.getQqCode() +"");
			JOptionPane.showMessageDialog(this, "恭喜你修改成功");
			ImageIcon icn = new ImageIcon(myInfo.getHeadimg());
			String str2 = myInfo.getNickName()+"("+myInfo.getQqCode()+")【"+myInfo.getRemark()+"】";
            mainqq.lblmyinfo.setIcon(icn);
            mainqq.lblmyinfo.setText(str2);
            dispose();
		}
		
	}

}
