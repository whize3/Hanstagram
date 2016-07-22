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
	public List<BookVO> search(String idx, String keyword ,String desearch) {
		Map<String, String> map = new HashMap<>();
		map.put("idx", idx);
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
		return bookvo;
	}
	// 인기도서
	public List<Book_rankVO> ranking(){
		List<Book_rankVO> list = ss.selectList("ranking");
		ss.close();
		return list;
	}
	
	// 신규도서
	public List<BookVO> getNewBook(){
		List<BookVO> list = ss.selectList("newbook");
		for (BookVO k : list) {
			String b_num = k.getB_num();
			k.setB_state("0");
			int draw = ss.selectOne("newbookstate1", b_num);
			if(draw>0){
				k.setB_state("1");
			}
			int reserve = ss.selectOne("newbookstate2", b_num);
			if(reserve>0){
				k.setB_state("2");
			}
				
		}
		return list;
	}

	public List<MyDrawVO> getMyDraw(String id){
		List<MyDrawVO> list = ss.selectList("getmydraw",id);
		System.out.println(list);
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
	
	// member search
	public List<UsersVO> getMemberSearch(Map<String, String> map){
		return ss.selectList("a_memberSearch",map);
	}
	
	// member 대출 현황 정보
	public List<BookDraw_memberVO> getBookDraw(String id){
		List<BookDraw_memberVO> list = ss.selectList("a_bookMemberList",id);
		return list;
	}
	
	// member 예약 현황
	public List<BookDraw_memberVO> getBookReserve(String id){
		List<BookDraw_memberVO> reserveList = ss.selectList("a_bookReserve",id);
		BookDraw_memberVO bdMemberVO = new BookDraw_memberVO();
		String result = null;
		for(BookDraw_memberVO k : reserveList){
			result = ss.selectOne("a_bookReserve_cnt",k.getB_num());
			if(result.equals("0")){
				k.setBd_date("반납도서");
			}else{
				bdMemberVO = ss.selectOne("a_bookReserve_chk",k.getB_num());
				k.setBd_date(bdMemberVO.getBd_date().substring(0,10));
			}
		}
		return reserveList;
	}
	
	// book count
	public int bookTotalCount(){
		int count = ss.selectOne("a_bookListCount");
		return count;
	}
	
	// book list
	public List<BookVO> getBookList(Map<String, Integer> map){
		List<BookVO> list = ss.selectList("a_booklist",map);
		return list;
	}
	
	// book 추가
	/*public void getBookAdd(BookVO bvo){
		ss.insert("a_bookAdd",bvo);
		ss.commit();
	}*/
	public void addBook(BookVO bvo){
		ss.insert("a_bookAdd",bvo);
		ss.commit();
	}
	
	// 희망도서
	public int applyBookTotalCount(){
		int count = ss.selectOne("a_applyBookCount");
		return count;
	}
	public List<Book_ApplyVO> getApplyBookList(Map<String, Integer> map){
		List<Book_ApplyVO> list = ss.selectList("a_applyBookList",map);
		return list;
	}
	
	// 희망도서 검색
	public Book_ApplyVO getApplyOneList(String ba_idx){
		Book_ApplyVO bavo = ss.selectOne("a_applyOnelist",ba_idx);
		return bavo;
	}
	
	// 희망도서 상태 변경
	public void getApplyState(String ba_idx){
		ss.update("a_applyState",ba_idx);
		ss.commit();
	}
	
	// 희망도서 책에 추가하기
	public void bookApplyAdd(BookVO bvo){
		ss.insert("a_bookApplyAdd",bvo);
		ss.commit();
	}
	
	// 희망도서 거절
	public void updateRefuse(Book_ApplyVO bavo){
		ss.update("a_bookApplyRefuseAp",bavo);
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
		ss.close();
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
		
		return yulvo;}

	
	// 아이디찾기
	
	public UsersVO forgotId(UsersVO input){
		return ss.selectOne("forgotid", input);
	}
	// 비밀번호 찾기
	public UsersVO forgotPwd(UsersVO input){
		return ss.selectOne("forgotpwd", input);

	}
	public List<B_CommentVO> getBookComment(String b_num){
		List<B_CommentVO> list = ss.selectList("bookComment",b_num);
		ss.close();
		return list;
				
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
	public void noticeHit(NoticeVO nvo){
		ss.update("noticehit", nvo);
		ss.close();
	}
	
	// Qna 전체 게시물의 수
		public int qnaTotalCount(){
			int count = ss.selectOne("qnalistcount");
			
			return count;
		}
		
	// QNA 리스트
		public List<QnaVO> getQnaList(Map<String, Integer> map){
			List<QnaVO> list = ss.selectList("qnalist",map);
			ss.close();
			return list;
		}
	// 메인에서 QNA 리스트
		public List<QnaVO> getQnaList(){
			return ss.selectList("m_qnalist");
		}
	// QNA 한 개 가져오기
		public QnaVO getOneQna(String q_idx){
			QnaVO qvo = ss.selectOne("oneqna", q_idx);
			return qvo;
		}
	// QNA 댓글 가져오기
		public List<Q_CommentVO> getQ_Comment(String q_idx){
			return ss.selectList("qclist", q_idx);
		}
	// QNA 히트 수 업데이트
		public void qnaHit(QnaVO qvo){
			ss.update("qnahit", qvo);
			ss.close();
	}
	// QNA 수정
		public void moidfyQna(QnaVO qvo){
			ss.update("qnamodify", qvo);
			ss.close();
		}
	// QNA 삭제
		public void deleteQna(String q_idx){
			ss.delete("qnadelete", q_idx);
			ss.close();
		}
	// QNA 글쓰기
		public void writeQna(QnaVO qvo){
			ss.insert("qnawrite", qvo);
			ss.close();
		}
	// QNA 댓글쓰기	
		public void writeQComment(Q_CommentVO qcvo){
			ss.insert("qcommentwrite", qcvo);
			ss.close();
		}
	// 스터디룸 현황
		public List<Studyroom_ReserveVO> getStudyroomState(){
			return ss.selectList("studyroomstate");
		}
		public List<BookVO> getMainSearch(Map<String, String> map){
			List<BookVO> list = ss.selectList("mainsearch",map);
			ss.close();
			return list;
		}
}

	
	

