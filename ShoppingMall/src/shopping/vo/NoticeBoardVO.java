package shopping.vo;

public class NoticeBoardVO {
	

	private int noticeNo;
	private String noticeTitle;
	private String noticeCont;
	private String noticeCategory;
	private int noticePicId;
	
	
	
	public int getNoticeNo() {
		return noticeNo;
	}
	public void setNoticeNo(int noticeNo) {
		this.noticeNo = noticeNo;
	}
	public String getNoticeTitle() {
		return noticeTitle;
	}
	public void setNoticeTitle(String noticeTitle) {
		this.noticeTitle = noticeTitle;
	}
	public String getNoticeCont() {
		return noticeCont;
	}
	public void setNoticeCont(String noticeCont) {
		this.noticeCont = noticeCont;
	}
	
	public String getNoticeCategory() {
		return noticeCategory;
	}
	public void setNoticeCategory(String noticeCategory) {
		this.noticeCategory = noticeCategory;
	}
	
	
	
	public int getNoticePicId() {
		return noticePicId;
	}
	public void setNoticePicId(int noticePicId) {
		this.noticePicId = noticePicId;
	}
	
	@Override
	public String toString() {
		return "NoticeBoardVO [noticeNo=" + noticeNo + ", noticeTitle=" + noticeTitle + ", noticeCont=" + noticeCont
				+ ", noticeCategory=" + noticeCategory + ", noticePicId=" + noticePicId + "]";
	}
	
	
	
	
	
	
	

}
