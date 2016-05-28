package cn.cqut.edu.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONObject;

import cn.cqut.edu.service.CommentServise;

public class AddCommentServlet extends HttpServlet {

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
		
		Map<String, Object> map = new HashMap<String, Object>();
		PrintWriter out = response.getWriter();
		
		String uesrID = request.getParameter("userID");
		String postID = request.getParameter("postID");
		String content = request.getParameter("content");
		
		int res = servise.addCommentByPostID(Integer.parseInt(uesrID), Integer.parseInt(postID), content);
		if(res == 1) {
			map.put("addCommentResult", "success");
		}else {
			map.put("addCommentResult", "fail");
		}
		
		JSONObject jsonMap = JSONObject.fromObject(map);
		out.println(jsonMap.toString());
		out.flush();
		out.close();
	}
}
