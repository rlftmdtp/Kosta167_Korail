package course.model;

import java.io.Serializable;
import java.sql.Timestamp;

public class Train implements Serializable {
	private String tr_id;
	private String line_id;
	private String tr_stime;
	
	public Train(){}
	
	public String getTr_id() {
		return tr_id;
	}
	public void setTr_id(String tr_id) {
		this.tr_id = tr_id;
	}
	public String getLine_id() {
		return line_id;
	}
	public void setLine_id(String line_id) {
		this.line_id = line_id;
	}
	public String getTr_stime() {
		return tr_stime;
	}
	public void setTr_stime(String tr_stime) {
		this.tr_stime = tr_stime;
	}

	

}
