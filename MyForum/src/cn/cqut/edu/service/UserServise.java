package cn.cqut.edu.service;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import cn.cqut.edu.dao.BaseDao;
import cn.cqut.edu.bean.*;

public class UserServise {

	BaseDao dao = new BaseDao();
	
	List<Map<String, Object>> users = new ArrayList<Map<String, Object>>();

	/**
	 * 获取用户信息
	 * 
	 * @return
	 */
	public List<Object> login(String account, String password) {
		String sql = "select * from user where account=? and password=?";
		List<Map<String, Object>> lm = dao.executeQuery(sql, new Object[] {
				account, password });

		List<Object> rl = new ArrayList<Object>();

		// 登录成功
		if (lm.size() > 0) {
			System.out.println("lim.size > 0");
			Map<String, Object> map = lm.get(0);
			System.out.println("luoluo:" + map.toString());
			User user = new User();
			user.setAccount(map.get("account").toString());
			user.setPassword(map.get("password").toString());
			user.setName(map.get("name").toString());
			user.setEmail(map.get("email").toString());
			user.setGender(map.get("gender").toString());
			user.setType(Integer.parseInt(map.get("type").toString()));
			user.setUserID(Integer.parseInt(map.get("userID").toString()));
			user.setPhoto_address(map.get("photo").toString());
			rl.add(1);
			rl.add(user);
		}
		// 登录不成功 可有有两种愿意，1.帐号不存在 2.密码错误
		else {
			sql = "select * from user where account=?";
			lm = dao.executeQuery(sql, new Object[] { account });
			if (lm.size() == 0) {// 用户不不存在错误
				System.out.println("this");
				rl.add(3);
			} else {// 密码错误
				rl.add(2);
			}
			rl.add(null);
		}
		return rl;
	}

	/**
	 * 获取所有的用户信息（后台）
	 * 
	 * @return
	 */
	public List<Object> login(String account, String password, String actionType) {
		String sql = "select type from user where account=? and password=?";
		List<Map<String, Object>> lm = dao.executeQuery(sql, new Object[] {
				account, password });
		List<Object> rl = new ArrayList<Object>();

		// 登录成功
		if (lm.size() > 0) {
			if(lm.get(0).get("type").equals(1)){
				rl.add(1);
			}
		}else {		// 登录不成功 可有有三种原因，1.帐号不存在 2.密码错误3.没有权限
			sql = "select * from user where account=?";
			lm = dao.executeQuery(sql, new Object[] { account });
			
			String sql2 = "select password from user where account=?";
			List<Map<String, Object>> lm2 = dao.executeQuery(sql2,
					new Object[] { account });
			
			if (lm.size() == 0) {// 用户不不存在错误
				rl.add(3);
			} else if(!lm2.get(0).get("password").equals(password)){// 密码错误
				rl.add(2);
			}else {		// 用户没有权限
				rl.add(4);
			}
		}
		return rl;
	}

	/**
	 * 用户注册的方法 1:注册成功
	 */

	public int register(String name, String account, String password) {

		String sql = "insert into user (account,name,password,type,photo,email,gender,state) values (?,?,?,?,?,?,?,?)";

		int result = dao.executeUpdate(sql, new Object[] { account, name,
				password, 2, "/MyForum/images/head/default.jpg", "none", "none", 0});

		return result;
	}
	
	/**
	 * 根据某一个ID返回该用户的信息
	 */
	public List<Map<String, Object>> getUserById(int userID) {
		String sql = "select * from user where userID = ?";
		users = dao.executeQuery(sql,new Object[]{userID});
		return users;
	}
	
	/**
	 * 更新用户信息
	 */
	public int updateUser(int userID, String account, String name, String gender, String email) {
		String sql = "update user set account = ?, name = ?, gender = ?, email = ? where userID = ?";
		int res = dao.executeUpdate(sql, new Object[]{account, name, gender, email, userID});
		return res;
	}
	
	/**
	 * 更新密码
	 */
	public int updatePwd(int userID, String oldPwd, String newPwd) {
		String sql = "select password from user where userID = ?";
		users = dao.executeQuery(sql, new Object[]{userID});
		if(!users.get(0).get("password").equals(oldPwd)) {	// 原密码输入错误
			return 2;
		}else {
			sql = "update user set password = ? where userID = ?";
			int res = dao.executeUpdate(sql, new Object[]{newPwd, userID});
			return res;
		}
	}
	
	/**
	 * 获取所有的用户信息
	 */
	public List<Map<String, Object>> getAllUser() {
		String sql = "select * from user";
		users = dao.executeQuery(sql, new Object[0]);
		return users;
	}
	
	/**
	 * 返回所有用户的页数
	 * @return
	 */
	public int getAllPages() {
		String sql = "select count(*) AS userTotal from user";
		users = dao.executeQuery(sql, new Object[0]);
		int totalPages  = 0;
		int num = Integer.parseInt(users.get(0).get("userTotal") + "");
		if(num % 10 != 0) {
			totalPages += 1;
		}
		totalPages += (num/10);
		return totalPages;
	}
	
	/**
	 * 冻结用户
	 */
	public int freezeUserById(int userID) {
		String sql = "update user set state = 1 where userID = ?";
		int res = dao.executeUpdate(sql, new Object[]{userID});
		return res;
	}
	
	/**
	 * 解冻用户
	 */
	public int unfreezeUserById(int userID) {
		String sql = "update user set state = 0 where userID = ?";
		int res = dao.executeUpdate(sql, new Object[]{userID});
		return res;
	}
	
	/**
	 * 查询某个用户是否被冻结  1:被冻结  0：正常
	 */
	public int checkState(int userID) {
		String sql = "select state from user where userID = ?";
		users = dao.executeQuery(sql, new Object[]{userID});
		int state = Integer.parseInt("" + users.get(0).get("state"));
		return state;
	}
	
	/**
	 * 处理用户上传头像
	 */
	public int updatePhoto(int userID, String photoPath) {
		String sql = "update user set photo = ? where userID = ?";
		int res = dao.executeUpdate(sql, new Object[]{photoPath, userID});
		return res;
	}
}
