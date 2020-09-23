package shopping.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import shopping.util.DBUtil;
import shopping.vo.ProductVO;


public class ProductDAO {

	public boolean addProduct(ProductVO product) {
		// 1. 필요한 객체 선언. connection ,statemet
		Connection conn = null;
		PreparedStatement ps = null;
		boolean resultFlag = false;
		String sql = "insert into product values (?,?,?,?,?)";
		try {
			// 3. 접속
			conn = DBUtil.getConnection();
			// 4. 쿼리작성
			ps = conn.prepareStatement(sql);
			ps.setString(1, product.getProductName());
			ps.setString(2, product.getProductId());
			ps.setInt(3, product.getProductPrice());
			ps.setString(4, product.getProductSize());
			ps.setString(5, product.getProductType());
			
			// 5. 실행
			int count = ps.executeUpdate();
			if (count == 1)
				resultFlag = true;
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			// 2. 닫기
			DBUtil.close(conn, ps);
		}
		return resultFlag;
	}

	// 수정
	public boolean updateProduct(ProductVO product) {
		boolean resultFlag = false;
		Connection conn = null;
		PreparedStatement ps = null;
		String sql = "update product set productName=?, productPrice =?, productSize=?, productType=? where productId = ?";
		try {
			conn = DBUtil.getConnection();
			ps = conn.prepareStatement(sql);
			ps.setString(1, product.getProductName());
			ps.setInt(2, product.getProductPrice());
			ps.setString(3, product.getProductSize());
			ps.setString(4, product.getProductType());
			ps.setString(5, product.getProductId());

			int count = ps.executeUpdate();
			if (count == 1)
				resultFlag = true;
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBUtil.close(conn, ps);
		}
		return resultFlag;
	}

	// 삭제
	public boolean deleteProduct(String productId) {
		boolean resultFlag = false;
		Connection conn = null;
		PreparedStatement ps = null;
		String sql = "delete from product where productId = ?";
		try {
			conn = DBUtil.getConnection();
			ps = conn.prepareStatement(sql);
			ps.setString(1, productId);
			int count = ps.executeUpdate();
			if (count == 1)
				resultFlag = true;
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBUtil.close(conn, ps);
		}
		return resultFlag;
	}

	// 조회
	// deptno 에 해당하는 부서정보 한건 조회
	public ProductVO getProduct(String productId) {
		ProductVO product = null;
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		String sql = "";
		try {
			conn = DBUtil.getConnection();
			sql = "select * from product where productId=?";
			ps = conn.prepareStatement(sql);
			ps.setString(1, productId);
			
			rs = ps.executeQuery();
			
			while (rs.next()) {
				product = new ProductVO();
				product.setProductName(rs.getString(1));
				product.setProductId(rs.getString(2));
				product.setProductPrice(rs.getInt(3));
				product.setProductSize(rs.getString(4));
				product.setProductType(rs.getString(5));
			}

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBUtil.close(conn, ps, rs);
		}

		return product;
	}
	
//	public ProductVO getProductWithType(String productType) {
//		ProductVO product = null;
//		Connection conn = null;
//		PreparedStatement ps = null;
//		ResultSet rs = null;
//		String sql = "";
//		try {
//			conn = DBUtil.getConnection();
//			sql = "select * from product where productType=?";
//			ps = conn.prepareStatement(sql);
//			ps.setString(1, productType);
//			
//			rs = ps.executeQuery();
//			
//			while (rs.next()) {
//				product = new ProductVO();
//				product.setProductName(rs.getString(1));
//				product.setProductId(rs.getString(2));
//				product.setProductPrice(rs.getInt(3));
//				product.setProductSize(rs.getString(4));
//				product.setProductType(rs.getString(5));
//			}
//
//		} catch (Exception e) {
//			e.printStackTrace();
//		} finally {
//			DBUtil.close(conn, ps, rs);
//		}
//
//		return product;
//	}

	
	public List<ProductVO> getProductList() {
		List<ProductVO> productList = new ArrayList<ProductVO>();
		Connection conn = null;
		String sql ="";
		PreparedStatement ps = null;
		ResultSet rs = null;
		try {
			conn = DBUtil.getConnection();
			sql= "select * from product";
			ps = conn.prepareStatement(sql);
			rs = ps.executeQuery();
			
			while (rs.next()) {
				ProductVO product = new ProductVO();
				product.setProductName(rs.getString(1));
				product.setProductId(rs.getString(2));
				product.setProductPrice(rs.getInt(3));
				product.setProductSize(rs.getString(4));
				product.setProductType(rs.getString(5));

				productList.add(product);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBUtil.close(conn, ps, rs);
		}

		return productList;
	}
	
	public List<ProductVO> getProductListWithType(String productType) {
		List<ProductVO> productList = new ArrayList<ProductVO>();
		Connection conn = null;
		String sql ="";
		PreparedStatement ps = null;
		ResultSet rs = null;
		try {
			conn = DBUtil.getConnection();
			sql= "select * from product where productType=?";
			ps = conn.prepareStatement(sql);
			ps.setString(1, productType);
			rs = ps.executeQuery();
			
			while (rs.next()) {
				ProductVO product = new ProductVO();
				product.setProductName(rs.getString(1));
				product.setProductId(rs.getString(2));
				product.setProductPrice(rs.getInt(3));
				product.setProductSize(rs.getString(4));
				product.setProductType(rs.getString(5));

				productList.add(product);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBUtil.close(conn, ps, rs);
		}

		return productList;
	}
	
	public static void main(String[] args) {
//		ProductVO product = new ProductVO();
//		product.setProductId("126");
//		product.setProductName("보야 클래식 로퍼");
//		product.setProductPrice(27400);
//		product.setProductSize("240~");
//		product.setProductType("신발");
		
		ProductDAO dao = new ProductDAO();
		//dao.addProduct(product);
		//dao.deleteProduct("111");
		System.out.println(dao.getProductList());
		//System.out.println(dao.getProductListWithType("상의"));
		
	}
}
