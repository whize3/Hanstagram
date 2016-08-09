package spring.project.controller;

import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;
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
		for (FollowVO f : followlist) {
			List<BoardVO> onelist = dao.getBooardList(f.getFollowee());
			for (BoardVO b : onelist) {
				boardlist.add(b);
			}
		}
		Calendar calendar = Calendar.getInstance();
	
		for (BoardVO b : boardlist) {
			b.getB_time();
		}
		ModelAndView mv = new ModelAndView();
		mv.addObject("boardlist", boardlist);
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
		ModelAndView mv = new ModelAndView();		
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
					j--;
				}
			}
		}
		for(int i=0;i<hashlist.size();i++){
			for(int j=i+1;j<hashlist.size();j++){
				if(((String)hashlist.get(i)).length() > ((String)hashlist.get(j)).length()){					
					hashlist.add(hashlist.get(i));
					hashlist.remove(i);
					if(i>0){
						i--;
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
	
}
