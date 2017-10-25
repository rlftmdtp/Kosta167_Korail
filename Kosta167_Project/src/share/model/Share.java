package share.model;

import java.io.Serializable;
import java.sql.Timestamp;


public class Share implements Serializable{

	
	private int sh_no;
	private String c_id;
	private String m_id;
	private String sh_title;
	private String sh_content;
	private String sh_pw;
	private Timestamp sh_date;
	private int sh_hit;
	private String sh_subject;
	private String sh_shareok;
	
	
	public Share() {}


	public int getSh_no() {
		return sh_no;
	}


	public void setSh_no(int sh_no) {
		this.sh_no = sh_no;
	}


	public String getC_id() {
		return c_id;
	}


	public void setC_id(String c_id) {
		this.c_id = c_id;
	}


	public String getM_id() {
		return m_id;
	}


	public void setM_id(String m_id) {
		this.m_id = m_id;
	}


	public String getSh_title() {
		return sh_title;
	}


	public void setSh_title(String sh_title) {
		this.sh_title = sh_title;
	}


	public String getSh_content() {
		return sh_content;
	}


	public void setSh_content(String sh_content) {
		this.sh_content = sh_content;
	}


	public String getSh_pw() {
		return sh_pw;
	}


	public void setSh_pw(String sh_pw) {
		this.sh_pw = sh_pw;
	}


	public Timestamp getSh_date() {
		return sh_date;
	}


	public void setSh_date(Timestamp sh_date) {
		this.sh_date = sh_date;
	}


	public int getSh_hit() {
		return sh_hit;
	}


	public void setSh_hit(int sh_hit) {
		this.sh_hit = sh_hit;
	}


	public String getSh_subject() {
		return sh_subject;
	}


	public void setSh_subject(String sh_subject) {
		this.sh_subject = sh_subject;
	}


	public String getSh_shareok() {
		return sh_shareok;
	}


	public void setSh_shareok(String sh_shareok) {
		this.sh_shareok = sh_shareok;
	}


	
	

}