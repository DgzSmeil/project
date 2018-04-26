package SQLBean;

import java.io.Serializable;

public class JifenBean implements Serializable{

	private int fenid;
	private int teacherid;
	private int fen;
	public int getFenid() {
		return fenid;
	}
	public void setFenid(int fenid) {
		this.fenid = fenid;
	}
	public int getTeacherid() {
		return teacherid;
	}
	public void setTeacherid(int teacherid) {
		this.teacherid = teacherid;
	}
	public int getFen() {
		return fen;
	}
	public void setFen(int fen) {
		this.fen = fen;
	}
}
