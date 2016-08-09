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
	
	// 메인에서검색
	public List<UsersVO> search(String keyword){
		return template.selectList("search", keyword);		
	}
	
	// 팔로우 리스트 불러오기
	public List<FollowVO> getFollowList(String id){
		return template.selectList("follow", id);
	}
	
	// 아이디 주고 게시글 불러오기
	public List<BoardVO> getBooardList(String id){
		return template.selectList("board", id);
	}
	
	// 게시글 좋아요 상태 확인하기
	public LikeVO likeState(String b_idx, String id){
		Map<String, String> map = new HashMap<>();
		map.put("b_idx", b_idx);
		map.put("id", id);
		LikeVO lvo = template.selectOne("likestate", map);
		return lvo;
	}
	
	// 좋아요 삽입
	public void insertLike(String b_idx, String id){
		Map<String, String> map = new HashMap<>();
		map.put("b_idx", b_idx);
		map.put("id", id);
		template.insert("insertlike", map);
	}
	
	// 좋아요 삭제
	public void deleteLike(String b_idx, String id){
		Map<String, String> map = new HashMap<>();
		map.put("b_idx", b_idx);
		map.put("id", id);
		template.delete("deletelike", map);
	}
	
}
