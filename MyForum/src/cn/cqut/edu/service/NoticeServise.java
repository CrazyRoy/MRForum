package cn.cqut.edu.service;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import cn.cqut.edu.dao.BaseDao;
import cn.cqut.edu.util.SysUtil;

public class NoticeServise {
	
	BaseDao dao = new BaseDao();
	
	List<Map<String, Object>> notices = new ArrayList<Map<String, Object>>();
	
	public NoticeServise() {
		
	}
	
	/**
	 * 返回最新公告的方法
	 */
	public List<Map<String, Object>> newNotice() {
		
		String sql = "select * from notice ORDER BY publishTime DESC limit 0,5";
		notices = dao.executeQuery(sql, new Object[0]);
		
		return notices; 
	}
	
	/**
	 * 返回指定页数的公告的方法
	 */
	public List<Map<String,Object>> allNotice(int page){
		String sql = "select * from notice ORDER BY publishTime DESC limit ?,?";
		notices = dao.executeQuery(sql, new Object[]{(page-1)*5, 5});
		return notices;
	}
	
	/**
	 * 返回全部公告的方法
	 */
	public List<Map<String,Object>> allNotice(){
		String sql = "select * from notice ORDER BY publishTime DESC";
		notices = dao.executeQuery(sql, new Object[0]);
		return notices;
	}

	/**
	 * 返回所有公告的页数
	 * @return
	 */
	public int getAllNoticesPages() {
		String sql = "select count(*) AS noticesTotal from notice";
		notices = dao.executeQuery(sql, new Object[0]);
		int totalPages  = 0;
		int num = Integer.parseInt(notices.get(0).get("noticesTotal") + "");
		if(num % 5 != 0) {
			totalPages += 1;
		}
		totalPages += (num/5);
		return totalPages;
	}
	
	/**
	 * 返回某一个公告的信息的接口
	 */
	public List<Map<String,Object>> getPost(int noticeID) {
		String sql = "select notice.id, " +
							"notice.title, " +
							"notice.content, " +
							"notice.publishTime from notice where notice.id=?";
		notices = dao.executeQuery(sql, new Object[]{noticeID});
		return notices;
	}
	
	/**
	 * 根据id删除公告
	 */
	public int deleteNoticeById(int noticeID) {
		String sql = "delete from notice where id = ?";
		int res = dao.executeUpdate(sql, new Object[]{noticeID});
		return res;
	}
	
	/**
	 * 添加公告
	 */
	public int addNotice(String title, String content) {
		String sql = "insert into notice (title, content, publishTime) values (?,?,?)";
		String time = SysUtil.getCurrentTime();
		int rs = dao.executeUpdate(sql, new Object[]{title, content, time});
		return rs;
	}
}
