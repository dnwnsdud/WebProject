package serVlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.commentDAO;
import dto.userDTO;

@WebServlet("/DeleteCommentServlet")
public class DeleteCommentServlet extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");

		String commentIdString = request.getParameter("commentId");
		int postId = Integer.parseInt(request.getParameter("postId"));
		if (commentIdString != null) {
			int commentId = Integer.parseInt(commentIdString);
			HttpSession session = request.getSession();
			userDTO loggedInUser = (userDTO) session.getAttribute("loggedInUser");
			if (loggedInUser != null) {
				String userId = loggedInUser.getUserID();
				commentDAO dao = new commentDAO();
				boolean deleteResult = dao.deleteComment(userId, commentId);
				if (!deleteResult) {
					return;
				}
				response.sendRedirect("notice_detail.jsp?postId=" + postId);
			} else {
				response.sendRedirect("login.jsp");
			}
		} else {
			response.sendRedirect("notice_detail.jsp?postId=" + postId);
		}
	}
}