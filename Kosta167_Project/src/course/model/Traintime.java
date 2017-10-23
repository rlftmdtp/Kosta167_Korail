package course.model;

import java.io.Serializable;
import java.sql.Timestamp;

public class Traintime implements Serializable {
	private String tt_id;
	private String tr_id;
	private String ss_id;
	private String tt_stime;
	
	public Traintime(){}
	
	public String getTt_id() {
		return tt_id;
	}
	public void setTt_id(String tt_id) {
		this.tt_id = tt_id;
	}
	public String getTr_id() {
		return tr_id;
	}
	public void setTr_id(String tr_id) {
		this.tr_id = tr_id;
	}
	public String getSs_id() {
		return ss_id;
	}
	public void setSs_id(String ss_id) {
		this.ss_id = ss_id;
	}
	public String getTt_stime() {
		return tt_stime;
	}
	public void setTt_stime(String tt_stime) {
		this.tt_stime = tt_stime;
	}

}
