package com.jsp.mapping;

import java.io.IOException;
import java.util.List;
import java.util.Map;
import java.util.HashMap;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.ibatis.session.SqlSession;
import org.json.JSONObject;

import com.jsp.system.DBConnector;
import com.jsp.test.*;

@WebServlet(urlPatterns = {
		"/api/*"
})
public class ApiController extends HttpServlet{
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		// req에서 getParameter로 id 값을 가져와서
		// 해당 id값의 검색결과를 JSON으로 반환하는 Servlet으로 변경
		
//		try(DBConnector con = new DBConnector();){
//			DBMap map = con.OpenMap(req, DBMap.class);
//			ProdDTO list = 
//						map.selectProdById(Integer.parseInt(req.getParameter("id")));
//			
//			Map<String, Object> result = new HashMap<String, Object>();
//			result.put("data", list);
//
//			resp.getWriter().write(new JSONObject(result).toString());
//
//			resp.setCharacterEncoding("UTF-8");
//			resp.setContentType("application/JSON");			
////			for(ProdDTO dto : list) {
////				resp.getWriter().printf("%d | %s<br>",dto.getId(),dto.getName());	
////			}
//		}
//		catch(Exception e) {}
		
		RequestDispatcher dispatcher = null;
		String path = req.getPathInfo().toLowerCase();
		if(path.endsWith(".jsp")) 
			dispatcher = req.getRequestDispatcher("/WEB-INF/api" + path);
		else 
			dispatcher = req.getRequestDispatcher("/WEB-INF/api" + path + ".jsp");
		dispatcher.forward(req, resp);
	}
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		this.doGet(req, resp);
	}
}











