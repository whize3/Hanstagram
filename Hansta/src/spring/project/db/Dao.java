package spring.project.db;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.ws.rs.core.Request;

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
		String b_idx = null;
		Map<String,String> map = new HashMap<>();
		List<BoardVO> boardvo = template.selectList("boardlist",id);
		for(BoardVO k : boardvo){
			b_idx = k.getB_idx();
			k.setLike_count(template.selectOne("likecnt",b_idx));
			map.put("b_idx", b_idx);
			map.put("id", id);
			k.setLike_state(template.selectOne("likestatechk",map));
		}
		return boardvo; 
	}
	public List<BoardVO> getBooardListMore(String id, int begin, int end){
		String b_idx = null;
		Map<String,String> map = new HashMap<>();
		Map<Object,Object> map2 = new HashMap<>();
		map2.put("id", id);
		map2.put("begin", begin);
		map2.put("end", end);
		List<BoardVO> boardvo = template.selectList("boardlistmore",map2);
		for(BoardVO k : boardvo){
			b_idx = k.getB_idx();
			k.setLike_count(template.selectOne("likecnt",b_idx));
			map.put("b_idx", b_idx);
			map.put("id", id);
			k.setLike_state(template.selectOne("likestatechk",map));
		}
		return boardvo; 
	}
	public int getBooardListcnt(String id){
		return template.selectOne("boardlistcnt",id);
		
	}
	public List<CommentVO> getCommentList(){
		List<CommentVO> commentvo = template.selectList("commentlist");
		return commentvo;
	}
	
	// 寃뚯떆湲� 醫뗭븘�슂 �긽�깭 �솗�씤�븯湲�
	public String likeState(String b_idx, String id){
		Map<String, String> map = new HashMap<>();
		map.put("b_idx", b_idx);
		map.put("id", id);
		String likestate = template.selectOne("likestatechk", map);
		return likestate;
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
	
	public String insertComment(String id,String b_idx, String c_content){
		Map<String, String> map = new HashMap<>();
		map.put("b_idx", b_idx);
		map.put("id", id);
		map.put("c_content", c_content);
		template.insert("insertcomment", map);
		return template.selectOne("commentone",map);
	}
	public void deletecomment(String c_idx){
		template.delete("deletecomment", c_idx);
	}
	
	public List<BoardVO> getHashList(String keyword){
		 String b_idx=null;
		 List<BoardVO> list = template.selectList("hashlist", keyword);
		 for(BoardVO k : list){
			 b_idx = k.getB_idx();
			 k.setLike_count(template.selectOne("hashlistcnt", b_idx));
		 }
		 return list;

	}
	public void followState(String id, String followeeId){
		Map<String, String> map = new HashMap<>();
		map.put("followeeId", followeeId);
		map.put("id", id);
		
	}
	public List<BoardVO> getHashBestList(String keyword){
		return template.selectList("hashbestlist",keyword);
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
	public UsersVO login(String id, String pwd){
		Map<String, String> map = new HashMap<>();
		map.put("id", id);
		map.put("pwd", pwd);
		UsersVO user = template.selectOne("login", map);
		return user;
	}
	public List<BoardVO> getTimeLine(String id){
		 String b_idx=null;
		 System.out.println(id);
		 List<BoardVO> list = template.selectList("timelinelist", id);
		 for(BoardVO k : list){
			 b_idx = k.getB_idx();
			 k.setLike_count(template.selectOne("hashlistcnt", b_idx));
			 k.setComment_count(template.selectOne("commentcount",b_idx));
		 }
		 return list;
	}
	public UsersVO getTimeUser(String id){
		return template.selectOne("timeuser", id);
	}
	public String getboardcount(String id){
		return template.selectOne("t_boardcount", id);
	}
	public List<FollowVO> getfollower_tl(String id){
		return template.selectList("follower_tl",id);
	}
	public List<FollowVO> getfollowee_tl(String id){
		return template.selectList("followee_tl",id);
	}
	public List<CommentVO> getTimeLineComment(String b_idx){
		return template.selectList("timelinecomment",b_idx);
	}
	
}
