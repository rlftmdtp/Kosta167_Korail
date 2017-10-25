package message.model;

import java.io.Serializable;
import java.sql.Timestamp;


public class Message implements Serializable{
	private int msg_no;
	private String m_id; // 보낸사람
	private String msg_sendid; // 받는사람
	private String msg_content;
	private Timestamp msg_date;
	private int msg_hit;
	
	public Message(){}

	public Message(int msg_no, String m_id, String msg_sendid, String msg_content, Timestamp msg_date, int msg_hit) {
		super();
		this.msg_no = msg_no;
		this.m_id = m_id;
		this.msg_sendid = msg_sendid;
		this.msg_content = msg_content;
		this.msg_date = msg_date;
		this.msg_hit = msg_hit;
	}

	public int getMsg_no() {
		return msg_no;
	}

	public void setMsg_no(int msg_no) {
		this.msg_no = msg_no;
	}

	public String getM_id() {
		return m_id;
	}

	public void setM_id(String m_id) {
		this.m_id = m_id;
	}

	public String getMsg_sendid() {
		return msg_sendid;
	}

	public void setMsg_sendid(String msg_sendid) {
		this.msg_sendid = msg_sendid;
	}

	public String getMsg_content() {
		return msg_content;
	}

	public void setMsg_content(String msg_content) {
		this.msg_content = msg_content;
	}

	public Timestamp getMsg_date() {
		return msg_date;
	}

	public void setMsg_date(Timestamp msg_date) {
		this.msg_date = msg_date;
	}

	public int getMsg_hit() {
		return msg_hit;
	}

	public void setMsg_hit(int msg_hit) {
		this.msg_hit = msg_hit;
	}


	
	
}
