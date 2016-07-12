package com.hb.mybatis;

public class Studyroom_ReserveVO {
	private String sr_idx, s_num, start_time, end_time, id, sr_state, sr_date;
	public Studyroom_ReserveVO() {
		// TODO Auto-generated constructor stub
	}

	public String getSr_idx() {
		return sr_idx;
	}

	public void setSr_idx(String sr_idx) {
		this.sr_idx = sr_idx;
	}

	public String getS_num() {
		return s_num;
	}

	public void setS_num(String s_num) {
		this.s_num = s_num;
	}

	public String getStart_time() {
		return start_time;
	}

	public void setStart_time(String start_time) {
		this.start_time = start_time;
	}

	public String getEnd_time() {
		return end_time;
	}

	public void setEnd_time(String end_time) {
		this.end_time = end_time;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getSr_state() {
		return sr_state;
	}

	public void setSr_state(String sr_state) {
		this.sr_state = sr_state;
	}

	public String getSr_date() {
		return sr_date;
	}

	public void setSr_date(String sr_date) {
		this.sr_date = sr_date;
	}

	public Studyroom_ReserveVO(String sr_idx, String s_num, String start_time, String end_time, String id,
			String sr_state, String sr_date) {
		super();
		this.sr_idx = sr_idx;
		this.s_num = s_num;
		this.start_time = start_time;
		this.end_time = end_time;
		this.id = id;
		this.sr_state = sr_state;
		this.sr_date = sr_date;
	}
	
}
