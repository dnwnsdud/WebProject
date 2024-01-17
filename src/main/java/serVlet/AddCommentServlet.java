package serVlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.commentDAO;
import dto.commentDTO;
import dto.userDTO;

@WebServlet("/AddCommentServlet")
public class AddCommentServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    	
    	request.setCharacterEncoding("utf-8");
    	response.setCharacterEncoding("utf-8");

        // 현재 로그인한 사용자 정보 가져오기
        userDTO loggedInUser = (userDTO) request.getSession().getAttribute("loggedInUser");

        if (loggedInUser == null) {
            // 로그인이 되어 있지 않은 경우 로그인 페이지로 이동
            response.sendRedirect("login.jsp");
            return;
        }

        // 게시글 아이디와 댓글 내용 받아오기
        int postId = Integer.parseInt(request.getParameter("postId"));
        String commentContent = request.getParameter("comment");

        // 댓글 객체 생성
        commentDTO comment = new commentDTO();
        comment.setPostId(postId);
        comment.setUserId(loggedInUser.getUserID());
        comment.setContent(commentContent);

        // 댓글 추가
        commentDAO cd = new commentDAO();
        cd.createComment(comment);


        response.sendRedirect("postDetail.jsp?postId=" + postId);
    }
}
