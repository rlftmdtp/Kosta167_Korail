package review.model;

import java.io.Serializable;
import java.sql.Timestamp;

public class Review implements Serializable{
	private int r_no;
	private String m_id;
	private String r_name;
	private String r_title;
	private String r_content;
	private String r_pw;
	private Timestamp r_date;
	private int r_hit;
	private String r_fname;
	
	public Review() {}
	
	public int getR_no() {
		return r_no;
	}
	public void setR_no(int r_no) {
		this.r_no = r_no;
	}
	public String getM_id() {
		return m_id;
	}
	public void setM_id(String m_id) {
		this.m_id = m_id;
	}
	public String getR_name() {
		return r_name;
	}
	public void setR_name(String r_name) {
		this.r_name = r_name;
	}
	public String getR_title() {
		return r_title;
	}
	public void setR_title(String r_title) {
		this.r_title = r_title;
	}
	public String getR_content() {
		return r_content;
	}
	public void setR_content(String r_content) {
		this.r_content = r_content;
	}
	public String getR_pw() {
		return r_pw;
	}
	public void setR_pw(String r_pw) {
		this.r_pw = r_pw;
	}
	public Timestamp getR_date() {
		return r_date;
	}
	public void setR_date(Timestamp r_date) {
		this.r_date = r_date;
	}
	public int getR_hit() {
		return r_hit;
	}
	public void setR_hit(int r_hit) {
		this.r_hit = r_hit;
	}
	public String getR_fname() {
		return r_fname;
	}
	public void setR_fname(String r_fname) {
		this.r_fname = r_fname;
	}

	@Override
	public String toString() {
		return "Review [r_no=" + r_no + ", m_id=" + m_id + ", r_name=" + r_name + ", r_title=" + r_title
				+ ", r_content=" + r_content + ", r_pw=" + r_pw + ", r_date=" + r_date + ", r_hit=" + r_hit
				+ ", r_fname=" + r_fname + "]";
	}
	
	
}
