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
	
	// 메인에서검색
	public List<UserVO> search(String keyword){
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
	// 로그인
		@RequestMapping("login/login.do")
		public ModelAndView login(UserVO vo) throws Exception{

			boolean flag = false;
			UserVO result = dao.selectOne(vo);
			
			
			if (result != null)
				if (result.getId().equals(vo.getId()) && result.getPwd().equals(vo.getPwd()))
					flag = true;

			ModelAndView mv;
			if (flag) {
				mv = new ModelAndView("login/login");
				mv.addObject("login_vo", result);
				session_id = result.getId();
				session_code = result.getUser_info_code();
			} else {
				mv = new ModelAndView("login/login_form");
				mv.addObject("result", "fail");
			}

			return mv;
		}

		// 회원가입 화면
		@RequestMapping("login/register_view.do")
		public ModelAndView register_view() {
			ModelAndView mv = new ModelAndView("login/user_register_user");
			List<UserVO> list = dao.selectAll();

			mv.addObject("list", list);
			return mv;
		}

		// 회원 가입
		@RequestMapping("login/register_ok.do")
		public ModelAndView register_ok(UserVO vo) {
			dao.insertOne(vo);
			return new ModelAndView("login/login_form");
		}

	
}
