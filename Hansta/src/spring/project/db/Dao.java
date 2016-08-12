package spring.project.db;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Repository
public class Dao {
	private SqlSessionTemplate template;

	public SqlSessionTemplate getTemplate() {
		return template;
	}
	public void setTemplate(SqlSessionTemplate template) {
		this.template = template;
	}
	
	/*// 메인에서검색
	public List<UsersVO> search(String keyword){
	// 硫붿씤�뿉�꽌寃��깋
	public List<UsersVO> search(String keyword){
      branch 'master' of https://github.com/whize3/Hanstagram.git
		return template.selectList("search", keyword);		
	}*/
	
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
		 String b_idx=null;
		 List<BoardVO> list = template.selectList("hashlist", keyword);
		 for(BoardVO k : list){
			 b_idx = k.getB_idx();
			 k.setLike_count(template.selectOne("hashlistcnt", b_idx));
		 }
		 return list;

	}
	public void followState(String id, String followeeId, String state){
		Map<String, String> map = new HashMap<>();
		map.put("followeeId", followeeId);
		map.put("id", id);
		map.put("state", state);
		template.update("folllowState",map);
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
		template.insert("followInsert", map);
	}
	public List<UsersVO> followList(String followerId, String followeeId, String flag){
		List<UsersVO> list = null;
		Map<String, String> map = new HashMap<>();
		map.put("followerId", followerId);
		map.put("followeeId", followeeId);
		
		List<String> flist = null;
		
		
		if(flag.equals("follower")){
			System.out.println("followerID : "+followerId);
			System.out.println("followeeID : "+followeeId);
			flist = template.selectList("getfollower", map);
		}else if(flag.equals("followee")){
			System.out.println("follee");
			flist = template.selectList("getfollowee", map);
		}
		if(list !=null ){
			for(String id:flist){
				list.add(template.selectOne("getfinfo", id));
			}
		}
		return list;
	}
	// 회원가입
		public void insertOne(UsersVO vo){
			template.insert("insertOne", vo);
		}
		// 유저 데이터 모두 가져오기
		public List<UsersVO> selectAll(){
			return template.selectList("selectAll");
		}
		// 유저 하나 읽어오기
		public UsersVO selectOne(UsersVO vo){
			return template.selectOne("selectOne", vo.getId());
		}
		

}
