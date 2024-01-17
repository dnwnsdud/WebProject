package dto;

import java.sql.Timestamp;

public class commentDTO {
	private int commentId;
	private int postId;
	private String userId;
	private String content;
	private Timestamp commentDate;
	private boolean commentAuthor;

	public commentDTO() {
	}

	public commentDTO(int commentId, int postId, String userId, String content, Timestamp commentDate) {
		this.commentId = commentId;
		this.postId = postId;
		this.userId = userId;
		this.content = content;
		this.commentDate = commentDate;
	}

	public int getCommentId() {
		return commentId;
	}

	public void setCommentId(int commentId) {
		this.commentId = commentId;
	}

	public int getPostId() {
		return postId;
	}

	public void setPostId(int postId) {
		this.postId = postId;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public Timestamp getCommentDate() {
		return commentDate;
	}

	public void setCommentDate(Timestamp commentDate) {
		this.commentDate = commentDate;
	}

	public boolean isCommentAuthor() {
		return commentAuthor;
	}

	public void setCommentAuthor(boolean commentAuthor) {
		this.commentAuthor = commentAuthor;
	}
}
