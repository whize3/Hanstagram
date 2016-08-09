package spring.project.db;

public class LikeVO {
	private String b_idx, id;
	public LikeVO() {	}
	public LikeVO(String b_idx, String id) {
		super();
		this.b_idx = b_idx;
		this.id = id;
	}
	public String getB_idx() {
		return b_idx;
	}
	public void setB_idx(String b_idx) {
		this.b_idx = b_idx;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	
}
