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
		String sql = "insert into Customer values (?,?,?,?,?,?,?)";
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
	// 아이디와 비밀번호를 체크
	public CustomerVO loginCustomer(String id, String password) {
		CustomerVO customer = null;
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;

		String dbpw = ""; // DB에서 비밀번호를 꺼내 변수에 담는다
		int i = -1;

		try {
			conn = DBUtil.getConnection();
			ps = conn.prepareStatement("select password from Customer where id=?");
			ps.setString(1, id);
			rs = ps.executeQuery();
			if (rs.next()) {
				dbpw = rs.getString("password");
				if (dbpw.equals(password))
					i = 1; // DB의 비밀번호와 입력받은 비밀번호가 같을 경우
				else
					i = 0; // DB의 비밀번호와 입력받은 비밀번호가 다를 경우
			} else {
				i = -1; // 가입된 아이디가 아닐 경우
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