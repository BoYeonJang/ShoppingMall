package shopping.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import ShoppingMall.Util.DBUtil;
import ShoppingMall.VO.NoticeBoardVO; 
import ShoppingMall.VO.ProductVO;

public class NoticeBoardDAO {
	
	public boolean addNotice(NoticeBoardVO notice) {  
		//1. 필요한 객체 선언.  connection ,statemet 
		Connection conn = null;
		PreparedStatement ps = null;
		boolean resultFlag = false;
		String sql = "insert into NoticeBoard values (?,?,?)";
		try {
		//3. 접속 
			conn = DBUtil.getConnection();
		//4. 쿼리작성 
			ps = conn.prepareStatement(sql);
			ps.setInt(1, notice.getNoticeNo());
			ps.setString(2, notice.getNoticeTitle());
			ps.setString(3, notice.getNoticeCont());
		//5. 실행 
			int count = ps.executeUpdate();
			if(count == 1)
				resultFlag = true;
		}catch (Exception e) {
			e.printStackTrace();
		}finally {
			//2. 닫기
			DBUtil.close(conn, ps);
		}
		return resultFlag;
	}
	
	public boolean addProduct(int noticeNo, ProductVO product) {  
		//1. 필요한 객체 선언.  connection ,statemet 
		Connection conn = null;
		PreparedStatement ps = null;
		boolean resultFlag = false;
		String sql = "insert into NoticeBoard  values (?,?,?)";
		try {
		//3. 접속 
			conn = DBUtil.getConnection();
		//4. 쿼리작성 
			ps = conn.prepareStatement(sql);
			ps.setInt(1, noticeNo);
			ps.setString(2, product.getProductName());
			ps.setString(3, "product id: "+product.getProductId()+"product price: "+product.getProductPrice()+"price size: "+
			product.getProductSize()+"price type: "+product.getProductType());
		//5. 실행 
			int count = ps.executeUpdate();
			if(count == 1)
				resultFlag = true;
		}catch (Exception e) {
			e.printStackTrace();
		}finally {
			//2. 닫기
			DBUtil.close(conn, ps);
		}
		return resultFlag;
	}
	
	public void addProductToNoticeBoard(List<ProductVO> productList) {  
		//1. 필요한 객체 선언.  connection ,statemet 
		int noticeNo=1;
		for(ProductVO product : productList) {
			NoticeBoardDAO dao = new NoticeBoardDAO();
			dao.addProduct(noticeNo, product);
			noticeNo ++;
		}
	}
	
	//수정
	public boolean updateNotice(NoticeBoardVO notice) {
		boolean resultFlag = false;
		Connection conn = null;
		PreparedStatement ps = null;
		String sql = "update NoticeBoard set noticeCont=?, noticeTitle =? where noticeNo = ?";
		try {
			conn = DBUtil.getConnection();
			ps = conn.prepareStatement(sql);
			ps.setString(1, notice.getNoticeCont());
			ps.setString(2, notice.getNoticeTitle());
			ps.setInt(3, notice.getNoticeNo());

			
			int count = ps.executeUpdate();
			if(count == 1 )
				resultFlag = true;
		}catch (Exception e) {
			e.printStackTrace();
		}finally {
			DBUtil.close(conn, ps);
		}
		return resultFlag;
	}
	
	//삭제
	public boolean deleteNotice(int noticeNo) {
		boolean resultFlag = false;
		Connection conn = null;
		PreparedStatement ps = null;
		String sql = "delete from NoticeBoard where noticeNo = ?";
		try {
			conn = DBUtil.getConnection();
			ps = conn.prepareStatement(sql);
			ps.setInt(1, noticeNo);
			
			int count = ps.executeUpdate();
			if(count == 1)
				resultFlag = true;
		}catch (Exception e) {
			e.printStackTrace();
		}finally {
			DBUtil.close(conn, ps);
		}
		return resultFlag;
	}
	//조회     
	//deptno 에 해당하는 부서정보 한건 조회 
	public NoticeBoardVO getNotice(int noticeNo) {
		NoticeBoardVO notice = null;
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		String sql = "select noticeNo, noticeTitle, noticeCont from NoticeBoard where noticeNo=?";
		try {
			conn = DBUtil.getConnection();
			ps = conn.prepareStatement(sql);
			ps.setInt(1, noticeNo);
			rs = ps.executeQuery();
			
			if(rs.next()) {
				notice = new NoticeBoardVO();
				notice.setNoticeNo(rs.getInt(1));
				notice.setNoticeTitle(rs.getString(2));
				notice.setNoticeCont(rs.getString(3));
			}
			
		}catch (Exception e) {
			e.printStackTrace();
		}finally {
			DBUtil.close(conn, ps, rs);
		}
		
		return notice;
	}
	
	
	public List<NoticeBoardVO> getNoticeList(){
		List<NoticeBoardVO> noticeList = new ArrayList<NoticeBoardVO>();
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		try {
			conn = DBUtil.getConnection();
			ps= conn.prepareStatement("select noticeNo, noticeTitle, noticeCont from NoticeBoard");
			rs = ps.executeQuery();
			while(rs.next()) {
				NoticeBoardVO notice = new NoticeBoardVO();
				notice.setNoticeNo(rs.getInt(1));
				notice.setNoticeTitle(rs.getString(2));
				notice.setNoticeCont(rs.getString(3));
				
				noticeList.add(notice);
			}
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			DBUtil.close(conn, ps,rs);
		}
		
		return noticeList;
	}
	
	
	
	public static void main(String[] args) {
		ProductDAO pdao = new ProductDAO();
		List<ProductVO> productList = new ArrayList<ProductVO>();
		
		productList=pdao.getProductList();
		
		//notice.setNoticeTitle(product.getProductName());
		//notice.setNoticeCont("product price: "+product.getProductPrice());
		
		NoticeBoardDAO ndao = new NoticeBoardDAO();
		ndao.addProductToNoticeBoard(productList);
		
	}

}
