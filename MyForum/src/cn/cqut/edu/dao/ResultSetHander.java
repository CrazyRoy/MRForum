package cn.cqut.edu.dao;

import java.sql.ResultSet;
import java.sql.SQLException;

public interface ResultSetHander {
	
	/**
	 * 自定义的处理执行 SQL 语句返回结果集的接口
	 */
	public Object doHander(ResultSet rs) throws SQLException;
}
