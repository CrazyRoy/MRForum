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
import cn.cqut.edu.service.PostServise;

public class PostDetail extends HttpServlet {

	/**
	 * 用于返回帖子的详情的servlet
	 */
	private static final long serialVersionUID = 1L;

	PostServise p_servise = new PostServise();
	CommentServise c_servise = new CommentServise();

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doPost(request, response);
	}

	@SuppressWarnings("unused")
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		request.setCharacterEncoding("UTF-8"); // 修改编码 解决中文乱码

		response.setContentType("application/json; charset=UTF-8");

		PrintWriter out = response.getWriter();

		// 用于存储传到jsp页面的所有信息 （将map装换成为json）
		Map<String, Object> map = new HashMap<String, Object>();

		// 保存某帖子的相关信息 这里post的size为1 因为后面限定了id 所以之后有一个满足条件
		List<Map<String, Object>> post = new ArrayList<Map<String, Object>>();
		// 保存某帖子的所有评论
		List<Map<String, Object>> comments = new ArrayList<Map<String, Object>>();

		// 帖子的ID
		int postID = Integer.parseInt(request.getParameter("postID"));
		
		String actionType = request.getParameter("actionType");
		if(actionType != null) {
			post = p_servise.getPost(postID);
			map.put("state", "success");
			map.put("post", post);
		}else {
			// 帖子评论显示的相关页数
			int page = Integer.parseInt(request.getParameter("pageNum"));
	
			// 帖子的信息列表
			post = p_servise.getPost(postID);
	
			// 评论按照给定的页数返回的指定页数的评论信息
			comments = c_servise.getCommentByPostID(postID, page);
	
			// 返回指定帖子评论的总页数
			int totalPages = c_servise.getTotalCommentPagesByPostId(postID);
	
			// 将某帖子的访问量加1
			int result = p_servise.addPageView(postID);
	
			// 将评论的帖子存入map
			map.put("post", post);
			// 将帖子的ID存入map
			map.put("postID", postID);
			// 将评论的总页数存入map
			map.put("pages", totalPages);
	
			// 返回状态 如果评论为空 result = false; 方便用户在jsp中判断 并且通过获取map中的评论大小展示是否暂无评论
			if (comments.size() > 0) {
				// 将帖子的评论存入map
				map.put("state", "success");
				map.put("comments", comments);
				// 当前页数
				map.put("page", page);
			} else {
				map.put("state", "false");
			}
		}
		// 将map转换为json格式 方便jsp中的js方法获取数据(ps:js中的方法获取的格式都是json格式)
		JSONObject jsonMap = JSONObject.fromObject(map);
		System.out.println("ddd:" + jsonMap.toString());
		out.println(jsonMap.toString());
		out.flush();
		out.close();
	}
}
