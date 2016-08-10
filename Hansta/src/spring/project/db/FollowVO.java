package spring.project.db;

public class FollowVO {
	String follower, followee, state;
	public FollowVO() {
		// TODO Auto-generated constructor stub
	}
	public FollowVO(String follower, String followee,String state) {
		super();
		this.follower = follower;
		this.followee = followee;
		this.state = state;
	}
	public String getState() {
		return state;
	}
	public void setState(String state) {
		this.state = state;
	}
	public String getFollower() {
		return follower;
	}
	public void setFollower(String follower) {
		this.follower = follower;
	}
	public String getFollowee() {
		return followee;
	}
	public void setFollowee(String followee) {
		this.followee = followee;
	}
	
}
