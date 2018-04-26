package MyQQ;

import java.io.Serializable;

import javax.swing.text.StyledDocument;

public class SendMSG implements Serializable{

         public int cmd;
         public Account myInfo;
         public Account friendInfo;
         public StyledDocument doc;
         public byte b[];
		public String filename;
}
