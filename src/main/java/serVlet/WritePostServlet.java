package serVlet;

import java.io.IOException;
import java.sql.Timestamp;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.postDAO;
import dto.postDTO;

@WebServlet("/CreatePostServlet")
public class WritePostServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");


        HttpSession session = request.getSession(false);
        String userID = (String) session.getAttribute("userID");


        String title = request.getParameter("title");
        String content = request.getParameter("content");


        Date postDate = new Date();


        postDTO newPost = new postDTO();
        newPost.setTitle(title);
        newPost.setContent(content);
        newPost.setUserId(userID);
        newPost.setPostDate((Timestamp) postDate);


        postDAO postDAO = new postDAO();
        postDAO.createPost(newPost);


        response.sendRedirect(request.getContextPath() + "/post.jsp");
    }
}
