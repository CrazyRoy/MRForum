package cn.cqut.edu.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import cn.cqut.edu.service.UserServise;

public class RegisterServlet extends HttpServlet {
	UserServise servise = new UserServise();
	/**
	 * 
	 */
	private static final long serialVersionUID = -3728932580440718805L;

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		doPost(request, response);
	}

	
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		request.setCharacterEncoding("UTF-8");	// 修改编码  解决中文乱码
		
		response.setContentType("application/json; charset=UTF-8");
		PrintWriter out = response.getWriter();
		
		//  获取注册页面的注册信息
		String name = request.getParameter("regUserName");
		String account = request.getParameter("regAccount");
		String password = request.getParameter("regPassword");
		
		int state = servise.register(name, account, password);
		if(state == 1) {
			out.println("{\"result\":\"注册成功\"}");
			System.out.println("注册成功");
		} else {
			out.println("{\"result\":\"注册失败\"}");
			System.out.println("注册失败");
		}
		out.flush();
		out.close();
	}
}
