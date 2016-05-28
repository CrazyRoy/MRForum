package cn.cqut.edu.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import cn.cqut.edu.dao.BaseDao;
import cn.cqut.edu.util.SysUtil;

public class PostServise {
	
	BaseDao dao = new BaseDao();
	
	public PostServise() {}
	
	List<Map<String, Object>> posts = new ArrayList<Map<String, Object>>();
	
	Map<String, Object> post = new HashMap<String,Object>();
	
	/**
	 * 获取指定页数的帖子
	 */
	public List<Map<String, Object>> getAllPosts(int page) {
		String sql = "select * from post ORDER BY publishTime DESC limit ?,?";
		posts = dao.executeQuery(sql, new Object[]{(page-1)*10, 10});
		return posts;
	}
	
	/**
	 * 所有的帖子对应的页数
	 */
	public int getAllPages() {
		String sql = "select count(*) AS postTotal from post";
		posts = dao.executeQuery(sql, new Object[0]);
		int totalPages  = 0;
		int num = Integer.parseInt(posts.get(0).get("postTotal") + "");
		if(num % 10 != 0) {
			totalPages += 1;
		}
		totalPages += (num/8);
		return totalPages;
	}
	
	/**
	 * 定义返回帖子所有类型的接口
	 */
	public List<Map<String, Object>> allTypes() {
		String sql = "select * from posttype";
		posts = dao.executeQuery(sql, new Object[0]);
		return posts;
	}
	
	/**
	 * 返回指定类型的帖子接口
	 */
	public List<Map<String, Object>> posts(int type) {
		String sql = "select * from post where type = ?";
		posts = dao.executeQuery(sql, new Object[] {type});
		return posts;
	}
	
	/**
	 * 根据模糊搜索获取帖子的接口
	 */
	public List<Map<String, Object>> posts(String sql) {
		posts = dao.executeQuery(sql, new Object[0]);
		return posts;
	}
	
	/**
	 * 返回最新的帖子的接口
	 */
	public List<Map<String, Object>> newPosts() {
		String sql = "select * from post ORDER BY publishTime DESC limit 0,5";
		posts = dao.executeQuery(sql, new Object[0]);
		return posts;
	}
	
	/**
	 * 返回最火的帖子的接口
	 */
	public List<Map<String, Object>> hotPosts() {
		String sql = "select * from post ORDER BY pageview DESC limit 0,5";
		posts = dao.executeQuery(sql, new Object[0]);
		
		return posts;
	}
	
	/**
	 * 返回某一个帖子的信息的接口
	 */
	public List<Map<String,Object>> getPost(int postID) {
		String sql = "select post.postID, " +
							"post.title, " +
							"post.content, " +
							"post.publishTime, " +
							"post.pageview, " +
							"`user`.userID, " + 
							"`user`.account as account, " +
							"`user`.photo as userPhoto, " +
							"posttype.name as postTypeName " +
							"from post left join `user` on " +
							"post.operator = `user`.userID  " +
							"left JOIN posttype on " +
							"post.type = postType.postTypeID where post.postID=?";
		posts = dao.executeQuery(sql, new Object[]{postID});
		
		//	因为根据ID查询出的结果只会有一个
		//post = types.get(0);
		return posts;
	}
	
	/**
	 * 访问量加1
	 */
	public int addPageView(int postID) {
		String sql = "update post set pageview = pageview + 1 where postID = ?";
		int rs = dao.executeUpdate(sql, new Object[]{postID});
		return rs;
	}
	
	/**
	 * 根据帖子的ID删除帖子  由于设置外键  可以联级删除
	 */
	public int deletePost(int postID) {
		String sql = "delete from post where postID = ?";
		int rs = dao.executeUpdate(sql, new Object[]{postID});
		return rs;
	}
	
	/**
	 * 用户发表帖子的方法
	 */
	public int addPost(int userID, int postType, String title, String content) {
		//	获取当前时间存入数据库  构造时间的字符串
		String time = SysUtil.getCurrentTime();
		String sql = "insert into post (title, content, publishTime, operator, type) values (?,?,?,?,?)";
		int rs = dao.executeUpdate(sql, new Object[]{title, content, time, userID, postType});
		
		//  将指定的帖子的所在类型数量加一
		sql = "update posttype set count = count + 1 where postTypeID = ?";
		rs = dao.executeUpdate(sql, new Object[]{postType});
		return rs;
	}
	
	/**
	 * 获取指定用户的帖子列表
	 * @return
	 */
	public List<Map<String,Object>> getPosts(int userID, int page) {
		String sql = "select * from post where operator = ? ORDER BY publishTime DESC limit ?,?";
		posts = dao.executeQuery(sql, new Object[]{userID, (page-1)*10, 10});
		return posts;
	}
	
	// 返回指定用户的帖子总页数
	public int getTotalPostPages(int userID) {
		String sql = "select count(*) AS postTotal from post where operator = ?";
		posts = dao.executeQuery(sql, new Object[]{userID});
		int totalPages  = 0;
		int num = Integer.parseInt(posts.get(0).get("postTotal") + "");
		if(num % 10 != 0) {
			totalPages += 1;
		}
		totalPages += (num/10);
		return totalPages;
	}
}