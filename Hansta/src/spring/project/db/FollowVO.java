package spring.project.db;

public class FollowVO {
	String follower, followee;
	public FollowVO() {
		// TODO Auto-generated constructor stub
	}
	public FollowVO(String follower, String followee) {
		super();
		this.follower = follower;
		this.followee = followee;
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
