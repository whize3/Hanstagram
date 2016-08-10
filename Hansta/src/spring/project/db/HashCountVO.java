package spring.project.db;

public class HashCountVO {
	private String hashtag, hashcnt;
	
	public HashCountVO(){}

	public HashCountVO(String hashtag, String hashcnt) {
		super();
		this.hashtag = hashtag;
		this.hashcnt = hashcnt;
	}

	public String getHashtag() {
		return hashtag;
	}

	public void setHashtag(String hashtag) {
		this.hashtag = hashtag;
	}

	public String getHashcnt() {
		return hashcnt;
	}

	public void setHashcnt(String hashcnt) {
		this.hashcnt = hashcnt;
	}
	
}
