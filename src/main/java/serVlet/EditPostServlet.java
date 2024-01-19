package serVlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


import dao.postDAO;
import dto.postDTO;


@WebServlet("/EditPostServlet")
public class EditPostServlet extends HttpServlet {
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		int postId = Integer.parseInt(request.getParameter("postId"));
		String newTitle = request.getParameter("newTitle");
		String newContent = request.getParameter("newContent");

		postDTO updatedPost = new postDTO(postId, newTitle, newContent);

		postDAO dao = new postDAO();
		dao.editPost(updatedPost);

		// 수정 후 상세 페이지로 이동
		response.sendRedirect("notice_detail.jsp?postId=" + postId);
	}
}
