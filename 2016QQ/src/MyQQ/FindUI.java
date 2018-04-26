package MyQQ;

import java.awt.BorderLayout;
import java.awt.FlowLayout;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.awt.event.MouseEvent;
import java.awt.event.MouseListener;
import java.util.Vector;

import javax.swing.ImageIcon;
import javax.swing.JButton;
import javax.swing.JComboBox;
import javax.swing.JFrame;
import javax.swing.JLabel;
import javax.swing.JOptionPane;
import javax.swing.JPanel;
import javax.swing.JScrollPane;
import javax.swing.JTable;
import javax.swing.JTextField;
import javax.swing.table.AbstractTableModel;



public class FindUI extends JFrame implements ActionListener,MouseListener{
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	JLabel lblQQcode,lblNickName,lblAge;
	JTextField txtQQcode,txtNickName,txtAge;
	JComboBox cbSex,cbStatus;
	JTable dataTable;
	JButton btnFind,btnAdd,btnClose;
	Account myInfo;
	Vector<String> vHead;
	Vector vData;
//	public FindUI() {
//		init();
//	}
	public FindUI(Account acc) {
		this.myInfo = acc;
		init();
	}
	String sSex[] = {"不选择","男","女"};
	String sStatus[]={"不选择","在线","离线","忙碌","隐身"};
	BaseQQ base = new BaseQQ();
	public void init(){
		JPanel topPanel = new JPanel(new FlowLayout(FlowLayout.LEFT));
		lblQQcode = new JLabel("QQ号码");
		lblNickName = new JLabel("昵称");
		lblAge = new JLabel("年龄");
		txtQQcode = new JTextField(8);
		txtNickName = new JTextField(8);
		txtAge = new JTextField(5);
		cbSex = new JComboBox(sSex);
		cbStatus = new JComboBox(sStatus);
		btnFind = new JButton("查找");
		topPanel.add(lblQQcode);
		topPanel.add(txtQQcode);
		topPanel.add(lblNickName);
		topPanel.add(txtNickName);
		topPanel.add(lblAge);
		topPanel.add(txtAge);
		topPanel.add(cbSex);
		topPanel.add(cbStatus);
		topPanel.add(btnFind);
		add(topPanel,BorderLayout.NORTH);
		String[] columnNames = {"头像", "QQ号码", "昵称", "年龄", "性别","血型","星座","民族","爱好","状态","备注"};
		vHead = new Vector<String>();
		for(int i=0;i<columnNames.length;i++){
			vHead.addElement(columnNames[i]);
		}
		String sql = "select headimg,qqcode,nickname,age,sex,blood,star,nation,hobit,onlinestatus,remark from account";
		//vData = base.findFriend(sql);
		vData=new Vector();
		dataTable = new JTable(new MyTableModel(vHead,vData));
		dataTable.addMouseListener(this);
		dataTable.setRowHeight(60);
		add(new JScrollPane(dataTable));
		JPanel bottomPanel = new JPanel(new FlowLayout(FlowLayout.RIGHT));
		btnAdd = new JButton("添加好友");
		btnClose = new JButton("关闭窗口");
		bottomPanel.add(btnAdd);
		bottomPanel.add(btnClose);
		add(bottomPanel,BorderLayout.SOUTH);
		btnFind.addActionListener(this);
		btnAdd.addActionListener(this);
		btnClose.addActionListener(this);
		setSize(800, 500);
		setVisible(true);
		setLocationRelativeTo(null);
		setDefaultCloseOperation(JFrame.DISPOSE_ON_CLOSE);
	}
//	public static void main(String[] args) {
//		new FindUI();
//	}
	//内部类实现抽象的TableModel，并改写必要的方法
    class MyTableModel extends AbstractTableModel {
    	Vector<String> vHead;
    	Vector data;
        public MyTableModel(Vector<String> vHead,Vector data) {
        	this.vHead = vHead;
        	this.data = data;
        }
        //得到表格列长度
        public int getColumnCount() {
            return vHead.size();
        }
        //得到表格行数
        public int getRowCount() {
            return data.size();
        }
        //得到表格列名
        public String getColumnName(int col) {
//            System.out.println(" 该列的列名为：" + vHead.get(col));
            return vHead.get(col);
        }
        //得到指定单元的值
        public Object getValueAt(int row, int col) {
        	Vector rowData = (Vector)vData.get(row);
			if(col==0){//表示头像
				return new ImageIcon(rowData.get(col).toString());
			}else{
				return rowData.get(col);
			}
        }
        //返回指定列的数据类型
        @Override
		public Class<?> getColumnClass(int c) {
        	if(c==0){//表示头像
				return ImageIcon.class;
			}else{
				return super.getColumnClass(c);
			}
        }
        //设置单元格是否可修改
        public boolean isCellEditable(int row, int col) {
            return false;
        }

        //设置单元格的值
        public void setValueAt(Object value, int row, int col) {
        	Vector rowData = (Vector)vData.get(row);
        	rowData.set(col, value);
            fireTableCellUpdated(row, col);
        }
    }
	public void actionPerformed(ActionEvent e) {
		if(e.getSource()==btnFind){
			String sql = "select headimg,qqcode,nickname,age,sex,blood,star,nation,hobit,onlinestatus,remark from account";
			sql +=" where ";
			String Qqcode = txtQQcode.getText().trim();
			String Nickname = txtNickName.getText().trim();
			String age = txtAge.getText().trim();
			Boolean neeeQuery=false;
			if(!Qqcode.equals("")){
				sql += " qqCode=" + Qqcode ;
			}
			if(!Nickname.equals("")){
				if(sql.endsWith("where "))
				{
					sql += " nickName like '%"+Nickname + "%'";
				}else{
				sql += " and nickName like '%"+Nickname + "%'";
				}
			}
			if(!age.equals(""))
			{
				if(sql.endsWith("where "))
				{
					sql += " age='"+age+"'";
				}
				else   
				{
					sql += " and age='"+age+"'";
				}
			}
			String sex = sSex[cbSex.getSelectedIndex()];
			String status = sStatus[cbStatus.getSelectedIndex()];
			if(!sex.equals("不选择")){

				if(sql.endsWith("where "))
				{
					sql += " sex='"+sex + "'";
				}
				else
				{
					sql += " and sex='"+sex + "'";
				}
			}
			if(!status.equals("不选择")){

				if(sql.endsWith("where "))
				{
					sql += " onlinestatus='"+status + "'";
				}
				else
				{
					sql += " and onlinestatus='"+status + "'";
				}
			}
			sql += " order by age";
			vData = base.findFriend(sql);
			dataTable.setModel(new MyTableModel(vHead,vData));
		}else if(e.getSource()==btnClose){
			dispose();
		}else if(e.getSource()==btnAdd){
			int index = dataTable.getSelectedRow();
			if(index>=0){
				Vector row = (Vector)vData.get(index);
				int qqcode = Integer.parseInt(row.get(1).toString());
				Account friendinfo = base.getSelectedFriend(qqcode);
				String str = "是否添加["+friendinfo.getNickName()+"]为好友！";
				if(JOptionPane.showConfirmDialog(this,str,"添加好友",JOptionPane.OK_CANCEL_OPTION)==JOptionPane.OK_OPTION){
					SendMSG msg = new SendMSG();
					msg.cmd = Cmd.CMD_ADDFRI;
					msg.myInfo=myInfo;
					msg.friendInfo=friendinfo;
					Sendcmd.Send(msg);
				}
			}
		}
	}
	public void mouseClicked(MouseEvent e) {
		if(e.getSource()==dataTable){
			int index = dataTable.getSelectedRow();
			if(index>=0){
				if(e.getClickCount()==2){
					Vector row = (Vector)vData.get(index);
					int qqcode = Integer.parseInt(row.get(1).toString());
					if(qqcode==myInfo.getQqCode()){
						JOptionPane.showMessageDialog(this, "不能添加自己为好友");
						return;
					}
					if(base.isFriend(myInfo.getQqCode(),qqcode)){
						JOptionPane.showMessageDialog(this, "你们已经是好友");
						return;
					}
					Account friendinfo = base.getSelectedFriend(qqcode);
					String str = "是否添加["+friendinfo.getNickName()+"]为好友";
					if(JOptionPane.showConfirmDialog(this,str ,"添加好友",JOptionPane.OK_CANCEL_OPTION)==JOptionPane.OK_OPTION){
						SendMSG msg = new SendMSG();
						msg.cmd=Cmd.CMD_ADDFRI;
						msg.myInfo=myInfo;
						msg.friendInfo=friendinfo;
						Sendcmd.Send(msg);
					}
				}
			}
		}
	}
	public void mouseEntered(MouseEvent e) {
		// TODO Auto-generated method stub
		
	}
	public void mouseExited(MouseEvent e) {
		// TODO Auto-generated method stub
		
	}
	public void mousePressed(MouseEvent e) {
		// TODO Auto-generated method stub
		
	}
	public void mouseReleased(MouseEvent e) {
		// TODO Auto-generated method stub
		
	}

}
