package share.model;

import java.io.Serializable;
import java.sql.Timestamp;

public class ShareReply implements Serializable {

	private int sr_no;
	private String sr_content;
	private Timestamp sr_date;
	private int sh_no;
	
	public ShareReply(){} 
	
	
	public int getSr_no() {
		return sr_no;
	}
	public void setSr_no(int sr_no) {
		this.sr_no = sr_no;
	}
	public String getSr_content() {
		return sr_content;
	}
	public void setSr_content(String sr_content) {
		this.sr_content = sr_content;
	}
	public Timestamp getSr_date() {
		return sr_date;
	}
	public void setSr_date(Timestamp sr_date) {
		this.sr_date = sr_date;
	}
	public int getSh_no() {
		return sh_no;
	}
	public void setSh_no(int sh_no) {
		this.sh_no = sh_no;
	}


}
