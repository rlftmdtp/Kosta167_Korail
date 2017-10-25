package main.model;

import java.io.Serializable;

public class Member implements Serializable{
	private String m_id;
	private String m_pw;
	private String m_name;
	private String m_gender;
	private int m_age;
	private String m_hp;
	
	public Member(){} // 기본 생성자
	
	public Member(String m_id, String m_pw, String m_name, String m_gender, int m_age, String m_hp) {
		super();
		this.m_id = m_id;
		this.m_pw = m_pw;
		this.m_name = m_name;
		this.m_gender = m_gender;
		this.m_age = m_age;
		this.m_hp = m_hp;
	}

	public String getM_id() {
		return m_id;
	}
	public void setM_id(String m_id) {
		this.m_id = m_id;
	}
	public String getM_pw() {
		return m_pw;
	}
	public void setM_pw(String m_pw) {
		this.m_pw = m_pw;
	}
	public String getM_name() {
		return m_name;
	}
	public void setM_name(String m_name) {
		this.m_name = m_name;
	}
	public String getM_gender() {
		return m_gender;
	}
	public void setM_gender(String m_gender) {
		this.m_gender = m_gender;
	}
	public int getM_age() {
		return m_age;
	}
	public void setM_age(int m_age) {
		this.m_age = m_age;
	}
	public String getM_hp() {
		return m_hp;
	}
	public void setM_hp(String m_hp) {
		this.m_hp = m_hp;
	}
	
	
}
