package MyQQ;

import javax.swing.ImageIcon;
import javax.swing.JFrame;
import javax.swing.JLabel;
public class Regii extends JFrame{
		JLabel lbimabg;
		Account acc;
		public Regii() {
			lbimabg=new JLabel(new ImageIcon("image/qq.gif"));
			add(lbimabg);
			setUndecorated(true);
			setAlwaysOnTop(true);
			setVisible(true);
			pack();
			setLocation(1050, 50);
			
			setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
		}
		public static void main(String[] args) {
			new Regii();
			
		}
	}


