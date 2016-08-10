package spring.project.db;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

@Repository
public class Dao {
	private SqlSessionTemplate template;

	public SqlSessionTemplate getTemplate() {
		return template;
	}
	public void setTemplate(SqlSessionTemplate template) {
		this.template = template;
	}
	
	// 硫붿씤�뿉�꽌寃��깋
	public List<UsersVO> search(String keyword){
		return template.selectList("search", keyword);		
	}
	
	// �뙏濡쒖슦 由ъ뒪�듃 遺덈윭�삤湲�
	public List<FollowVO> getFollowList(String id){
		return template.selectList("follow", id);
	}
	
	// �븘�씠�뵒 二쇨퀬 寃뚯떆湲� 遺덈윭�삤湲�
	public List<BoardVO> getBooardList(String id){
		return template.selectList("board", id);
	}
	
	// 寃뚯떆湲� 醫뗭븘�슂 �긽�깭 �솗�씤�븯湲�
	public LikeVO likeState(String b_idx, String id){
		Map<String, String> map = new HashMap<>();
		map.put("b_idx", b_idx);
		map.put("id", id);
		LikeVO lvo = template.selectOne("likestate", map);
		return lvo;
	}
	
	// 醫뗭븘�슂 �궫�엯
	public void insertLike(String b_idx, String id){
		Map<String, String> map = new HashMap<>();
		map.put("b_idx", b_idx);
		map.put("id", id);
		template.insert("insertlike", map);
	}
	
	// 醫뗭븘�슂 �궘�젣
	public void deleteLike(String b_idx, String id){
		Map<String, String> map = new HashMap<>();
		map.put("b_idx", b_idx);
		map.put("id", id);
		template.delete("deletelike", map);
	}
	public List<BoardVO> searchHash(String keyword){
		return template.selectList("searchHash", keyword);
	}
	public int getHashCnt(String hashtag){
		return template.selectOne("hashCnt", hashtag);
	}
	
	public int likeCount(String b_idx){
		return template.selectOne("likecount", b_idx);		
	}
	
	public List<CommentVO> getComment(String b_idx){
		return template.selectList("commentlist", b_idx);
	}
	
	public void insertComment(String id,String b_idx, String c_content){
		Map<String, String> map = new HashMap<>();
		map.put("b_idx", b_idx);
		map.put("id", id);
		map.put("c_content", c_content);
		template.insert("insertcomment", map);
	}
	public List<BoardVO> getHashList(String keyword){
		return template.selectList("hashlist", keyword);

	}
	public void followState(String id, String followeeId){
		Map<String, String> map = new HashMap<>();
		map.put("followeeId", followeeId);
		map.put("id", id);
		
	}
	public int hashListCnt(String keyword){
		return template.selectOne("hashlistcnt",keyword);
	}
	public FollowVO followCheck(String id, String followeeId){
		Map<String, String> map = new HashMap<>();
		map.put("followeeId", followeeId);
		map.put("id", id);
		FollowVO result = template.selectOne("followCnt", map);
		return result;
	}
	public void insertFollow(String id, String followeeId){
		Map<String, String> map = new HashMap<>();
		map.put("followeeId", followeeId);
		map.put("id", id);
		template.insert("follow", map);
	}
	
}
