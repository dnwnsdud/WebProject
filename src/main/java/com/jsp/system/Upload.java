package com.jsp.system;

import java.io.IOException;
import java.util.Collection;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

@WebServlet(urlPatterns = {
	"/upload/*"
})
@MultipartConfig(
	fileSizeThreshold = 1024 * 1024 * 5,
	maxFileSize = 1024 * 1024 * 100,
	maxRequestSize = 1024 * 1024 * 500
)
public class Upload extends HttpServlet{
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// "x-application", "multipart"
		Collection<Part> parts = req.getParts();
		for(Part part : parts) {
			String header = part.getHeader("Content-Disposition");
			// System.out.println(header);
			// filename=a.jpg, ~=~, ~=~
			String[] headers = header.split(";");
			for(String head : headers) {
				head = head.trim();
				if(head.startsWith("filename")) {
					// head.split("=")[1]; -> 받아온 파일 명
					// application
					// System.out.println(req.getRealPath("") +  head.split("=")[1]);
					part.write(req.getRealPath("") +  
							head.split("=")[1].substring(1,head.split("=")[1].length() - 1));
				}
			}
		}
	}
}













