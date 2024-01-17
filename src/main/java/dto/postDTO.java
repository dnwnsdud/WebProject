package dto;

import java.sql.Timestamp;

public class postDTO {
	private int postId;
	private String userId;
	private String title;
	private String content;
	private Timestamp postDate;

	public postDTO() {

	}

	public postDTO(int postId, String userId, String title, String content, Timestamp postDate) {
		this.postId = postId;
		this.userId = userId;
		this.title = title;
		this.content = content;
		this.postDate = postDate;
	}

	public postDTO(int postId, String title, String content) {
		this.postId = postId;
		this.title = title;
		this.content = content;

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

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public Timestamp getPostDate() {
		return postDate;
	}

	public void setPostDate(Timestamp postDate) {
		this.postDate = postDate;
	}

}
