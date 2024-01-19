package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import dto.userDTO;

public class adminDAO {

	private Connection conn;

	// 어드민
	private static final String GET_ALL_USERS_QUERY = "SELECT * FROM USERS";
	private static final String DELETE_USER_QUERY = "DELETE FROM USERS WHERE USERID = ?";
	private static final String DELETE_USER_COMMENTS_QUERY = "DELETE_USER_COMMENTS_QUERY";
	private static final String DELETE_USER_POSTS_QUERY = "DELETE_USER_POSTS_QUERY";
	private static final String GET_TOTAL_USERS_COUNT_QUERY = "SELECT COUNT(*) AS totalUserCount FROM USERS";
	private static final String GET_USERS_WITH_PAGINATION_QUERY = "SELECT * FROM (SELECT ROWNUM AS rn, u.* FROM USERS u WHERE ROWNUM <= ?) WHERE rn > ?";

	public adminDAO() {
		this.conn = DBConnecter.getconnection();
	}

	// 모든 회원 정보 가져오기
	public List<userDTO> getAllUsers() {
		List<userDTO> userList = new ArrayList<>();
		System.out.println("디버깅 1");
		try (PreparedStatement pstmt = conn.prepareStatement(GET_ALL_USERS_QUERY);
				ResultSet rs = pstmt.executeQuery()) {
			
			while (rs.next()) {
				userDTO user = new userDTO();
			
				user.setUserID(rs.getString("USERID"));
				user.setUserPassword(rs.getString("USERPASSWORD"));
				user.setUserName(rs.getString("USERNAME"));
				user.setUserNickName(rs.getString("USERNICKNAME"));
				user.setUserEmail(rs.getString("USEREMAIL"));
				user.setUserResistNum(rs.getString("USERRESISTNUM"));
				user.setUserTel(rs.getString("USERTEL"));
				userList.add(user);
			
			}
		} catch (SQLException e) {
			e.printStackTrace();
			e.getMessage();
			System.out.println(e);
		}
		
		return userList;
	}

	// 회원 삭제
	public boolean deleteUser(String userID) {
		try (PreparedStatement pstmt = conn.prepareStatement(DELETE_USER_QUERY)) {
			pstmt.setString(1, userID);
			System.out.println("디버깅 회원삭제 1");
			int rowsAffected = pstmt.executeUpdate();
			System.out.println("디버깅 회원삭제 2");
			return rowsAffected > 0;
		} catch (SQLException e) {
			e.printStackTrace();
			System.out.println("디버깅 회원삭제 실패");
			return false;
		}
	}

	// 사용자의 글 삭제
	public boolean deleteUserPosts(String userID) {
		try (PreparedStatement pstmtDeleteUserPosts = conn.prepareStatement(DELETE_USER_POSTS_QUERY)) {
			System.out.println("디버깅 회원 글 삭제1");
			pstmtDeleteUserPosts.setString(1, userID);
			System.out.println("디버깅 회원 글 삭제2");
			int rowsAffectedPosts = pstmtDeleteUserPosts.executeUpdate();
			System.out.println("디버깅 회원 글 삭제3");
			return rowsAffectedPosts > 0;
		} catch (SQLException e) {
			e.printStackTrace();
			System.out.println("디버깅 회원 글 삭제4");
			return false;
		}
	}

	// 사용자의 댓글 삭제
	public boolean deleteUserComments(String userID) {
		try (PreparedStatement pstmtDeleteUserComments = conn.prepareStatement(DELETE_USER_COMMENTS_QUERY)) {
			pstmtDeleteUserComments.setString(1, userID);
			int rowsAffectedComments = pstmtDeleteUserComments.executeUpdate();
			return rowsAffectedComments > 0;
		} catch (SQLException e) {
			e.printStackTrace();
			return false;
		}
	}

	// adminDAO 클래스에 getTotalUsersCount와 getUsersWithPagination 메서드 추가
	public int getTotalUsersCount() {
		try (PreparedStatement pstmt = conn.prepareStatement(GET_TOTAL_USERS_COUNT_QUERY);
				ResultSet rs = pstmt.executeQuery()) {
			if (rs.next()) {
				return rs.getInt("totalUsersCount");
			}
		} catch (SQLException e) {
			e.printStackTrace();
			System.out.println(e);
		}
		return 0;
	}

	public List<userDTO> getUsersWithPagination(int start, int pageSize) {
		List<userDTO> userList = new ArrayList<>();
		try (PreparedStatement pstmt = conn.prepareStatement(GET_USERS_WITH_PAGINATION_QUERY)) {
			pstmt.setInt(1, start + pageSize);
			pstmt.setInt(2, start);
			try (ResultSet rs = pstmt.executeQuery()) {
				while (rs.next()) {
					userDTO user = new userDTO();
					user.setUserID(rs.getString("USERID"));
					user.setUserPassword(rs.getString("USERPASSWORD"));
					user.setUserName(rs.getString("USERNAME"));
					user.setUserNickName(rs.getString("USERNICKNAME"));
					user.setUserEmail(rs.getString("USEREMAIL"));
					user.setUserResistNum(rs.getString("USERRESISTNUM"));
					user.setUserTel(rs.getString("USERTEL"));
					userList.add(user);
				}
			}
		} catch (SQLException e) {
			e.printStackTrace();
			System.out.println(e);
		}
		return userList;
	}
}
