package spring.project.controller;

import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.StringTokenizer;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.websocket.Session;

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
import spring.project.db.Page_more;
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
		HttpSession session = request.getSession();
		UsersVO user = (UsersVO)session.getAttribute("user");
		String id = user.getId();
		List<BoardVO> boardvo = dao.getBooardList(id);
		List<CommentVO> commentvo = dao.getCommentList();
		ModelAndView mv = new ModelAndView("newsfeed");
		mv.addObject("boardvo", boardvo);
		mv.addObject("commentvo", commentvo);
		return mv;
	}

	@RequestMapping(value = "/like.do", produces = "text/plain;charset=UTF-8", method = RequestMethod.POST)
	public ResponseEntity<String> like(HttpServletRequest request, HttpServletResponse response){
		HttpHeaders responseHeaders = new HttpHeaders();
		responseHeaders.add("Content-Type", "text/html; charset=UTF-8");
		String b_idx = request.getParameter("b_idx");
		String id = request.getParameter("id");
		String likestate = dao.likeState(b_idx, id);
		String chk = null;
		if(likestate.equals("1")){
			dao.deleteLike(b_idx, id);
			chk = "삭제";
		}else{
			dao.insertLike(b_idx, id);
			chk = "삽입";
		}
		String result = "[";
		result += "{";
		result += "\"chk\" : \"" + chk + "\"";
		result += "}";
		result += "]";
		return new ResponseEntity<String>(result,responseHeaders, HttpStatus.CREATED);
	}
	@RequestMapping(value = "/commentwrite.do", produces = "text/plain;charset=UTF-8", method = RequestMethod.POST)
	public ResponseEntity<String> commentwrite(HttpServletRequest request, HttpServletResponse response){
		HttpHeaders responseHeaders = new HttpHeaders();
		responseHeaders.add("Content-Type", "text/html; charset=UTF-8");
		HttpSession session = request.getSession();
		UsersVO user = (UsersVO)session.getAttribute("user");
		String id = user.getId();
		String b_idx = request.getParameter("b_idx");		
		String c_content = request.getParameter("c_content");
		String c_idx = dao.insertComment(id,b_idx,c_content);
		String result = "[";
		result += "{";
		result += "\"c_idx\" : \"" + c_idx + "\"";
		result += "}";
		result += "]";
		return new ResponseEntity<String>(result,responseHeaders, HttpStatus.CREATED);
	}
	@RequestMapping("/hashlist.do")
	public ModelAndView hashList(HttpServletRequest request, HttpServletResponse response){
		ModelAndView mv = new ModelAndView("HashResult");
		String keyword = "#"+request.getParameter("keyword");
		//		StringTokenizer tokens = new StringTokenizer(keyword," ");
		//		for(int x = 1; x<2; x++ ){
		//			keyword = tokens.nextToken();
		//			}
		List<BoardVO> list = null;
		List<BoardVO> list_b = null;
		list_b = dao.getHashBestList(keyword);
		list = dao.getHashList(keyword);
		mv.addObject("list_b", list_b);
		mv.addObject("list", list);
		return mv;
	}
	@RequestMapping("/deletecomment.do")
	public ModelAndView deletecomment(HttpServletRequest request, HttpServletResponse response){
		ModelAndView mv = new ModelAndView("newsfeed");
		String c_idx = request.getParameter("c_idx");
		dao.deletecomment(c_idx);
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

		int k=0;
		int h=0;
		while(k<hashlist.size()){
			outer:for(k=0;k<hashlist.size();k++){
				for(h=k+1;h<hashlist.size();h++){
					if(((String)hashlist.get(k)).length() > ((String)hashlist.get(h)).length()){
						hashlist.add(hashlist.get(k));
						hashlist.remove(k);
						break outer;
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
		HttpSession session = request.getSession();
		UsersVO user = (UsersVO)session.getAttribute("user");
		String id = user.getId();
		String followeeId = request.getParameter("followeeId");
		System.out.println(id+"/"+followeeId);
		
		FollowVO result = dao.followCheck(id, followeeId);

		if(result == null){
			dao.insertFollow(id, followeeId);
		}else{
			dao.followState(id, followeeId, "0");
		}		
		System.out.println(followeeId+" follow.do");
		ModelAndView mv = new ModelAndView("timelineGo");
		mv.addObject("fid", followeeId);		
		return mv;
	}
	
	   @RequestMapping("/unfollow.do")
	   public ModelAndView unfollow(HttpServletRequest request, HttpServletResponse response){
		   HttpSession session = request.getSession();
			UsersVO user = (UsersVO)session.getAttribute("user");
			String id = user.getId();
			String followeeId = request.getParameter("followeeId");
			System.out.println(followeeId);
	      dao.followState(id, followeeId,"10");
	      
	      ModelAndView mv = new ModelAndView("timelineGo");
	      mv.addObject("id", followeeId);
	      return mv;
	   }
	
	@RequestMapping("/loginok.do")
	public ModelAndView loginok(HttpServletRequest request, HttpServletResponse response){
		String id = request.getParameter("id");
		UsersVO user = new UsersVO();
		user.setId(id);
		ModelAndView mv = new ModelAndView("newsfeedgo");
		HttpSession session = request.getSession();
		session.setAttribute("user", user);
		return mv;
	}

	@RequestMapping(value = "/login.do", produces = "text/plain;charset=UTF-8", method = RequestMethod.POST)
	public ResponseEntity<String> login(HttpServletRequest request, HttpServletResponse response){
		HttpHeaders responseHeaders = new HttpHeaders();
		responseHeaders.add("Content-Type", "text/html; charset=UTF-8");
		String id = request.getParameter("id");
		String pwd = request.getParameter("pwd");
		UsersVO user = dao.login(id,pwd);
		String result = "[";
		result += "{";
		result += "\"id\" : \"" + user.getId() + "\"";
		result += "}";
		result += "]";
		return new ResponseEntity<String>(result,responseHeaders, HttpStatus.CREATED);

	}

	@RequestMapping("/timeline.do")
	public ModelAndView timeline(HttpServletRequest request, HttpServletResponse response){
		String id = request.getParameter("id");

		HttpSession session = request.getSession();
		UsersVO user = (UsersVO)session.getAttribute("user");
		String myid = user.getId();
		
		ModelAndView mv = new ModelAndView("timeLine");
		List<BoardVO> boardvo = dao.getTimeLine(id);
		UsersVO usersvo = dao.getTimeUser(id);
		String boardcount = dao.getboardcount(id);
		List<UsersVO> followervo = dao.getfollower_tl(id);
		List<UsersVO> followeevo = dao.getfollowee_tl(id);
		List<UsersVO> myfollowList = dao.getfollowee_tl(myid);
		mv.addObject("boardvo",boardvo);
		mv.addObject("usersvo",usersvo);
		mv.addObject("boardcount",boardcount);
		mv.addObject("followervo",followervo);
		mv.addObject("followeevo",followeevo);
		mv.addObject("myfollowList",myfollowList);
		return mv;
	}
	@RequestMapping(value = "/timelinecomment.do", produces = "text/plain;charset=UTF-8", method = RequestMethod.POST)
	public ResponseEntity<String> timelinecomment(HttpServletRequest request, HttpServletResponse response){
		HttpHeaders responseHeaders = new HttpHeaders();
		responseHeaders.add("Content-Type", "text/html; charset=UTF-8");
		String b_idx = request.getParameter("b_idx");
		List<CommentVO> commentvo = dao.getTimeLineComment(b_idx);
		String result = "[";
		int idx=0;
		for(CommentVO k : commentvo){
			idx++;
			result += "{";
			result += "\"id\" : \"" + k.getId() + "\",";
			result += "\"c_idx\" : \"" + k.getC_idx() + "\",";
			result += "\"c_content\" : \"" + k.getC_content() + "\"";
			result += "}";
			if(idx != commentvo.size()){
				result += ",";
			}
		}

		result += "]";
		return new ResponseEntity<String>(result,responseHeaders, HttpStatus.CREATED);

	}

	//	@RequestMapping("/newsfeedmore.do")
	//	public ModelAndView newsfeedmore(HttpServletRequest request, HttpServletResponse response){
	//		System.out.println("1111");
	//		HttpSession session = request.getSession();
	//		UsersVO user = (UsersVO)session.getAttribute("user");
	//		String id = user.getId();
	//		List<CommentVO> commentvo = dao.getCommentList();
	//		ModelAndView mv = new ModelAndView("newsfeed");
	//		mv.addObject("commentvo", commentvo);
	//		
	//		Page_more pvo = new Page_more();
	//		String cPage = request.getParameter("cPage");
	//		System.out.println(cPage);
	//		if(cPage != null){
	//			pvo.setNowPage(Integer.parseInt(cPage));
	//		}
	//		System.out.println("2222");
	//		// 전체 게시물의 수
	//		pvo.setTotalRecord(dao.getBooardListcnt(id));
	//		pvo.setTotalPage();
	//		System.out.println("3333");
	//		//  begin과 end 구하기
	//		// begin = (nowPage-1) * numPerPage + 1;
	//		// end = (begin - 1) + numPerPage;
	//		pvo.setBegin((pvo.getNowPage()-1)*pvo.getNumPerPage()+1);
	//		pvo.setEnd((pvo.getBegin()-1)+pvo.getNumPerPage());
	//		
	//		Map<Object, Object> map = new HashMap<>();
	//		int begin = pvo.getBegin();
	//		int end = pvo.getEnd();
	//		
	//		List<BoardVO> boardvo = dao.getBooardListMore(id,begin,end);
	//		for(BoardVO k : boardvo){
	//			System.out.println(k.getB_idx());
	//		}
	//		mv.addObject("boardvo3",boardvo);
	//		request.setAttribute("boardvo2", boardvo);
	//		
	//		
	//		 pvo.setBeginPage((int)((pvo.getNowPage()-1)/pvo.getPagePerBlock())*pvo.getPagePerBlock()+1);
	//		 pvo.setEndPage(pvo.getBeginPage() + pvo.getPagePerBlock()-1);
	//		 
	//		 if(pvo.getEndPage() > pvo.getTotalPage()){
	//			pvo.setEndPage(pvo.getTotalPage());
	//		}
	//		 System.out.println("4444");
	//		 return mv;
	//	}
	//	@RequestMapping(value = "/newsfeedmore2.do", produces = "text/plain;charset=UTF-8", method = RequestMethod.POST)
	//	public ResponseEntity<String> newsfeedmore2(HttpServletRequest request, HttpServletResponse response){
	//		HttpHeaders responseHeaders = new HttpHeaders();
	//		responseHeaders.add("Content-Type", "text/html; charset=UTF-8");
	//		System.out.println("1111");
	//		HttpSession session = request.getSession();
	//		UsersVO user = (UsersVO)session.getAttribute("user");
	//		String id = user.getId();
	//		
	//		Page_more pvo = new Page_more();
	//		String cPage = request.getParameter("cPage");
	//		System.out.println(cPage);
	//		if(cPage != null){
	//			pvo.setNowPage(Integer.parseInt(cPage));
	//		}
	//		System.out.println("2222");
	//		// 전체 게시물의 수
	//		pvo.setTotalRecord(dao.getBooardListcnt(id));
	//		pvo.setTotalPage();
	//		System.out.println("3333");
	//		//  begin과 end 구하기
	//		// begin = (nowPage-1) * numPerPage + 1;
	//		// end = (begin - 1) + numPerPage;
	//		pvo.setBegin((pvo.getNowPage()-1)*pvo.getNumPerPage()+1);
	//		pvo.setEnd((pvo.getBegin()-1)+pvo.getNumPerPage());
	//		
	//		Map<Object, Object> map = new HashMap<>();
	//		int begin = pvo.getBegin();
	//		int end = pvo.getEnd();
	//		
	//		List<BoardVO> boardvo2 = dao.getBooardListMore(id,begin,end);
	//		for(BoardVO k : boardvo2){
	//			System.out.println(k.getB_idx());
	//		}
	//		
	//		 pvo.setBeginPage((int)((pvo.getNowPage()-1)/pvo.getPagePerBlock())*pvo.getPagePerBlock()+1);
	//		 pvo.setEndPage(pvo.getBeginPage() + pvo.getPagePerBlock()-1);
	//		 
	//		 if(pvo.getEndPage() > pvo.getTotalPage()){
	//			pvo.setEndPage(pvo.getTotalPage());
	//		}
	//		 System.out.println("4444");
	//		 int idx=0;
	//		 String content= null;
	//			String result = "[";
	//			for(BoardVO k : boardvo2){
	//				content = k.getB_content();
	//				System.out.println(k.getB_content());
	//				content = content.replace("\n","</br>"); 
	//				System.out.println(content);
	//				idx++;
	//			result += "{";
	//			result += "\"b_idx\" : \"" + k.getB_idx() + "\",";
	//			result += "\"id\" : \"" + k.getId() + "\",";
	//			result += "\"b_time\" : \"" + k.getB_time() + "\",";
	//			result += "\"img_url\" : \"" + k.getImg_url() + "\",";
	//			result += "\"b_content\" : \"" + content + "\",";
	//			result += "\"like_state\" : \"" + k.getLike_state() + "\",";
	//			result += "\"like_count\" : \"" + k.getLike_count() + "\",";
	//			result += "\"r_num\" : \"" + k.getR_num() + "\"";
	//			result += "}";
	//			if(idx != boardvo2.size()){
	//				result += ",";
	//			}
	//			}
	//			result += "]";
	//
	//			session.setAttribute("boardvo2", boardvo2);
	//		 return new ResponseEntity<String>(result,responseHeaders, HttpStatus.CREATED);
	//	}
}
