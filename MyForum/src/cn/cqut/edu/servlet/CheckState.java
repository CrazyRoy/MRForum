package cn.cqut.edu.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import cn.cqut.edu.service.UserServise;

import net.sf.json.JSONObject;

public class CheckState extends HttpServlet {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	public UserServise servise = new UserServise();

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
		
		Object object = request.getSession().getAttribute("loginState");
		
		if(object != null) {
			String userID = String.valueOf(request.getSession().getAttribute("loginID"));
			int userState = servise.checkState(Integer.parseInt(userID));
			
			map.put("state", userState);
			map.put("loginState", "success");
			map.put("loginID", request.getSession().getAttribute("loginID"));
			map.put("loginAccount", request.getSession().getAttribute("loginAccount"));
			map.put("loginName", request.getSession().getAttribute("loginName"));
			
		}else {
			map.put("loginState", "false");
		}
		
		JSONObject jsonMap = JSONObject.fromObject(map);
		out.println(jsonMap.toString());
		System.out.println("checkState:" + jsonMap.toString());
		out.flush();
		out.close();
	}
}
