package MyQQ;

import java.awt.Color;
import java.awt.Font;
import java.awt.Image;
import java.awt.Toolkit;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.awt.event.MouseEvent;
import java.awt.event.MouseListener;
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

public class LookinfoUI extends JFrame implements MouseListener{
	private JLabel lblQQcode,lblnickName,lblAge,lblSex;
	private JLabel lblNation,lblStar,lblBlood,lblHobit,lblRemark;
	private JLabel lblHeadimg;

	public LookinfoUI(){}
	public LookinfoUI(Account myInfo) {
		super("好友资料");
		Toolkit tool =Toolkit.getDefaultToolkit();
		Image icon = tool.getImage("image/QQ.png");
		setIconImage(icon);
		JLabel lblBg = new JLabel(new ImageIcon("image/q8.jpg"));
		add(lblBg);
	    lblBg.setLayout(null);
	  
	
		JLabel lbltitle = new JLabel("好友资料",JLabel.CENTER);
		lbltitle.setFont(new Font("楷体",Font.BOLD,36));
		lbltitle.setForeground(Color.ORANGE);
		lbltitle.setBounds(0,30,260,40);
		lblBg.add(lbltitle);
		lblQQcode = new JLabel("QQ号码:"+myInfo.getQqCode(),JLabel.RIGHT);
		lblQQcode.setFont(new Font("楷体",Font.BOLD,18));
		lblQQcode.setForeground(Color.ORANGE);
		lblQQcode.setBounds(30, 100, 120, 40);
		lblBg.add(lblQQcode);
		
		
		lblnickName = new JLabel("QQ昵称:"+myInfo.getNickName(),JLabel.RIGHT);
		lblnickName.setFont(new Font("楷体",Font.BOLD,18));
		lblnickName.setForeground(Color.ORANGE);
		lblnickName.setBounds(30, 140, 130, 40);
		lblBg.add(lblnickName);
		
		lblHeadimg = new JLabel(new ImageIcon(myInfo.getHeadimg()));
		lblHeadimg.setFont(new Font("楷体",Font.BOLD,18));
		lblHeadimg.setForeground(Color.ORANGE);
		lblHeadimg.setBounds(270, 100, 80, 60);
		lblBg.add(lblHeadimg);
		
		lblAge = new JLabel("年龄:"+myInfo.getAge(),JLabel.RIGHT);
		lblAge.setFont(new Font("楷体",Font.BOLD,18));
		lblAge.setForeground(Color.ORANGE);
		lblAge.setBounds(0, 180, 100, 20);
		lblBg.add(lblAge);
		
		lblSex = new JLabel("性别:"+myInfo.getSex(),JLabel.RIGHT);
		lblSex.setFont(new Font("楷体",Font.BOLD,18));
		lblSex.setForeground(Color.ORANGE);
		lblSex.setBounds(280, 180, 80, 20);
        lblBg.add(lblSex);
		
        lblNation = new JLabel("民族:"+myInfo.getNation(),JLabel.RIGHT);
        lblNation.setFont(new Font("楷体",Font.BOLD,18));
        lblNation.setForeground(Color.ORANGE);
		lblNation.setBounds(0, 220, 100, 20);
		lblBg.add(lblNation);
        
        lblStar = new JLabel("星座:"+myInfo.getStar(),JLabel.RIGHT);
        lblStar.setFont(new Font("楷体",Font.BOLD,18));
        lblStar.setForeground(Color.ORANGE);
		lblStar.setBounds(280, 220, 120, 40);
		lblBg.add(lblStar);
        
        lblBlood = new JLabel("血型:"+myInfo.getBlood()+"型",JLabel.RIGHT);
        lblBlood.setFont(new Font("楷体",Font.BOLD,18));
        lblBlood.setForeground(Color.ORANGE);
		lblBlood.setBounds(0, 260, 100, 20);
		lblBg.add(lblBlood);
		
        lblHobit = new JLabel("爱好:"+myInfo.getHobit(),JLabel.RIGHT);
        lblHobit.setFont(new Font("楷体",Font.BOLD,18));
        lblHobit.setForeground(Color.ORANGE);
		lblHobit.setBounds(0, 300, 150, 20);
		lblBg.add(lblHobit);
        
        lblRemark = new JLabel("心情:"+myInfo.getRemark(),JLabel.RIGHT);
        lblRemark.setFont(new Font("楷体",Font.BOLD,18));
        lblRemark.setForeground(Color.ORANGE);
		lblRemark.setBounds(0, 310, 300, 60);
		lblBg.add(lblRemark);
		this.addMouseListener(this);
		
		setUndecorated(true);
        setResizable(false);
        setSize(420,360);
        setVisible(true);
        setLocationRelativeTo(null);
        setDefaultCloseOperation(JFrame.DISPOSE_ON_CLOSE);
		
	}
	public static void main(String[] args) {
		new LookinfoUI();
	}
	public void mouseClicked(MouseEvent e) {
		// TODO Auto-generated method stub
		
	}
	public void mouseEntered(MouseEvent e) {
		// TODO Auto-generated method stub
		
	}
	public void mouseExited(MouseEvent e) {
		dispose();		
	}
	public void mousePressed(MouseEvent e) {
		// TODO Auto-generated method stub
		
	}
	public void mouseReleased(MouseEvent e) {
		// TODO Auto-generated method stub
		
	}
	

}
