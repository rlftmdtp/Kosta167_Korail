package course.model;

import java.util.Date;

public class CourseDetail {
	private int cd_id;
	private int c_id;
	private String tt_id;
	private String cd_start;
	private Date cd_stime;
	private String cd_end;
	private Date cd_etime;
	
	public CourseDetail(){} // 기본 생성자

	public CourseDetail(int cd_id, int c_id, String tt_id, String cd_start, Date cd_stime, String cd_end,
			Date cd_etime) {
		super();
		this.cd_id = cd_id;
		this.c_id = c_id;
		this.tt_id = tt_id;
		this.cd_start = cd_start;
		this.cd_stime = cd_stime;
		this.cd_end = cd_end;
		this.cd_etime = cd_etime;
	}

	

	public int getCd_id() {
		return cd_id;
	}

	public void setCd_id(int cd_id) {
		this.cd_id = cd_id;
	}

	public int getC_id() {
		return c_id;
	}

	public void setC_id(int c_id) {
		this.c_id = c_id;
	}

	public String getTt_id() {
		return tt_id;
	}

	public void setTt_id(String tt_id) {
		this.tt_id = tt_id;
	}

	public String getCd_start() {
		return cd_start;
	}

	public void setCd_start(String cd_start) {
		this.cd_start = cd_start;
	}

	public Date getCd_stime() {
		return cd_stime;
	}

	public void setCd_stime(Date cd_stime) {
		this.cd_stime = cd_stime;
	}

	public String getCd_end() {
		return cd_end;
	}

	public void setCd_end(String cd_end) {
		this.cd_end = cd_end;
	}

	public Date getCd_etime() {
		return cd_etime;
	}

	public void setCd_etime(Date cd_etime) {
		this.cd_etime = cd_etime;
	}
	
	
}
