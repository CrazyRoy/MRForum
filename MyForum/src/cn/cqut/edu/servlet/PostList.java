package cn.cqut.edu.servlet;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import cn.cqut.edu.service.PostServise;

public class PostList extends HttpServlet {
		
	/**
	 * 
	 */
	private static final long serialVersionUID = -6420497939349581133L;
	
	public PostServise servise = new PostServise();

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doPost(request, response);
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		request.setCharacterEncoding("UTF-8");	// 修改编码  解决中文乱码
		
		List<Map<String, Object>> posts = new ArrayList<Map<String, Object>>();
		
		String type = request.getParameter("themeID");		//  某主题下面搜索
		
		String querytitle = request.getParameter("querytitle");
		
		if(querytitle == null || querytitle.equals("")) {
			querytitle = "没输入";	// 防止当成输入" " 显示全部帖子
		}
		
		String actionType = request.getParameter("actionType");
		
		if(actionType.equals("themeQuery")) {	//  某主题下面搜索
			Object types = (Integer) request.getSession().getAttribute("POID");
			String condition = "";
			if(types == null || types.equals("")) {
				condition = "where title like '%" + querytitle + "%'";
			}else {
				condition = "where title like '%" + querytitle + "%' and type = " + Integer.parseInt(types + "");
			}
			String sql = "select * from post " + condition;
			posts = servise.posts(sql);
		}else if(actionType.equals("indexQuery")) {			//  全局搜索
			String condition = "where title like '%" + querytitle + "%'";
			String sql = "select * from post " + condition;
			posts = servise.posts(sql);
		}else if(actionType.equals("themeIdQuery")){		//  主题里面的主题类型链接
			int typeId = Integer.parseInt(type);
			posts = servise.posts(typeId);
			request.getSession().setAttribute("POID", typeId);
		}
		
		request.setAttribute("posts", posts);
		request.getServletContext().getRequestDispatcher("/postList.jsp")
		.forward(request, response);
	}
}
