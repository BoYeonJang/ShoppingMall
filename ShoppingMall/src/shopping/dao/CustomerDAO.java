package shopping.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import shopping.util.DBUtil;
import shopping.vo.CustomerVO;

public class CustomerDAO {

	// 입력
	public boolean addCustomer(CustomerVO customer) {
		Connection conn = null;
		PreparedStatement ps = null;
		boolean resultFlag = false;
		String sql = "insert into customer values (?,?,?,?,?,?,?)";
		try {
			conn = DBUtil.getConnection();

			ps = conn.prepareStatement(sql);
			ps.setString(1, customer.getId());
			ps.setString(2, customer.getPassword());
			ps.setString(3, customer.getName());
			ps.setString(4, customer.getGender());
			ps.setString(5, customer.getTel());
			ps.setString(6, customer.getAddress());
			ps.setString(7, customer.getEmail());

			System.out.println(customer.getName());

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

	public static void main(String[] args) {

		CustomerVO customer = new CustomerVO();
		customer.setId("boyeon55s");
		customer.setName("장보연");
	}

	// 로그인
	public CustomerVO getCustomerLogin(String id) {
		CustomerVO customer = null;
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		try {
			conn = DBUtil.getConnection();
			ps = conn.prepareStatement("select * from customer where id=?");
			ps.setString(1, id);
			rs = ps.executeQuery();
			if (rs.next()) {
				customer = new CustomerVO();
				customer.setId(rs.getString("id"));
				customer.setPassword(rs.getString("password"));
				customer.setName(rs.getString("name"));
				customer.setGender(rs.getString("gender"));
				customer.setTel(rs.getString("tel"));
				customer.setAddress(rs.getString("address"));
				customer.setEmail(rs.getString("email"));
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBUtil.close(conn, ps);
		}

		return customer;
	}

	// 전체 조회
	public List<CustomerVO> getCustomerList() {
		List<CustomerVO> customerList = new ArrayList<CustomerVO>();
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		try {
			conn = DBUtil.getConnection();

			ps = conn.prepareStatement("select id, password, name, gender, tel, address, email from customer");
			rs = ps.executeQuery();
			while (rs.next()) {
				CustomerVO customer = new CustomerVO();
				customer.setId(rs.getString(1));
				customer.setPassword(rs.getString(2));
				customer.setName(rs.getString(3));
				customer.setGender(rs.getString(4));
				customer.setTel(rs.getString(5));
				customer.setAddress(rs.getString(6));
				customer.setEmail(rs.getString(7));

				customerList.add(customer);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBUtil.close(conn, ps, rs);
		}
		return customerList;
	}
	
	// 한 건만 조회 
	public CustomerVO getCustomer(String id) {
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		CustomerVO customer=null;
		try {
			conn = DBUtil.getConnection();

			ps = conn.prepareStatement("select id, password, name, gender, tel, address, email from customer where id=?");
			ps.setNString(1, id);
			rs = ps.executeQuery();
			while (rs.next()) {
				customer = new CustomerVO();
				customer.setId(rs.getString(1));
				customer.setPassword(rs.getString(2));
				customer.setName(rs.getString(3));
				customer.setGender(rs.getString(4));
				customer.setTel(rs.getString(5));
				customer.setAddress(rs.getString(6));
				customer.setEmail(rs.getString(7));

			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBUtil.close(conn, ps, rs);
		}
		return customer;
	}
	
	
	// 수정
	public boolean updateCustomer(CustomerVO customer) {
		boolean resultFlag = false;
		Connection conn = null;
		PreparedStatement ps = null;
		String sql = "update customer set password=?, name=?, gender=?, tel=?, address=?, email=? where id=?";

		try {
			conn = DBUtil.getConnection();
			
			
			ps = conn.prepareStatement(sql);
			ps.setString(7, customer.getId());
			ps.setString(1, customer.getPassword());
			ps.setString(2, customer.getName());
			ps.setString(3, customer.getGender());
			ps.setString(4, customer.getTel());
			ps.setString(5, customer.getAddress());
			ps.setString(6, customer.getEmail());

			int count = ps.executeUpdate();
			if (count == 1) {
				resultFlag = true;
			}

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBUtil.close(conn, ps);
		}
		return resultFlag;
	}

	// 삭제
	public boolean deleteCustomer(String id) {
		boolean resultFlag = false;
		Connection conn = null;
		PreparedStatement ps = null;
		String sql = "delete from customer where id=?";

		try {
			conn = DBUtil.getConnection();

			ps = conn.prepareStatement(sql);
			ps.setString(1, id);
			int count = ps.executeUpdate();
			if (count == 1) {
				resultFlag = true;
			}

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBUtil.close(conn, ps);
		}
		return resultFlag;
	}

}