package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import dto.postDTO;

public class postDAO {
	private Connection connection;

	private static final String CREATE_POST_QUERY = "INSERT INTO POSTS (POSTID, USERID, TITLE, CONTENT) VALUES (POST_ID_SEQ.NEXTVAL, ?, ?, ?)";
	private static final String DELETE_POST_QUERY = "DELETE FROM POSTS WHERE POSTID = ?";
	private static final String GET_ALL_POSTS_QUERY = "SELECT * FROM POSTS";
	private static final String GET_POST_BY_ID_QUERY = "SELECT * FROM POSTS WHERE POSTID = ?";
	private static final String GET_POSTS_BY_PAGE_QUERY = "SELECT * FROM (SELECT ROWNUM AS RNUM, P.* FROM (SELECT * FROM POSTS ORDER BY POST_DATE DESC) P) WHERE RNUM BETWEEN ? AND ?";
	private static final String GET_TOTAL_POSTS_COUNT_QUERY = "SELECT COUNT(*) FROM POSTS";
	private static final String EDIT_POST_QUERY = "UPDATE POSTS SET TITLE = ?, CONTENT = ? WHERE POSTID = ?";

	public postDAO() {
		this.connection = DBConnecter.getconnection();
	}

	public void createPost(postDTO post) {
		try (PreparedStatement pstmCreatePost = connection.prepareStatement(CREATE_POST_QUERY)) {
			pstmCreatePost.setString(1, post.getUserId());
			pstmCreatePost.setString(2, post.getTitle());
			pstmCreatePost.setString(3, post.getContent());
			pstmCreatePost.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	
	public void editPost(postDTO post) {
		try (PreparedStatement pstmEditPost = connection.prepareStatement(EDIT_POST_QUERY)) {
			pstmEditPost.setString(1, post.getTitle());
			pstmEditPost.setString(2, post.getContent());
			pstmEditPost.setInt(3, post.getPostId());
			pstmEditPost.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	public void deletePost(int postId) {
		try (PreparedStatement pstmDeletePost = connection.prepareStatement(DELETE_POST_QUERY)) {
			pstmDeletePost.setInt(1, postId);
			pstmDeletePost.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	public List<postDTO> getAllPosts() {
		List<postDTO> posts = new ArrayList<>();
		try (PreparedStatement pstmGetAllPosts = connection.prepareStatement(GET_ALL_POSTS_QUERY)) {
			try (ResultSet rs = pstmGetAllPosts.executeQuery()) {
				while (rs.next()) {
					postDTO post = new postDTO(rs.getInt("POSTID"), rs.getString("USERID"), rs.getString("TITLE"),
							rs.getString("CONTENT"), rs.getTimestamp("POST_DATE"));
					posts.add(post);
				}
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return posts;
	}

	public postDTO getPostById(int postId) {
		postDTO post = null;
		try (PreparedStatement pstmGetPostById = connection.prepareStatement(GET_POST_BY_ID_QUERY)) {
			pstmGetPostById.setInt(1, postId);
			try (ResultSet rs = pstmGetPostById.executeQuery()) {
				if (rs.next()) {
					post = new postDTO(rs.getInt("POSTID"), rs.getString("USERID"), rs.getString("TITLE"),
							rs.getString("CONTENT"), rs.getTimestamp("POST_DATE"));
				}
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return post;
	}

	public List<postDTO> getPostsByPage(int pageNo, int pageSize) {
		List<postDTO> posts = new ArrayList<>();
		try (PreparedStatement pstm = connection.prepareStatement(GET_POSTS_BY_PAGE_QUERY)) {
			int startRow = (pageNo - 1) * pageSize + 1;
			int endRow = startRow + pageSize - 1;
			pstm.setInt(1, startRow);
			pstm.setInt(2, endRow);

			try (ResultSet rs = pstm.executeQuery()) {
				while (rs.next()) {
					postDTO post = new postDTO(rs.getInt("POSTID"), rs.getString("USERID"), rs.getString("TITLE"),
							rs.getString("CONTENT"), rs.getTimestamp("POST_DATE"));
					posts.add(post);
				}
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} 
		return posts;
	}

	public int getTotalPostsCount() {
		int totalPosts = 0;
		try (PreparedStatement pstm = connection.prepareStatement(GET_TOTAL_POSTS_COUNT_QUERY);
				ResultSet rs = pstm.executeQuery()) {
			if (rs.next()) {
				totalPosts = rs.getInt(1);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return totalPosts;
	}

}
