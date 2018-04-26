package MyQQ;

import java.awt.Color;
import java.awt.Container;
import java.awt.FlowLayout;
import java.awt.event.MouseEvent;
import java.awt.event.MouseListener;
import java.io.File;

import javax.swing.BorderFactory;
import javax.swing.ImageIcon;
import javax.swing.JFrame;
import javax.swing.JLabel;

public class BQUI extends JFrame implements MouseListener{

	JLabel lblbqicon[];
	String iconlist[];
	ChatUI chat;
	public BQUI(ChatUI chat,int x,int y) {
		this.chat = chat;
		setUndecorated(true);
		setResizable(false);
		setAlwaysOnTop(true);
		Container con=getContentPane();
		con.setLayout(new FlowLayout(FlowLayout.LEFT));
		con.setBackground(Color.WHITE);
		File file = new File("bq");
		iconlist=file.list();
		lblbqicon=new JLabel[iconlist.length];
		for(int i=0;i<iconlist.length;i++){
			lblbqicon[i]=new JLabel(new ImageIcon("bq/"+iconlist[i]));
			lblbqicon[i].setBorder(BorderFactory.createLineBorder(Color.WHITE,2));
			lblbqicon[i].addMouseListener(this);
			add(lblbqicon[i]);
		}
		setSize(300,320);
		setLocation(x, y);
		setVisible(true);
		setDefaultCloseOperation(JFrame.DISPOSE_ON_CLOSE);
	}
	public void mouseClicked(MouseEvent e) {
		if(e.getClickCount()==2){
			for(int i=0;i<iconlist.length;i++){
				if(e.getSource()==lblbqicon[i]){
					chat.txtsend.insertIcon(lblbqicon[i].getIcon());
					dispose();
					break;
				}
			}
		}
		
	}
	public void mouseEntered(MouseEvent e) {
		for(int i=0;i<iconlist.length;i++){
		if(e.getSource()==lblbqicon[i]){
			lblbqicon[i].setBorder(BorderFactory.createLineBorder(Color.RED,2));
			break;
			}
		  }
		}
		
	
	public void mouseExited(MouseEvent e) {
		for(int i=0;i<iconlist.length;i++){
			if(e.getSource()==lblbqicon[i]){
				lblbqicon[i].setBorder(BorderFactory.createLineBorder(Color.WHITE,2));
				break;
				}
			  }		
	}
	public void mousePressed(MouseEvent e) {
		// TODO Auto-generated method stub
		
	}
	public void mouseReleased(MouseEvent e) {
		// TODO Auto-generated method stub
		
	}
}
