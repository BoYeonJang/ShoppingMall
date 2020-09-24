package shopping.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import shopping.util.DBUtil;
import shopping.vo.OrderDetailVO;

public class OrderDetailDAO {
	public boolean addOrderDetail(OrderDetailVO orderDetail) {
		//1. 필요한 객체 선언 Connection, statment
		Connection conn = null;
		PreparedStatement ps = null;
		boolean resultFlag = false;
		String sql = "insert into orderDetail values (?,?,?,?,?,?)";	
		try {
			//3. 접속
				conn =DBUtil.getConnection();
			//4. 쿼리작성
				ps=conn.prepareStatement(sql);
				ps.setInt(1, orderDetail.getOrderNumber());
				ps.setString(2, orderDetail.getProductId());
				ps.setString(3,orderDetail.getProductOption());
				ps.setInt(4, orderDetail.getProductCount());
				ps.setInt(5, orderDetail.getProductPrice());
				ps.setInt(6,orderDetail.getPrice());
				
				
				
				
			//5. 실행
				int count = ps.executeUpdate();
				if(count ==1)
					resultFlag =true;				
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			//2 .닫기
			DBUtil.close(conn,ps);
		}
		
		return resultFlag;
	}
	

	
	//수정
	public boolean updateOrderDetail(OrderDetailVO orderdetail)
	{
		Connection conn = null;
		PreparedStatement ps = null;
		boolean resultFlag = false;
		String sql = "update orderDetail set productCount = ? , price = ?"
				+ ",productOption=? where orderNumber=? ";
		
		try {
				conn = DBUtil.getConnection();
				ps = conn.prepareStatement(sql);
				ps.setInt(1, orderdetail.getProductCount());
				ps.setInt(2, orderdetail.getPrice());
				ps.setString(3,orderdetail.getProductOption());
				ps.setInt(4, orderdetail.getOrderNumber());
				
				
				int count = ps.executeUpdate();
				if(count == 1)
					resultFlag = true;
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			DBUtil.close(conn);
		}
		return resultFlag;
	}
	
	
	//삭제
	public boolean deleteOrderDetail(OrderDetailVO orderdetail)
	{
		Connection conn = null;
		PreparedStatement ps = null;
		boolean resultFlag = false;
		String sql = "delete from orderDetail where orderNumber = ?";
		try {
				conn = DBUtil.getConnection();
				ps = conn.prepareStatement(sql);
				ps.setInt(1, orderdetail.getOrderNumber());
				
				int count = ps.executeUpdate();
				if(count == 1)
					resultFlag = true;
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			DBUtil.close(conn);
		}
		return resultFlag;
	}
	//조회

	//orderDetail테이블에 있는 모든 정보 조회
	public List<OrderDetailVO> getOrderDetailList(int orderNo){
		List<OrderDetailVO> orderDetailList = new ArrayList<OrderDetailVO>();
		Connection conn = null;
		PreparedStatement ps =null;
		ResultSet rs = null;
		String sql = "select * from orders where orderNumber = ?";
		try {
			conn = DBUtil.getConnection();
			ps = conn.prepareStatement(sql);
			ps.setInt(1, orderNo);
			rs = ps.executeQuery();
			while(rs.next()) {
				OrderDetailVO orderdetail = new OrderDetailVO();
				
			    orderdetail.setOrderNumber(rs.getInt(1));
				orderdetail.setProductId(rs.getString(2));
				orderdetail.setProductOption(rs.getString(3));
				orderdetail.setProductCount(rs.getInt(4));
				orderdetail.setProductPrice(rs.getInt(5));
				orderdetail.setPrice(rs.getInt(6));
				orderDetailList.add(orderdetail);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			DBUtil.close(conn, ps, rs);
		}
		return orderDetailList;
	}

}
