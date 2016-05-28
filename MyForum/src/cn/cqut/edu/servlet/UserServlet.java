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

import cn.cqut.edu.service.UserServise;

public class UserServlet extends HttpServlet {

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
		List<Map<String, Object>> users = new ArrayList<Map<String, Object>>();
		
		String actionType = request.getParameter("actionType");
		// 用户信息更新
		if(actionType.equals("set")) {
			String userID = request.getParameter("userID");
			users = servise.getUserById(Integer.parseInt(userID));
			map.put("user", users);
		}else if(actionType.equals("update")){	// 提交更新
			String userID = request.getParameter("userID");
			String account = request.getParameter("account");
			String name = request.getParameter("name");
			String sex = request.getParameter("sex");
			String email = request.getParameter("email");
			int res = servise.updateUser(Integer.parseInt(userID), account, name, sex, email);
			if(res == 1) {
				map.put("updateState", "success");
			}else {
				map.put("updateState", "fail");
			}
		}else if(actionType.equals("updatePwd")){
			String userID = request.getParameter("userID");
			String oldPwd = request.getParameter("oldPwd");
			String newPwd = request.getParameter("newPwd");
			int res = servise.updatePwd(Integer.parseInt(userID), oldPwd, newPwd);
			if(res == 1) {
				map.put("updatePwd", "success");
			}else if(res == 2){
				map.put("updatePwd", "error");
			}else {
				map.put("updatePwd", "fail");
			}
		}else {
			String pageNum = request.getParameter("pageNum");
			// 判断操作类型  是查看全部还是进行用户的操作
			if(actionType.equals("view")) {
				users = servise.getAllUser();
				int totalPages = servise.getAllPages();
				map.put("state", "success");
				map.put("users", users);
				map.put("pages", totalPages);
				map.put("page", pageNum);
			}else if(actionType.equals("deal")) {
				
				String dealType = request.getParameter("dealType");
				String userID = request.getParameter("userID");
				
				if(dealType.equals("freeze")) {	// 冻结账号
					int res = servise.freezeUserById(Integer.parseInt(userID));
					if(res == 1) {
						map.put("state", "freezeSuccess");
					}else {
						map.put("state", "freezeFail");
					}
				}else if(dealType.equals("unfreeze")) {	//	解冻账号
					int res = servise.unfreezeUserById(Integer.parseInt(userID));
					if(res == 1) {
						map.put("state", "unfreezeSuccess");
					}else {
						map.put("state", "unfreezeFail");
					}
				}
			}
		}
		JSONObject jsonObject = JSONObject.fromObject(map);
		out.println(jsonObject.toString());
		System.out.println("用户管理:" + jsonObject.toString());
		out.flush();
		out.close();
	}
}
