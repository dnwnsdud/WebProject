package serVlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.postDAO;
import dto.userDTO;

@WebServlet("/DeletePostServlet/*")
public class DeletePostServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		HttpSession session = request.getSession();
		userDTO loggedInUser = (userDTO) session.getAttribute("loggedInUser");

		if (loggedInUser != null) {
			String userId = loggedInUser.getUserID();
			int postId = Integer.parseInt(request.getParameter("postId"));

			postDAO dao = new postDAO();
			String postUserId = dao.getPostById(postId).getUserId();

			if (userId.equals(postUserId) || userId.equals("admin")) {
				// 글의 작성자가 로그인한 사용자이거나, 관리자인 경우에만 삭제 수행
				dao.deletePost(postId);
			}
		}

		// 게시글 목록 페이지로 이동
		response.sendRedirect("notice_main.jsp");
	}
}
