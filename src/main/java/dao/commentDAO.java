package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import dto.commentDTO;

public class commentDAO {
	private Connection connection;



	private static final String CREATE_COMMENT_QUERY = "INSERT INTO COMMENTS (COMMENTID, POSTID, USERID, CONTENT) VALUES (COMMENT_ID_SEQ.NEXTVAL, ?, ?, ?)";
	private static final String UPDATE_COMMENT_QUERY = "UPDATE COMMENTS SET CONTENT = ? WHERE COMMENTID = ?";
	private static final String DELETE_COMMENT_QUERY = "DELETE FROM COMMENTS WHERE COMMENTID = ?";
	private static final String GET_COMMENTS_BY_POST_ID_QUERY = "SELECT * FROM COMMENTS WHERE POSTID = ?";
	private static final String GET_COMMENT_BY_ID_QUERY = "SELECT * FROM comments WHERE COMMENTID = ?";

	public commentDAO() {

		this.connection = DBConnecter.getconnection();

	}

	public void createComment(commentDTO comment) {
		try (Connection connection = DBConnecter.getconnection();
				PreparedStatement pstmCreateComment = connection.prepareStatement(CREATE_COMMENT_QUERY)) {
			pstmCreateComment.setInt(1, comment.getPostId());
			pstmCreateComment.setString(2, comment.getUserId());
			pstmCreateComment.setString(3, comment.getContent());
			pstmCreateComment.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	public void updateComment(commentDTO comment) {
		try (Connection connection = DBConnecter.getconnection();
				PreparedStatement pstmUpdateComment = connection.prepareStatement(UPDATE_COMMENT_QUERY)) {
			pstmUpdateComment.setString(1, comment.getContent());
			pstmUpdateComment.setInt(2, comment.getCommentId());
			pstmUpdateComment.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	public boolean deleteComment(String userId, int commentId) {
	    try (PreparedStatement pstmGetComment = connection.prepareStatement(GET_COMMENT_BY_ID_QUERY)) {
	        pstmGetComment.setInt(1, commentId);

	        try (ResultSet rs = pstmGetComment.executeQuery()) {
	            if (rs.next()) {
	                String commentUserId = rs.getString("userId");

	                // 삭제 권한 확인
	                if (!userId.equals(commentUserId)) {
	                    // 권한이 없는 경우
	                    return false;
	                }
	            }
	        }
	    } catch (SQLException e) {
	        e.printStackTrace();
	    }

	    // 삭제 권한이 있으면 삭제 진행
	    try (PreparedStatement pstmDeleteComment = connection.prepareStatement(DELETE_COMMENT_QUERY)) {
	        pstmDeleteComment.setInt(1, commentId);
	        pstmDeleteComment.executeUpdate();
	    } catch (SQLException e) {
	        e.printStackTrace();
	    }

	    return true;
	}
	public commentDTO getCommentById(int commentId) {
		commentDTO comment = null;

		try (Connection connection = DBConnecter.getconnection();
				PreparedStatement pstmt = connection.prepareStatement(GET_COMMENT_BY_ID_QUERY)) {

			pstmt.setInt(1, commentId);

			try (ResultSet rs = pstmt.executeQuery()) {
				if (rs.next()) {
					comment = new commentDTO();
					comment.setCommentId(rs.getInt("COMMENTID"));
					comment.setPostId(rs.getInt("POSTID"));
					comment.setUserId(rs.getString("USERID"));
					comment.setContent(rs.getString("CONTENT"));
					comment.setCommentDate(rs.getTimestamp("COMMENT_DATE"));
				}
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}

		return comment;
	}

	public List<commentDTO> getCommentsByPostId(int postId) {
		List<commentDTO> comments = new ArrayList<>();
		try (Connection connection = DBConnecter.getconnection();
				PreparedStatement pstmGetCommentsByPostId = connection
						.prepareStatement(GET_COMMENTS_BY_POST_ID_QUERY)) {
			pstmGetCommentsByPostId.setInt(1, postId);
			try (ResultSet rs = pstmGetCommentsByPostId.executeQuery()) {
				while (rs.next()) {
					commentDTO comment = new commentDTO(rs.getInt("COMMENTID"), rs.getInt("POSTID"),
							rs.getString("USERID"), rs.getString("CONTENT"), rs.getTimestamp("COMMENT_DATE"));
					comments.add(comment);
				}
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return comments;
	}

}
