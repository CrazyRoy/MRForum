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

import cn.cqut.edu.service.PostServise;

public class UserPosts extends HttpServlet {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	public PostServise servise = new PostServise();

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
		List<Map<String, Object>> posts = new ArrayList<Map<String, Object>>();

		String dealType = request.getParameter("dealType");
		
		if(dealType != null) {
			String pageNum = request.getParameter("pageNum");
			posts = servise.getAllPosts(Integer.parseInt(pageNum));
			int pageTotal = servise.getAllPages();
			map.put("posts", posts);
			map.put("page", pageNum);
			map.put("pages", pageTotal);
		}else {
			String userID = request.getParameter("userID");
			String pageNum = request.getParameter("pageNum");
	
			// 存入用户的ID
			map.put("userID", Integer.parseInt(userID));
			
			posts = servise.getPosts(Integer.parseInt(userID),
					Integer.parseInt(pageNum));
			int pageTotal = servise.getTotalPostPages(Integer.parseInt(userID));
			if (posts.size() > 0) {
				map.put("state", "havePosts");
				map.put("posts", posts);
				map.put("pages", pageTotal);
				map.put("page", Integer.parseInt(pageNum));
			} else {
				map.put("state", "none");
			}
		}
		JSONObject jsonMap = JSONObject.fromObject(map);
		System.out.println("后台帖子:" + jsonMap.toString());
		out.println(jsonMap.toString());
		out.flush();
		out.close();
	}
}
