package SQLBean;

import java.io.Serializable;

public class VIPBean  implements Serializable{

	private  int VIPid;
	private  String VIPleibie;
	private  int VIPmoney ;
	private  int VIPsell;
	private  int VIPsrcmoney;
	public int getVIPid() {
		return VIPid;
	}
	public void setVIPid(int pid) {
		VIPid = pid;
	}
	public String getVIPleibie() {
		return VIPleibie;
	}
	public void setVIPleibie(String pleibie) {
		VIPleibie = pleibie;
	}
	public int getVIPmoney() {
		return VIPmoney;
	}
	public void setVIPmoney(int pmoney) {
		VIPmoney = pmoney;
	}
	public int getVIPsell() {
		return VIPsell;
	}
	public void setVIPsell(int psell) {
		VIPsell = psell;
	}
	public int getVIPsrcmoney() {
		return VIPsrcmoney;
	}
	public void setVIPsrcmoney(int psrcmoney) {
		VIPsrcmoney = psrcmoney;
	}
	
}
