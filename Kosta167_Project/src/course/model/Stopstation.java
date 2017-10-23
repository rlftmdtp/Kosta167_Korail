package course.model;

import java.io.Serializable;

public class Stopstation implements Serializable {
	private String ss_id;
	private String line_id;
	private String ss_name;

	
	

	public Stopstation(){}
	
	public String getSs_id() {
		return ss_id;
	}
	public void setSs_id(String ss_id) {
		this.ss_id = ss_id;
	}
	public String getLine_id() {
		return line_id;
	}
	public void setLine_id(String line_id) {
		this.line_id = line_id;
	}
	public String getSs_name() {
		return ss_name;
	}
	public void setSs_name(String ss_name) {
		this.ss_name = ss_name;
	}

}
