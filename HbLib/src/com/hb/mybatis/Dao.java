package com.hb.mybatis;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

public class Dao {
	private static SqlSession ss;

	
	public Dao() {
		ss = DBService.getFactory().openSession(true);
	}

	// �룄�꽌 �옄猷뚭뎄�엯�슂泥� 諛쏆� �뜲�씠�꽣 BOOKAPPLY�뿉 �궫�엯
	public void bookApply(Book_ApplyVO bavo){
		ss.insert("apply", bavo);
		ss.close();
	}
	
	// 濡쒓렇�씤
	public UsersVO login(String id, String pwd){
		UsersVO user = new UsersVO();
		user.setId(id);
		user.setPwd(pwd);
		UsersVO result = ss.selectOne("login", user);
		UsersVO book = ss.selectOne("loginbook", user);
		result.setDraw(book.getDraw());
		result.setReserve(book.getReserve());
		result.setOverdue(book.getOverdue());
		ss.close();
		return result;
	}

	// 도서검색
	public List<BookVO> search(String booksearch, String keyword , String desearch) {
		Map<String, String> map = new HashMap<>();
		map.put("booksearch", booksearch);
		map.put("keyword",keyword);
		map.put("desearch", desearch);
		List<BookVO> list = ss.selectList("booklist",map);
		ss.close();
		return list;
	}
	// 도서상세
	public BookVO detisearch (String b_num){
		BookVO bookvo = new BookVO();
		bookvo =ss.selectOne("deti", b_num);
		System.out.println(bookvo.getB_num());
		System.out.println(bookvo.getB_location());
		ss.close();
		return bookvo;
	}
	// 인기도서
	public List<Book_rankVO> ranking(){
		List<Book_rankVO> list = ss.selectList("ranking");
		System.out.println(list.size());
		ss.close();
		return list;
	}

	public List<MyDrawVO> getMyDraw(String id){
		List<MyDrawVO> list = ss.selectList("getmydraw",id);
		ss.close();
		return list;
	}
	public List<MyDrawVO> getMyReserve(String id){
		List<MyDrawVO> list = ss.selectList("getmyreserve",id);
		MyDrawVO myDrawVO = new MyDrawVO();
		String result=null;
		for(MyDrawVO k : list){
			result = ss.selectOne("getmyreserve_cnt",k.getB_num());
			if(result.equals("0")){
				k.setBd_date("반납도서");
			}else{
				myDrawVO = ss.selectOne("getmyreserve_chk",k.getB_num());
				k.setBd_date(myDrawVO.getBd_date().substring(0,10));
			}
		}
		ss.close();
		return list;
	}
	public List<MyDrawVO> getMyHistory(Map<Object, Object> map){
		List<MyDrawVO> list = ss.selectList("getmyhistory",map);
		ss.close();
		return list;
	}
	public List<MyDrawVO> getMyComment(String id){
		List<MyDrawVO> list = ss.selectList("getmycomment",id);
		return list;
	}
	public UsersVO getMyInfo(String id){
		UsersVO list = ss.selectOne("getmyinfo",id);
		ss.close();
		return list;
	}
	public String getMyCommentCnt(String id){
		String bc_cnt = ss.selectOne("getmycommentcnt",id);
		ss.close();
		return bc_cnt;
	}
	public void getMyInfoUpdate(Map<String,String> map){
		ss.update("getmyinfoupdate",map);
		ss.close();
	}
	
	public String getJoinCheckId(String id){
		  String result = "사용가능";
		  List<UsersVO> list = ss.selectList("getjoincheckid",id);
		  if(list.size()>0){
			  result = "중복된 아이디";
		  }
		  ss.close();
		  return result;
		}
	public void UsersJoin(UsersVO usersVO){
		try {
			ss.insert("usersjoin",usersVO);
			ss.close();
		} catch (Exception e) {
			// TODO: handle exception
		}finally{
			
		}

		
	}
	
	// 로그인
	public AdminVO getAdminList(AdminVO avo){
		AdminVO adminVo = ss.selectOne("adminLogin",avo);
		ss.close();
		return adminVo;
	}
	
	// member 전체 게시물의 수
	public int memberTotalCount(){
		int count = ss.selectOne("a_memberTotalCount");
		
		return count;
	}
	
	// member paging 목록
	public List<UsersVO> getMemberList(Map<String, Integer> map){
		List<UsersVO> list = ss.selectList("a_memberlist",map);
		/*ss.close();*/
		return list;
	}
	
	// member 정보
	public UsersVO getMemberOnelist(String id){
		UsersVO uvo2 = ss.selectOne("a_memberonelist",id);
		return uvo2;
	}
	
	// member 대출 현황 정보
	public List<Book_DrawVO> getBookDraw(String id){
		List<Book_DrawVO> list = ss.selectList("a_bookMemberList",id);
		ss.close();
		return list;
	}
	
	// book count
	public int bookTotalCount(){
		int count = ss.selectOne("a_bookListCount");
		ss.close();
		return count;
	}
	
	// book list
	public List<BookVO> getBookList(Map<String, Integer> map){
		List<BookVO> list = ss.selectList("a_booklist",map);
		ss.close();
		return list;
	}
	
	// book 추가
	public void getBookAdd(BookVO bvo){
		ss.insert("a_bookAdd",bvo);
		ss.commit();
	}
	
	// notice 전체 게시물의 수
	public int noticeTotalCount(){
		int count = ss.selectOne("a_noticeListCount");
		
		return count;
	}
	
	// notice 리스트
	public List<NoticeVO> getNoticeList(Map<String, Integer> map){
		List<NoticeVO> list = ss.selectList("a_noticeList",map);
		
		return list;
	}
	
	// notice 글쓰기
	public void getNoticeAdd(NoticeVO nvo){
		ss.insert("a_noticeAdd", nvo);
		ss.commit();
	}
	
	// 도서구입신청현황 리스트
	public List<Book_ApplyVO> getBookApply(String id){
		return ss.selectList("applylist", id);
	}

	public int historytotalCount(String id){
		int count = ss.selectOne("historytotalCount" , id);
		
		return count ;
	}
	public List<YulVO> getYul(){
		List<YulVO> yulvo = ss.selectList("yul");
		ss.close();
		return yulvo;}

	
	// 아이디찾기
	
	public UsersVO forgotId(UsersVO input){
		return ss.selectOne("forgotid", input);
	}
	// 비밀번호 찾기
	public UsersVO forgotPwd(UsersVO input){
		return ss.selectOne("forgotpwd", input);

	}
	// 메인에서 공지사항 리스트 가져오기
	
	public List<NoticeVO> getNoticeList(){
		List<NoticeVO> list = ss.selectList("noticelist");
		return list;
	}
	// 공지사항 한 개 가져오기
	public NoticeVO getOneNotice(String n_idx){
		NoticeVO nvo = ss.selectOne("onenotice", n_idx);
		
		return nvo;
	}
	// 공지사항 히트 수 업데이트
	public void noticeHit(String n_idx){
		ss.update("noticehit", n_idx);
	}
	
	// Qna 전체 게시물의 수
		public int qnaTotalCount(){
			int count = ss.selectOne("qnalistcount");
			
			return count;
		}
		
	// QNA 리스트
		public List<QnaVO> getQnaList(Map<String, Integer> map){
			List<QnaVO> list = ss.selectList("qnalist",map);
			return list;
		}
		// QNA 한 개 가져오기
		public QnaVO getOneQna(String q_idx){
			QnaVO qvo = ss.selectOne("oneqna", q_idx);
			return qvo;
		}		

}

	
	

