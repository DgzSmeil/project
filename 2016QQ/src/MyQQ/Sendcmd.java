package MyQQ;

import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.ObjectOutputStream;
import java.net.DatagramPacket;
import java.net.DatagramSocket;
import java.net.InetAddress;
import java.net.SocketException;
import java.util.Vector;

import javax.swing.text.StyledDocument;

public class Sendcmd {

	// 发送消息
	public static void Send(SendMSG msg) {
		try {
			// DatagramSocket实例
			DatagramSocket socket = new DatagramSocket();
			// 字节数组数组输出流
			ByteArrayOutputStream stream = new ByteArrayOutputStream();
			ObjectOutputStream oos = new ObjectOutputStream(stream);
			oos.writeObject(msg);
			oos.flush();
			byte b[]=stream.toByteArray();
			InetAddress iAdd = InetAddress.getByName(msg.friendInfo.getIpAddr());
			int port = msg.friendInfo.getPort();
			DatagramPacket packet = new DatagramPacket(b,0,b.length,iAdd,port);
			socket.send(packet);
			System.out.println(msg.cmd +"==发送消息,b.size="+b.length);
            socket.close();
			oos.close();
		} catch (SocketException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	public static void Sendall(Vector<Account>allinfo,Account myInfo,int cmd){
			for (Account acc : allinfo) {
				if(!acc.getOnlinestatus().equals(Cmd.STATUS[1]) && acc.getQqCode()!=myInfo.getQqCode()){
					SendMSG msg = new SendMSG();
					msg.cmd = cmd;
					msg.myInfo = myInfo;
					msg.friendInfo = acc;
					Send(msg);
				}
			}
			
		}
	public static void Sendall(Vector<Account>allinfo,Account myInfo,int cmd,StyledDocument doc){
		for (Account acc : allinfo) {
			if(!acc.getOnlinestatus().equals(Cmd.STATUS[1]) && acc.getQqCode()!=myInfo.getQqCode()){
				SendMSG msg = new SendMSG();
				msg.cmd = cmd;
				msg.myInfo = myInfo;
				msg.friendInfo = acc;
				Send(msg);
			}
		}
		
	}
}
