package cn.cqut.edu.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import cn.cqut.edu.service.PostServise;

import net.sf.json.JSONObject;

public class AddPostServlet extends HttpServlet {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	PostServise servise = new PostServise();

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doPost(request, response);
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8"); // 修改编码 解决中文乱码
		response.setContentType("application/json; charset=UTF-8");
		
		Map<String, Object> map = new HashMap<String, Object>();
		PrintWriter out = response.getWriter();
		
		String userID = request.getParameter("userID");
		String postTitle = request.getParameter("postTitle");
		String postContent = request.getParameter("postContent");
		String postType = request.getParameter("postType");
		
		System.out.println("AddPostServlet:" + userID + postContent + postTitle + postType);
		
		int result = servise.addPost(Integer.parseInt(userID), Integer.parseInt(postType), postTitle, postContent);
		//	判断插入结果
		if(result == 1) {
			map.put("result", "success");
		}else {
			map.put("result", "false");
		}
		JSONObject jsonMap = JSONObject.fromObject(map);
		out.println(jsonMap.toString());
		out.flush();
		out.close();
	}
}
