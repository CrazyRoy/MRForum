package cn.cqut.edu.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONObject;

import cn.cqut.edu.service.CommentServise;

public class UserComments extends HttpServlet {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	public CommentServise servise = new CommentServise();

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
			doPost(request, response);
	}
	
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8"); // 修改编码 解决中文乱码
		response.setContentType("application/json; charset=UTF-8");
		PrintWriter out = response.getWriter();
		
		Map<String, Object> map = new HashMap<String, Object>();
		List<Map<String, Object>> comments = new ArrayList<Map<String, Object>>();
		
		String userID = request.getParameter("userID");
		String pageNum = request.getParameter("pageNum");
		
		// 存入用户的ID
		map.put("userID", Integer.parseInt(userID));
		
		comments = servise.getCommentByUserID(Integer.parseInt(userID), Integer.parseInt(pageNum));
		
		int pageTotal = servise.getTotalCommentPagesByUserId(Integer.parseInt(userID));
		
		if(comments.size() > 0) {
			map.put("comments", comments);
			map.put("state", "haveComments");
			map.put("pages", pageTotal);
			map.put("page", Integer.parseInt(pageNum));
		}else {
			map.put("state", "none");
		}
		
		JSONObject jsonMap = JSONObject.fromObject(map);
		System.out.println("结果:" + jsonMap.toString());
		out.println(jsonMap.toString());
		out.flush();
		out.close();
	}
}
