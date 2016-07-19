package com.hb.mybatis;

public class paging_history {
		int nowPage = 1 ; // 현재 페이지
	   int nowBlock = 1 ; // 현재블록
	   int totalRecord = 0 ; // 총 게시물의 수 (원글의 수)
	   int numPerPage = 3 ; // 한 페이장 보여질 게시물의 수
	   int pagePerBlock = 3 ; // 블록당 표현될 페이지의 수
	   int totalPage = 0; // 전체 페이지의 수
	   int totalBlock = 0 ; // 전체 블록의 수
	   int begin = 0 ; // mapper에 들어갈 시작 값
	   int end = 0 ;   // mapper에 들어갈 끝 값
	   int beginPage = 0 ; // 블록의 시작
	   int endPage = 0; // 블록의 끝
	   
	// 전체 게시물의 수를 가지고  전체 페이지의 수를 구한다.
	//  totalPage = 전체 게시물 / numPerPage  ** 나머지가 있으면 totalPage+1
	 public void setTotalPage(){
		 totalPage = totalRecord / numPerPage ;
		   if(totalRecord % numPerPage != 0) totalPage ++ ;
	  }
	   
	public int getNowPage() {
		return nowPage;
	}
	public void setNowPage(int nowPage) {
		this.nowPage = nowPage;
	}
	public int getNowBlock() {
		return nowBlock;
	}
	public void setNowBlock(int nowBlock) {
		this.nowBlock = nowBlock;
	}
	public int getTotalRecord() {
		return totalRecord;
	}
	public void setTotalRecord(int totalRecord) {
		this.totalRecord = totalRecord;
	}
	public int getNumPerPage() {
		return numPerPage;
	}
	public void setNumPerPage(int numPerPage) {
		this.numPerPage = numPerPage;
	}
	public int getPagePerBlock() {
		return pagePerBlock;
	}
	public void setPagePerBlock(int pagePerBlock) {
		this.pagePerBlock = pagePerBlock;
	}
	public int getTotalPage() {
		return totalPage;
	}
	public void setTotalPage(int totalPage) {
		this.totalPage = totalPage;
	}
	public int getTotalBlock() {
		return totalBlock;
	}
	public void setTotalBlock(int totalBlock) {
		this.totalBlock = totalBlock;
	}
	public int getBegin() {
		return begin;
	}
	public void setBegin(int begin) {
		this.begin = begin;
	}
	public int getEnd() {
		return end;
	}
	public void setEnd(int end) {
		this.end = end;
	}

	public int getBeginPage() {
		return beginPage;
	}

	public void setBeginPage(int beginPage) {
		this.beginPage = beginPage;
	}

	public int getEndPage() {
		return endPage;
	}

	public void setEndPage(int endPage) {
		this.endPage = endPage;
	}
}
