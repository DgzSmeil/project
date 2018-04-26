package SQLBean;

import java.io.Serializable;

public class BankBean implements Serializable{

	private int bank_id;
	private String bank_name;
	public int getBank_id() {
		return bank_id;
	}
	public void setBank_id(int bank_id) {
		this.bank_id = bank_id;
	}
	public String getBank_name() {
		return bank_name;
	}
	public void setBank_name(String bank_name) {
		this.bank_name = bank_name;
	}

}
