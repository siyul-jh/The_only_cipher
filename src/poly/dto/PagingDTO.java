package poly.dto;

/**
 * @author 
 * @version 1.1 페이징 DTO
 */
public class PagingDTO {

	private int totalcount;//전체 게시물 개수
	private int pagenum;//현재 페이지 번호
	private int contentnum=4;//한 페이지에 몇개 표시
	private int startPage=1;//현재페이지블록의 시작페이지
	private int endPage=5;//현재페이지블록의 마지막 페이지
	private boolean prev=false;//이전페이지로 가는 화살표
	private boolean next;//다음페이지로 가는화살표
	private int currentblock;//현재페이지블록
	private int lastblock;//마지막페이지블록
	
	 //검색하기 위한 변수
	 private String searchWord;
	 private String selBox;
	 
	 //1대1문의 검색 변수
	 private String classfication;
	 
	 
	 
	public String getClassfication() {
		return classfication;
	}
	public void setClassfication(String classfication) {
		this.classfication = classfication;
	}
	public String getSelBox() {
		return selBox;
	}
	public void setSelBox(String selBox) {
		this.selBox = selBox;
	}
	public String getSearchWord() {
		return searchWord;
	}
	public void setSearchWord(String searchWord) {
		this.searchWord = searchWord;
	}
	
	public void prevnext(int pagenum) {
//		if(pagenum>0 && pagenum<6) {
//			setPrev(true);
//			setNext(true);
//			
//		}else 
			if(getLastblock() == getCurrentblock()) {
			setPrev(true);
			setNext(false);
		}else {
			setPrev(true);
			setNext(true);
		}
	}
	
	public int calcpage(int totalcount,int contentnum) {// 전체 페이지 수를 계산하는 함수
		//125/10 = > 12.5
		//13페이지
		int totalpage = totalcount/ contentnum;
		//if(totalcount%contentnum>0) {
		//	totalpage++;
		//}
		return totalpage;
	}
	
	
	public int getTotalcount() {
		return totalcount;
	}
	public void setTotalcount(int totalcount) {
		this.totalcount = totalcount;
	}
	public int getPagenum() {
		return pagenum;
	}
	public void setPagenum(int pagenum) {
		this.pagenum = pagenum;
	}
	public int getContentnum() {
		return contentnum;
	}
	public void setContentnum(int contentnum) {
		this.contentnum = contentnum;
	}
	public int getStartPage() {
		return startPage;
	}
	//시작페이지 수정 블록을 가지고  한페이지 블록마다 페이지 4개 씩 보이게
	public void setStartPage(int currentblock ) {
			this.startPage = (currentblock*5)-4;
	}
	public int getEndPage() {
		return endPage;
	}
	public void setEndPage(int getlastblock,int getcurrentblock) {
		if(getlastblock == getcurrentblock) {
			this.endPage = calcpage(getTotalcount(),getContentnum());
		}else {
			this.endPage = getStartPage()+4;
		}
		
	}
	public boolean isPrev() {
		return prev;
	}
	public void setPrev(boolean prev) {
		this.prev = prev;
	}
	public boolean isNext() {
		return next;
	}
	public void setNext(boolean next) {
		this.next = next;
	}
	public int getCurrentblock() {
		return currentblock;
	}
	//현재페이지블록 수정
	public void setCurrentblock(int pagenum) {
		this.currentblock = pagenum/5;
		if(pagenum%5>0) {
			this.currentblock++;
		}
	}
	public int getLastblock() {
		return lastblock;
	}
	public void setLastblock(int totalcount) {
		this.lastblock = totalcount / (5*this.contentnum);
		if(totalcount%this.contentnum>0) {
			this.lastblock++;
		}
	}


}