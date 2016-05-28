package cn.cqut.edu.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import cn.cqut.edu.service.CommentServise;

import net.sf.json.JSONObject;

public class DeleteComments extends HttpServlet {

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
		
		String commendID = request.getParameter("commentID");
		
		int res = servise.deleteCommentByID(Integer.parseInt(commendID));
		if(res == 1) {
			map.put("state", "success");
		}else {
			map.put("state", "false");
		}
			
		JSONObject jsonObject = JSONObject.fromObject(map);
		out.println(jsonObject.toString());
		System.out.println("deletePost:" + jsonObject.toString());
		out.flush();
		out.close();

	}
}
