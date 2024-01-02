package User;

import oracle.jdbc.driver.*;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import com.jsp.dto.*;

public class UserDAO {

	private Connection conn;
	private PreparedStatement pstmt;
	private ResultSet rs;

	public UserDAO() {
		try {
			String dbURL = "jdbc:oracle:thin:@localhost:1521:xe";
			String dbID = "wjy";
			String dbPassword = "1234";
			Class.forName("oracle.jdbc.driver.OracleDriver");
			conn = DriverManager.getConnection(dbURL, dbID, dbPassword);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public int login(String userID, String userPassword) {
		
		String SQL = "SELECT userPassword FROM USER2 WHERE userID = ?";
		try {

			// 쿼리문 작성 해주세요
//			String query = "";
			pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, userID);

			rs = pstmt.executeQuery();
			if (rs.next()) {
				if (rs.getString(1).equals(userPassword)) {
					return 1; // 로그인 성공
				} else {
					return 0; // 로그인 실패
				}
			}
			return -1; // 아이디 없음
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			// ResultSet, PreparedStatement, Connection 닫기
			closeResources();
		}
		return -2;
	}
	public int signUp (User user) {
		String SQL = "INSERT INTO USER2 VALUES (seqnext.nextval,?,?,?,?,?,?,?)";
		try {
			pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, user.getUserID());
			pstmt.setString(2, user.getUserPassword());
			pstmt.setString(3, user.getUserName());
			pstmt.setString(4, user.getUserNickName());
			pstmt.setString(5, user.getUserEmail());
			pstmt.setString(6, user.getUserResistNum());
			pstmt.setString(7, user.getUserTel());
			// 회원가입 성공시
			return pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
		finally {
			closeResources();
		// 회원가입 실패 / DB오류
	}
		return -1;
	}
	public UserUpdateDAO() {
		// DB 연결 해주세요
		try {
			String dbURL = "";
			String dbID = "";
			String dbPassword = "";
			
			conn = DriverManager.getConnection(dbURL, dbID, dbPassword);
		}catch(SQLException e) {
			e.printStackTrace();
		}

	}
	
	public int userUpdate(com.jsp.dto.User user) {
		int count = 0;
		// 쿼리문 작성
		String sql = "UPDATE USER2 SET userEmail=?, userTel=?, userPassword=?, userNickName=? WHERE userID=?";
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, user.getUserEmail());
			pstmt.setString(2, user.getUserTel());
			pstmt.setString(3, user.getUserPassword());
			pstmt.setString(4, user.getUserNickName());

			// 쿼리 실행 
			count = pstmt.executeUpdate();
	
		}catch (SQLException e) {
			e.printStackTrace();
		}finally {
			closeResources();
		}
		return count;
	}
	
	// 회원 탈퇴
	public int deletUser(String userId, String userPassword) {
		int count = 0;
		// 쿼리문 작성
		String sql = "";
		
		try {
			pstmt = null;
			pstmt.setString(1, userId);
			pstmt.setString(2, userPassword);
			
			count = pstmt.executeUpdate();
			
		}catch (SQLException e){
			
		}finally {
			closeResources();
		}
		return count;
	}



	private void closeResources() {
		try {
			if (rs != null)
				rs.close();
			if (pstmt != null)
				pstmt.close();
			if (conn != null)
				conn.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

}
