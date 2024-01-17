package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import dto.userDTO;

public class userDAO {
	private Connection conn;

	private static final String LOGIN_QUERY = "SELECT userPassword FROM USERS WHERE userID = ?";
	private static final String SIGNUP_QUERY = "INSERT INTO USERS (USERNUM, USERID, USERPASSWORD, USERNAME, USERNICKNAME, USEREMAIL, USERRESISTNUM, USERTEL) VALUES (USER_NUM_SEQ.NEXTVAL, ?,?,?,?,?,?,?)";
	private static final String USER_UPDATE_QUERY = "UPDATE USERS SET userEmail=?, UserTel=?, userPassword=?, userNickName=? WHERE userID=?";
	private static final String FIND_USERID_QUERY = "SELECT USERS FROM UserDB WHERE userEmail=? and userTel=? and userResistNum=?";
	private static final String DELETE_USER_QUERY = "DELETE FROM USERS WHERE userID=? AND userPassword=?";
	private static final String GET_USER_BY_USERID_QUERY = "SELECT * FROM USERS WHERE userID = ?";

	public userDAO() {
		this.conn = DBConnecter.getconnection();
	}

	public userDTO getUserById(String userID) {
		try (PreparedStatement pstmGetUser = conn.prepareStatement(GET_USER_BY_USERID_QUERY);
				ResultSet rs = pstmGetUser.executeQuery()) {
			pstmGetUser.setString(1, userID);

			userDTO user = null;
			if (rs.next()) {
				user = new userDTO();
				user.setUserID(rs.getString("userID"));
				user.setUserPassword(rs.getString("userPassword"));
				user.setUserName(rs.getString("userName"));
				user.setUserNickName(rs.getString("userNickName"));
				user.setUserEmail(rs.getString("userEmail"));
				user.setUserTel(rs.getString("userTel"));
				user.setUserResistNum(rs.getString("userResistNum"));

				return user;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}

		return null;
	}

	public userDTO login(String userID, String userPassword) {
		try (PreparedStatement pstmLogin = conn.prepareStatement(LOGIN_QUERY)) {
			pstmLogin.setString(1, userID);

			try (ResultSet rs = pstmLogin.executeQuery()) {
				if (rs.next()) {
					userDTO user = new userDTO();
					user.setUserID(userID);
					user.setUserPassword(rs.getString("userPassword"));
					return user;
				} else {
					return null; // 아이디 없음
				}
			}
		} catch (SQLException e) {
			e.printStackTrace();
			return null; // 데이터베이스 오류
		}
	}

	public int signUp(userDTO user) {

		if (isUserResistNumExist(user.getUserResistNum())) {

			return -2; // 이미 가입된 주민번호
		}
		try (PreparedStatement pstmSignUp = conn.prepareStatement(SIGNUP_QUERY)) {
			pstmSignUp.setString(1, user.getUserID());
			pstmSignUp.setString(2, user.getUserPassword());
			pstmSignUp.setString(3, user.getUserName());
			pstmSignUp.setString(4, user.getUserNickName());
			pstmSignUp.setString(5, user.getUserEmail());
			pstmSignUp.setString(6, user.getUserResistNum());
			pstmSignUp.setString(7, user.getUserTel());
			pstmSignUp.executeUpdate();

			return 1; // 성공
		} catch (SQLException e) {
			e.printStackTrace();
			System.out.println(e);
			return -1; // 데이터베이스 오류 + 아이디중복 (제약조건 위반)
		}
	}

	public boolean isUserResistNumExist(String userResistNum) {
		try (PreparedStatement pstmLogin = conn.prepareStatement("SELECT * FROM USERS WHERE USERRESISTNUM = ?")) {
			pstmLogin.setString(1, userResistNum);
			try (ResultSet rs = pstmLogin.executeQuery()) {
				System.out.println("결과: " + rs.next());
				return rs.next(); // 해당 주민번호가 이미 존재하면 true 반환
			}
		} catch (SQLException e) {
			e.printStackTrace();
			return false; // 데이터베이스 오류
		}
	}

	public int userUpdate(userDTO user) {
		int count = 0;
		try (PreparedStatement pstmUserUpdate = conn.prepareStatement(USER_UPDATE_QUERY)) {
			pstmUserUpdate.setString(1, user.getUserEmail());
			pstmUserUpdate.setString(2, user.getUserTel());
			pstmUserUpdate.setString(3, user.getUserPassword());
			pstmUserUpdate.setString(4, user.getUserNickName());
			pstmUserUpdate.setString(5, user.getUserID());

			count = pstmUserUpdate.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return count;
	}

	public String findUserID(userDTO user) {
		try (PreparedStatement pstmFindUserID = conn.prepareStatement(FIND_USERID_QUERY);
				ResultSet rs = pstmFindUserID.executeQuery()) {
			pstmFindUserID.setString(1, user.getUserEmail());
			pstmFindUserID.setString(2, user.getUserTel());
			pstmFindUserID.setString(3, user.getUserResistNum());

			String userID = null;
			if (rs.next()) {
				userID = rs.getString("UserID");
			}
			return userID;
		} catch (SQLException e) {
			e.printStackTrace();
			return null;
		}
	}

	public int deleteUser(String userId, String userPassword) {
		int count = 0;
		try (PreparedStatement pstmDeleteUser = conn.prepareStatement(DELETE_USER_QUERY)) {
			pstmDeleteUser.setString(1, userId);
			pstmDeleteUser.setString(2, userPassword);

			count = pstmDeleteUser.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return count;
	}

	public userDTO loginAndGetUser(String userID, String userPassword) {
		userDTO user = login(userID, userPassword);

		return user;
	}

}
