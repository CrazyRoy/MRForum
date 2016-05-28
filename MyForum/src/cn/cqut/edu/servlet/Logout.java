package cn.cqut.edu.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class Logout extends HttpServlet {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doPost(request, response);
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		request.setCharacterEncoding("UTF-8"); // 修改编码 解决中文乱码

		response.setContentType("application/json; charset=UTF-8");
		 
		// 清除页面session的数据 达到注销的效果
		request.getSession().invalidate();
		
		request.getServletContext().getRequestDispatcher("/index.jsp")
		.forward(request, response);
	}
}
