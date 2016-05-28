package cn.cqut.edu.servlet;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import cn.cqut.edu.service.NoticeServise;
import cn.cqut.edu.service.PostServise;

public class ThemeServlet extends HttpServlet {
	/**
	 * 
	 */
	private static final long serialVersionUID = -6706113100924995296L;

	public PostServise post = new PostServise();
	
	public NoticeServise notice = new NoticeServise();

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doPost(request, response);
	}


	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");	// 修改编码  解决中文乱码
		
		List<Map<String, Object>> list = new ArrayList<Map<String, Object>>();
		list = post.allTypes();
		request.setAttribute("types", list);
		
		//  公告栏
		List<Map<String, Object>> notices = new ArrayList<Map<String, Object>>();
		notices = notice.newNotice();
		request.setAttribute("noticeList", notices);
		
		//  最新帖子
		List<Map<String, Object>> newList = new ArrayList<Map<String, Object>>();
		newList = post.newPosts();
		request.setAttribute("newList", newList);
		
		//  最火帖子
		List<Map<String, Object>> hotList = new ArrayList<Map<String, Object>>() ;
		hotList = post.hotPosts();
		request.setAttribute("hotList", hotList);
		
		request.getServletContext().getRequestDispatcher("/themes.jsp")
				.forward(request, response);
	}
}
