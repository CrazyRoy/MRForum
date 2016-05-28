package cn.cqut.edu.servlet;

import java.util.HashMap;
import java.util.List;
import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONObject;

import cn.cqut.edu.bean.User;
import cn.cqut.edu.service.UserServise;

public class LoginServlet extends HttpServlet {

	UserServise service = new UserServise();
	/**
	 * 
	 */
	private static final long serialVersionUID = -6156578033939677507L;

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		doPost(request, response);
	}

	
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		request.setCharacterEncoding("UTF-8");	// 修改编码  解决中文乱码
		
		response.setContentType("application/json; charset=UTF-8");
		
		PrintWriter out = response.getWriter();
		
		String account = request.getParameter("account");
		String password = request.getParameter("password");
		String actionType = request.getParameter("actionType");
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		int state;
		
		if(actionType == null){	// 前台登陆
			List<Object> loginResult = service.login(account, password);
			state = Integer.parseInt(loginResult.get(0).toString());
			
			if(state == 1){
				User user = (User) loginResult.get(1);
				/**
				 * 将登陆成功用户信息存入缓存
				 */
				request.getSession().setAttribute("loginName", user.getName());
				request.getSession().setAttribute("loginID", user.getUserID());
				request.getSession().setAttribute("loginState", "true");
				
				map.put("result","登陆成功");
				map.put("userName", user.getName());
				map.put("userAccount", user.getAccount());
				map.put("userID", user.getUserID());
				map.put("userPhoto", user.getPhoto_address());
				
			}else if(state == 2){
				map.put("result","密码错误");
			}else {
				map.put("result", "用户名不存在");
			}
		}else{   //后台登录
			List<Object> loginResult = service.login(account, password, actionType);
			state = Integer.parseInt(loginResult.get(0).toString());
			
			if(state == 1){
				map.put("result","1");//登陆成功
			}else if(state == 2){
				map.put("result","2");//密码错误
			}else if(state == 4){
				map.put("result","4");//没有权限
			}else{
				map.put("result","3");//用户名不存在
			}
		}
		JSONObject jsonMap = JSONObject.fromObject(map);
		System.out.println("loli:" + jsonMap.toString());
		out.println(jsonMap.toString());
		out.flush();
		out.close();
	}
}
