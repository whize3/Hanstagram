package spring.project.controller;

import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;
import java.util.StringTokenizer;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

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

import hidden.org.codehaus.plexus.interpolation.util.StringUtils;
import spring.project.db.BoardVO;
import spring.project.db.CommentVO;
import spring.project.db.Dao;
import spring.project.db.FollowVO;
import spring.project.db.HashCountVO;
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
		List<BoardVO> listb = null;
		String keyword_h = "#"+request.getParameter("keyword");
		String result = "[";
		if(keyword !=null && keyword.trim()!= ""){
			list = dao.search(keyword);
			listb = dao.searchHash(keyword_h);
		}
		List hashlist = new ArrayList();
		String content = null;
		for(BoardVO k : listb){
			content = k.getB_content();
			 Pattern p = Pattern.compile("\\#([0-9a-zA-Z가-힣]*)");
			    Matcher m = p.matcher(content);
			    String extractHashTag = null;
			while(m.find()) {
				
			    extractHashTag = sepcialCharacter_replace(m.group());
			 
			    if(extractHashTag != null) {
			    	if(extractHashTag.length()>=keyword_h.length())
			    		if(extractHashTag.substring(0,keyword_h.length()).equals(keyword_h))
			    	hashlist.add(extractHashTag);
			    }
			    }
			
		}
		for(int i=hashlist.size()-1;i>0;i--){
			for(int j=i-1;j>=0;j--){
				if(hashlist.get(i).equals(hashlist.get(j))){
					hashlist.remove(j);
					i--;
				}
			}
		}
		for(int i=0;i<hashlist.size();i++){
			for(int j=i+1;j<hashlist.size();j++){
				if(((String)hashlist.get(i)).length() > ((String)hashlist.get(j)).length()){					
					hashlist.add(hashlist.get(i));
					hashlist.remove(i);
					if(i>0){
						i=0;
						j=i+1;
					}
				}
			}
		}
		List hashcnt = new ArrayList();
		int cnt;
		for(int i=0;i<hashlist.size();i++){
				cnt = dao.getHashCnt((String)hashlist.get(i));
				if(cnt<5){
					hashlist.remove(i);
					i--;
				}else{
					hashcnt.add(cnt);
				}
		}
		if(hashlist.size()>0){
			for (int i=0;i<hashlist.size();i++) {
				result += "{";
				result += "\"keyword\" : \"" + hashlist.get(i) + "\"";
				result += ",\"hashcnt\" : \"" + hashcnt.get(i) + "\"";
				result += "}";
				if(i != hashlist.size()-1){
					result += ",";
				}
				
			}
		}
		if(list.size()>0 && hashlist.size()>0){
			result += ",";
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
		String id = "whoyoung"; // �븯�뱶肄붾뵫
		List<FollowVO> followlist = dao.getFollowList(id);
		List<BoardVO> boardlist = new ArrayList<>();
		List<CommentVO> commentlist = new ArrayList<>();
		
		//�쁽�옱 �떆媛� 遺덈윭�삤湲�
		Calendar calendar = Calendar.getInstance();
		int c_year = calendar.get(Calendar.YEAR);
		int c_month = calendar.get(Calendar.MONTH);
		int c_date = calendar.get(Calendar.DATE);
		int c_hour = calendar.get(Calendar.HOUR);
		int c_minute = calendar.get(Calendar.MINUTE);
		
		//�뙏濡쒖슦 由ъ뒪�듃瑜� 泥섏쓬�뿉 遺덈윭�샂
		for (FollowVO f : followlist) {
			//�뙏濡쒖썙�뱾�쓽 寃뚯떆湲��쓣 遺덈윭�샂
			List<BoardVO> onelist = dao.getBooardList(f.getFollowee());
			// 媛� 寃뚯떆湲� VO�뿉 醫뗭븘�슂 �젙蹂댁� �떆媛꾩젙蹂대�� �꽔�쓬
			for (BoardVO boardVO : onelist) {
				//�뙎湲� 由ъ뒪�듃 �꽔湲�
				List<CommentVO> onecommentlist = dao.getComment(boardVO.getB_idx());
				for (CommentVO k : onecommentlist) {
					commentlist.add(k);
				}
				//醫뗭븘�슂 �긽�깭 �궫�엯
				LikeVO lvo = new LikeVO();
				lvo = dao.likeState(boardVO.getB_idx(), id);
				if(lvo != null){
					boardVO.setLike_state("1");
				}else{
					boardVO.setLike_state("0");
				}
				//�떆媛꾩젙蹂� �궫�엯				
				int b_year = Integer.parseInt((boardVO.getB_time().substring(0, 4)));
				int b_month = Integer.parseInt((boardVO.getB_time().substring(5, 7)));
				int b_date = Integer.parseInt((boardVO.getB_time().substring(8, 10)));
				int b_hour = Integer.parseInt((boardVO.getB_time().substring(11, 13)));
				int b_minute = Integer.parseInt((boardVO.getB_time().substring(14, 16)));
				if(c_year>b_year){
					boardVO.setB_time(c_year-b_year+"�뀈");
				}else if(c_month>b_month){
					boardVO.setB_time(c_month-b_month+"媛쒖썡");
				}else if(c_date>b_date){
					boardVO.setB_time(c_date-b_date+"�씪");
				}else if(c_hour>b_hour){
					boardVO.setB_time(c_hour-b_hour+"�씪");
				}else if(c_minute>b_minute){
					boardVO.setB_time(c_minute-b_minute+"遺�");
				}else{
					boardVO.setB_time("諛⑷툑�쟾");
				}
				
				//醫뗭븘�슂 媛��닔 �궫�엯
				boardVO.setLike_count(String.valueOf(dao.likeCount(boardVO.getB_idx())));
				
				//�쟾泥� �뙏濡쒖슦 寃뚯떆湲� 由ъ뒪�듃�뿉 �궫�엯
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
		String id = "whoyoung"; // �븯�뱶肄붾뵫
		LikeVO lvo = dao.likeState(b_idx, id);
		if(lvo !=null){
			dao.deleteLike(b_idx, id);
		}else{
			dao.insertLike(b_idx, id);
		}		
		ModelAndView mv = new ModelAndView("newsfeed");		
		return mv;
	}
	
	@RequestMapping("/commentwrite.do")
	public ModelAndView commentWrite(HttpServletRequest request, HttpServletResponse response){
		String id = "whoyoung"; // 濡쒓렇�씤留뚮뱾�뼱二쇱꽭�슂 
		String b_idx = request.getParameter("b_idx");		
		String c_content = request.getParameter("c_content");
		dao.insertComment(id,b_idx,c_content);
		ModelAndView mv = new ModelAndView("newsfeed");
		mv.addObject(id);
		return mv;
	}
	@RequestMapping("/hashlist.do")
	public ModelAndView hashList(HttpServletRequest request, HttpServletResponse response){
		ModelAndView mv = new ModelAndView("HashResult");
		String keyword = "#"+request.getParameter("keyword")+" ";
//		StringTokenizer tokens = new StringTokenizer(keyword," ");
//		for(int x = 1; x<2; x++ ){
//			keyword = tokens.nextToken();
//			}
		List<BoardVO> list = null;
		List<BoardVO> list_b = null;
		int hashcnt = dao.hashListCnt(keyword);
		list_b = dao.getHashBestList(keyword);
		list = dao.getHashList(keyword);
		mv.addObject("hashcnt",hashcnt);
		mv.addObject("list_b", list_b);
		mv.addObject("list", list);
		return mv;
	}
/*	// 로그인
	
/*	// 濡쒓렇�씤
>>>>>>> branch 'master' of https://github.com/whize3/Hanstagram.git
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
	@RequestMapping(value = "/searchhash.do", produces = "text/plain;charset=UTF-8", method = RequestMethod.POST)
	public ResponseEntity<String> searchhash(HttpServletRequest request, HttpServletResponse response){
		HttpHeaders responseHeaders = new HttpHeaders();
		responseHeaders.add("Content-Type", "text/html; charset=UTF-8");
		String keyword = request.getParameter("keyword");
		List<BoardVO> list = null;
		
		String result = "[";
		if(keyword !=null && keyword.trim()!= ""){
			list = dao.searchHash(keyword);
		}
		List hashlist = new ArrayList();
		String content = null;
		for(BoardVO k : list){
			content = k.getB_content();
			 Pattern p = Pattern.compile("\\#([0-9a-zA-Z가-힣]*)");
			    Matcher m = p.matcher(content);
			    String extractHashTag = null;
			while(m.find()) {
				
			    extractHashTag = sepcialCharacter_replace(m.group());
			 
			    if(extractHashTag != null) {
			    	if(extractHashTag.length()>=keyword.length())
			    		if(extractHashTag.substring(0,keyword.length()).equals(keyword))
			    	hashlist.add(extractHashTag);
			    }
			    }
			
		}
		for(int i=hashlist.size()-1;i>0;i--){
			for(int j=i-1;j>=0;j--){
				if(hashlist.get(i).equals(hashlist.get(j))){
					hashlist.remove(j);
					i--;
				}
			}
		}
		for(int i=0;i<hashlist.size();i++){
			for(int j=i+1;j<hashlist.size();j++){
				if(((String)hashlist.get(i)).length() > ((String)hashlist.get(j)).length()){					
					hashlist.add(hashlist.get(i));
					hashlist.remove(i);
					if(i>0){
						i=0;
						j=i+1;
					}
				}
			}
		}
		
		List hashcnt = new ArrayList();
		for(int i=0;i<hashlist.size();i++){
				hashcnt.add(dao.getHashCnt((String)hashlist.get(i)));
		}
		
		if(hashlist.size()>0){
			for (int i=0;i<hashlist.size();i++) {
				result += "{";
				result += "\"keyword\" : \"" + hashlist.get(i) + "\"";
				result += ",\"hashcnt\" : \"" + hashcnt.get(i) + "\"";
				result += "}";
				if(i != hashlist.size()-1){
					result += ",";
				}
			}
		}
		
		result += "]";
		return new ResponseEntity<String>(result,responseHeaders, HttpStatus.CREATED);
	}
	
	public String sepcialCharacter_replace(String str) {
	    str = StringUtils.replace(str, "-_+=!@#$%^&*()[]{}|\\;:'\"<>,.?/~`） ","");
	 
	    if(str.length() < 1) {
	    return null;
	    }
	 
	    return str;
	}
	
	
	@RequestMapping("/follow.do")
	public ModelAndView follow(HttpServletRequest request, HttpServletResponse response){
		String id = "heehyuneee";
		String followeeId = "aaaa";
		FollowVO result = dao.followCheck(id, followeeId);
		if(result == null){
			dao.insertFollow(id, followeeId);
		}else{
			dao.followState(id, followeeId,"0");
		}
		
		ModelAndView mv = new ModelAndView("timeLine");

		return mv;
	}
	
	@RequestMapping("/unfollow.do")
	public ModelAndView unfollow(HttpServletRequest request, HttpServletResponse response){
		String id = "heehyuneee";
		String followeeId = "aaaa";
		dao.followState(id, followeeId,"10");
		
		ModelAndView mv = new ModelAndView("timeLine");
		
		return mv;
	}
	
	@RequestMapping("/followerList.do")
	public ModelAndView followerList(HttpServletRequest request, HttpServletResponse response){
		System.out.println("followerList.do");
		
		String followerId = request.getParameter("follower");
		System.out.println("followerId : "+followerId);
		String followeeId = request.getParameter("followee");
		String flag = request.getParameter("flag");
		dao.followList(followerId, followeeId, flag);
		
		ModelAndView mv = new ModelAndView("timeLine");
		
		return mv;
	}
	
	
}
