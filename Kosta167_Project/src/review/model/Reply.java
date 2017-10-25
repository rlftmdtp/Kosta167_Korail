package review.model;

import java.io.Serializable;
import java.sql.Timestamp;

public class Reply implements Serializable{
	private int re_no;
	private int r_no;
	private String re_name;
	private String re_content;
	private Timestamp re_date;
	
	public Reply(){}
	
	

	public Reply(int re_no, int r_no, String re_name, String re_content, Timestamp re_date) {
		super();
		this.re_no = re_no;
		this.r_no = r_no;
		this.re_name = re_name;
		this.re_content = re_content;
		this.re_date = re_date;
	}



	public int getRe_no() {
		return re_no;
	}

	public void setRe_no(int re_no) {
		this.re_no = re_no;
	}

	public int getR_no() {
		return r_no;
	}

	public void setR_no(int r_no) {
		this.r_no = r_no;
	}

	public String getRe_name() {
		return re_name;
	}

	public void setRe_name(String re_name) {
		this.re_name = re_name;
	}

	public String getRe_content() {
		return re_content;
	}

	public void setRe_content(String re_content) {
		this.re_content = re_content;
	}

	public Timestamp getRe_date() {
		return re_date;
	}

	public void setRe_date(Timestamp re_date) {
		this.re_date = re_date;
	}

	
	
	
	

	
	
}
