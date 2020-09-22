package shopping.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import shopping.util.DBUtil;
import shopping.vo.CustomerVO;

public class CustomerDAO {

	// 입력
	public boolean addCustomer(CustomerVO customer) {
		Connection conn = null;
		PreparedStatement ps = null;
		boolean resultFlag = false;
		String sql = "insert into Customer (id, password, name, gender, tel, address, email) values (?,?,?,?,?,?,?)";
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

	// 로그인
	public CustomerVO loginCustomer(String id) {
		CustomerVO customer = null;
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		try {
			conn = DBUtil.getConnection();
			ps = conn.prepareStatement("select * from Customer where id=?");
			ps.setString(1, id);
			rs = ps.executeQuery();
			if (rs.next()) {
				customer = new CustomerVO();
				customer.setId(rs.getString("id"));
				customer.setEmail(rs.getString("email"));
				customer.setName(rs.getString("name"));
				customer.setPassword(rs.getString("password"));
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBUtil.close(conn, ps);
		}

		return customer;
	}

	// 수정
	public boolean updateCustomer(CustomerVO customer) {
		boolean resultFlag = false;
		Connection conn = null;
		PreparedStatement ps = null;
		String sql = "update Customer set password=?, name=?, gender=?, tel=?, address=?, email=? where id=?";

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
		String sql = "delete from Customer where id=?";

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