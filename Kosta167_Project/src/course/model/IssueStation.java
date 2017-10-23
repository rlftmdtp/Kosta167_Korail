package course.model;

import java.io.Serializable;

public class IssueStation implements Serializable {
	private String i_id;
	private String i_name;
	private String i_content;
	
	public IssueStation(){}
	
	public IssueStation(String i_id, String i_name, String i_content) {
		super();
		this.i_id = i_id;
		this.i_name = i_name;
		this.i_content = i_content;
	}
	
	public String getI_id() {
		return i_id;
	}
	public void setI_id(String i_id) {
		this.i_id = i_id;
	}
	public String getI_name() {
		return i_name;
	}
	public void setI_name(String i_name) {
		this.i_name = i_name;
	}
	public String getI_content() {
		return i_content;
	}
	public void setI_content(String i_content) {
		this.i_content = i_content;
	}
	
	
}
