package course.model;

import java.io.Serializable;

public class Line implements Serializable {
	private String line_id;
	private String line_name;
	
	public Line(){}
	
	public String getLine_id() {
		return line_id;
	}
	public void setLine_id(String line_id) {
		this.line_id = line_id;
	}
	public String getLine_name() {
		return line_name;
	}
	public void setLine_name(String line_name) {
		this.line_name = line_name;
	}
}
