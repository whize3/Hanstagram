package spring.project.controller;

import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.ModelAndView;

import spring.project.db.BoardVO;
import spring.project.db.CommentVO;
import spring.project.db.Dao;
import spring.project.db.FollowVO;
import spring.project.db.LikeVO;
import spring.project.db.Page;
import spring.project.db.UsersVO;



//start
@org.springframework.stereotype.Controller
@SessionAttributes("login_vo")
public class Controller {
	private Dao dao;
	private Page page;
	
	public Dao getDao() { return dao; }
	public void setDao(Dao dao) { this.dao = dao; }
	public Page getPage() { return page; }
	public void setPage(Page page) { this.page = page; }
	
	@RequestMapping(value = "/search.do", produces = "text/plain;charset=UTF-8", method = RequestMethod.POST)
	public ResponseEntity<String> search(HttpServletRequest request, HttpServletResponse response){
		HttpHeaders responseHeaders = new HttpHeaders();
		responseHeaders.add("Content-Type", "text/html; charset=UTF-8");
		String keyword = request.getParameter("keyword");
		List<UsersVO> list = null;
		
		String result = "[";
		if(keyword !=null && keyword.trim()!= ""){
			list = dao.search(keyword);
		}
		
		int idx = 0;
		if(list!=null){	
			for (UsersVO k : list) {
				idx ++;
				result += "{";
				result += "\"keyword\" : \"" + k.getId() + "\"";
				result += "}";
				if(idx != list.size()){
					result += ",";
				}
			}
		}
		
		result += "]";
		return new ResponseEntity<String>(result,responseHeaders, HttpStatus.CREATED);
	}
	
	@RequestMapping("/newsfeed.do")
	public ModelAndView followingList(HttpServletRequest request, HttpServletResponse response){
		String id = "whoyoung"; // 하드코딩
		List<FollowVO> followlist = dao.getFollowList(id);
		List<BoardVO> boardlist = new ArrayList<>();
		List<CommentVO> commentlist = new ArrayList<>();
		
		//현재 시간 불러오기
		Calendar calendar = Calendar.getInstance();
		int c_year = calendar.get(Calendar.YEAR);
		int c_month = calendar.get(Calendar.MONTH);
		int c_date = calendar.get(Calendar.DATE);
		int c_hour = calendar.get(Calendar.HOUR);
		int c_minute = calendar.get(Calendar.MINUTE);
		
		//팔로우 리스트를 처음에 불러옴
		for (FollowVO f : followlist) {
			//팔로워들의 게시글을 불러옴
			List<BoardVO> onelist = dao.getBooardList(f.getFollowee());
			// 각 게시글 VO에 좋아요 정보와 시간정보를 넣음
			for (BoardVO boardVO : onelist) {
				//댓글 리스트 넣기
				List<CommentVO> onecommentlist = dao.getComment(boardVO.getB_idx());
				for (CommentVO k : onecommentlist) {
					commentlist.add(k);
				}
				//좋아요 상태 삽입
				LikeVO lvo = new LikeVO();
				lvo = dao.likeState(boardVO.getB_idx(), id);
				if(lvo != null){
					boardVO.setLike_state("1");
				}else{
					boardVO.setLike_state("0");
				}
				//시간정보 삽입				
				int b_year = Integer.parseInt((boardVO.getB_time().substring(0, 4)));
				int b_month = Integer.parseInt((boardVO.getB_time().substring(5, 7)));
				int b_date = Integer.parseInt((boardVO.getB_time().substring(8, 10)));
				int b_hour = Integer.parseInt((boardVO.getB_time().substring(11, 13)));
				int b_minute = Integer.parseInt((boardVO.getB_time().substring(14, 16)));
				if(c_year>b_year){
					boardVO.setB_time(c_year-b_year+"년");
				}else if(c_month>b_month){
					boardVO.setB_time(c_month-b_month+"개월");
				}else if(c_date>b_date){
					boardVO.setB_time(c_date-b_date+"일");
				}else if(c_hour>b_hour){
					boardVO.setB_time(c_hour-b_hour+"일");
				}else if(c_minute>b_minute){
					boardVO.setB_time(c_minute-b_minute+"분");
				}else{
					boardVO.setB_time("방금전");
				}
				
				//좋아요 갯수 삽입
				boardVO.setLike_count(String.valueOf(dao.likeCount(boardVO.getB_idx())));
				
				//전체 팔로우 게시글 리스트에 삽입
				boardlist.add(boardVO);
			}			
		}
		
		
		for (BoardVO b : boardlist) {
			b.getB_time();
		}
		ModelAndView mv = new ModelAndView();
		mv.addObject("boardlist", boardlist);
		mv.addObject("commentlist", commentlist);
		return mv;
	}
	
	@RequestMapping("/like.do")
	public ModelAndView like(HttpServletRequest request, HttpServletResponse response){
		String b_idx = request.getParameter("b_idx");
		String id = "whoyoung"; // 하드코딩
		LikeVO lvo = dao.likeState(b_idx, id);
		if(lvo !=null){
			dao.deleteLike(b_idx, id);
		}else{
			dao.insertLike(b_idx, id);
		}		
		ModelAndView mv = new ModelAndView("newsfeedgo");		
		return mv;
	}
	
/*	// 로그인
	@RequestMapping(value={"login/login.do","playerTest/login.do"})
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
	}*/
	
	
		
	
}
