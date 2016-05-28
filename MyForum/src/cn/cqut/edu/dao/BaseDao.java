package cn.cqut.edu.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ParameterMetaData;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.sql.Types;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import java.util.Map;

public class BaseDao {
	// 数据URL
	private static final String url = "jdbc:mysql://localhost:3306/forum?Unicode=true&characterEncoding=UTF-8";

	// 用户名
	private static final String username = "root";

	// 密码
	private static final String password = "554554";

	// 数据库驱动
	private static final String jdbcDriver = "com.mysql.jdbc.Driver";

	// 调用 ParameterMetaData.getParameterType(i + 1) 是否会抛出异常
	protected boolean pmdKnownBroken = false;

	public BaseDao() {

	}

	public BaseDao(boolean pmdKnownBroken) {
		this.pmdKnownBroken = pmdKnownBroken;
	}

	public Connection getConnetion() {

		Connection conn = null;
		try {
			Class.forName(jdbcDriver);
			conn = DriverManager.getConnection(url, username, password);
		} catch (SQLException e) {
			e.printStackTrace();
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}
		return conn;
	}

	/** 根据给定的参数 执行Sql 查询语句，把结果集合放在一个 List<Map<String,Object>> 里面 */
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> executeQuery(String sql, Object[] params) {
		return (List<Map<String, Object>>) this.excuteQuery(sql, params,
				new ListMapHander());
	}

	/** 查村传进来的sql语句, 按照所需要的接口的方法处理结果集,返回所需要的结果集的格式 */
	
	public Object excuteQuery(String sql, Object[] params, ResultSetHander rsh) {
		PreparedStatement stmt = null;
		ResultSet rs = null;
		Connection con = this.getConnetion();
		List<Map<String, Object>> resultList = new ArrayList<Map<String, Object>>();
		try {
			stmt = con.prepareStatement(sql);

			System.out.println("SQL:" + sql + "; Parameters:"
					+ Arrays.deepToString(params));

			// 填充Statement的参数
			fillStatement(stmt, params);
			// 执行查询
			rs = stmt.executeQuery();
			Object obj = rsh.doHander(rs);
			return obj;

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			// 关闭数据库连接
			close(con, stmt, rs);
		}
		return resultList;
	}

	/**
	 * 更新操作  返回值1：成功
	 */
	public int executeUpdate(String sql, Object[] params) {
		PreparedStatement stmt = null;
		Connection con = this.getConnetion();

		int rs = 0;
		try {
			con.setAutoCommit(false);
			// 创建PreparedStatement对象
			stmt = con.prepareStatement(sql);
			// 填充Statement的参数
			fillStatement(stmt, params);
			System.out.println("SQL:" + sql + "; Parameters:"
					+ Arrays.deepToString(params));
			// 执行查询
			rs = stmt.executeUpdate();
			// 提交事务
			con.commit();
			// 把事务设置为原来的状态
			con.setAutoCommit(true);
		} catch (SQLException e) {
			// 在捕获到异常的时候事务回滚
			try {
				con.rollback();
				if (!con.getAutoCommit()) {
					con.setAutoCommit(true);
				}
			} catch (SQLException e1) {
				e.printStackTrace();
				System.out.println("update database error");
			}
			System.out.println("update database error");
		} finally {
			// 关闭数据库连接
			close(con, stmt, null);
		}
		return rs;
	}

	/**
	 * @Title: fillStatement
	 * @Description: 填充SQL参数
	 * @param stmt
	 * @param params
	 * @throws SQLException
	 * @return void
	 */
	private void fillStatement(PreparedStatement stmt, Object[] params)
			throws SQLException {

		/**
		 * 检测参数的个数是否合法，但是有的数据库驱动不支持 stmt.getParameterMetaData()这个方法。
		 * 因此我们有一个一个pmdKnownBroken 变量来标识当前数据驱动是否支持该方法的调用。
		 */
		ParameterMetaData pmd = null;
		if (!pmdKnownBroken) {
			pmd = stmt.getParameterMetaData();
			int stmtCount = pmd.getParameterCount();
			int paramsCount = params == null ? 0 : params.length;

			if (stmtCount != paramsCount) {
				System.out.println("stmtCount:" + stmtCount + ",paramsCount:"
						+ paramsCount);
				throw new SQLException("Wrong number of parameters: expected "
						+ stmtCount + ", was given " + paramsCount);
			}
		}

		// 如果 参数 为 null 直接返回
		if (params == null) {
			return;
		}

		for (int i = 0; i < params.length; i++) {
			if (params[i] != null) {
				stmt.setObject(i + 1, params[i]);
			} else {
				int sqlType = Types.VARCHAR;
				if (!pmdKnownBroken) {
					try {
						sqlType = pmd.getParameterType(i + 1);
					} catch (SQLException e) {
						pmdKnownBroken = true;
					}
				}
				stmt.setNull(i + 1, sqlType);
			}
		}
	}

	/**
	 * 关闭数据库连接
	 */
	private void close(Connection con, Statement stmt, ResultSet rs) {

		if (rs != null) {
			try {
				rs.close();
			} catch (Exception e) {
			} finally {
				if (stmt != null) {
					try {
						stmt.close();
					} catch (SQLException e) {
						e.printStackTrace();
					} finally {
						if (con != null) {
							try {
								con.close();
							} catch (SQLException e) {
								e.printStackTrace();
							}
						}
					}
				}
			}
		}
	}
}