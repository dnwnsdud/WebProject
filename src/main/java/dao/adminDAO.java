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
//	private static final String UPDATE_USER_QUERY = "UPDATE USERS SET USERPASSWORD = ?, "
//	        + "USERNAME = ?, USERNICKNAME = ?, USEREMAIL = ?, USERRESISTNUM = ?, USERTEL = ? "
//	        + "WHERE USERID = ?";
	private static final String DELETE_USER_COMMENTS_QUERY = "DELETE_USER_COMMENTS_QUERY";
	private static final String DELETE_USER_POSTS_QUERY = "DELETE_USER_POSTS_QUERY";
	
	
	public adminDAO() {
		this.conn = DBConnecter.getconnection();
	}
	
	    // 모든 회원 정보 가져오기
	    public List<userDTO> getAllUsers() {
	        List<userDTO> userList = new ArrayList<>();
	        System.out.println("디버깅 1");
	        try (PreparedStatement pstmt = conn.prepareStatement(GET_ALL_USERS_QUERY);
	             ResultSet rs = pstmt.executeQuery()) {
	        	System.out.println("디버깅 2");
	            while (rs.next()) {
	            	userDTO user = new userDTO();
	            	System.out.println("디버깅 3");
	                user.setUserID(rs.getString("USERID"));
	                user.setUserPassword(rs.getString("USERPASSWORD"));
	                user.setUserName(rs.getString("USERNAME"));
	                user.setUserNickName(rs.getString("USERNICKNAME"));
	                user.setUserEmail(rs.getString("USEREMAIL"));
	                user.setUserResistNum(rs.getString("USERRESISTNUM"));
	                user.setUserTel(rs.getString("USERTEL"));
	                userList.add(user);
	                System.out.println("디버깅 4");
	            }
	        } catch (SQLException e) {
	            e.printStackTrace();
	            e.getMessage();
	            System.out.println("디버깅 5");
	            System.out.println(e);
	        }
	        System.out.println("디버깅 6");
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
	    
//	    // 회원정보 수정
//	    public boolean updateUserInfo(String userID, String userPassword, String userName, String userNickName, String userEmail, String userResistNum, String userTel) {
//            try (PreparedStatement pstmUpdateUser = conn.prepareStatement(UPDATE_USER_QUERY)) {
//            	System.out.println("디버깅 회원수정 1");
//                pstmUpdateUser.setString(1, userPassword);
//                pstmUpdateUser.setString(2, userName);
//                pstmUpdateUser.setString(3, userNickName);
//                pstmUpdateUser.setString(4, userEmail);
//                pstmUpdateUser.setString(5, userResistNum);
//                pstmUpdateUser.setString(6, userTel);
//                pstmUpdateUser.setString(7, userID);
//                System.out.println("디버깅 회원수정 2");
//                int rowsAffected = pstmUpdateUser.executeUpdate();
//                System.out.println("디버깅 회원수정 3");
//                return rowsAffected > 0; // 업데이트가 성공했는지 여부 반환
//            } catch (SQLException e) {
//            	System.out.println("디버깅 회원수정 4");
//                e.printStackTrace();
//                return false; // 업데이트 실패
//            }
//        }
	    
	    
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
}
