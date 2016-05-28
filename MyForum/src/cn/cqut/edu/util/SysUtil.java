package cn.cqut.edu.util;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;

public class SysUtil {

	private static SimpleDateFormat format = new SimpleDateFormat(
			"yyyy-MM-dd HH:mm:ss");

	/**
	 * 功能：拼接分页时候的html代码 author:hujun
	 * 
	 * @param allCount
	 *            总的记录数
	 * @param currentPage
	 *            当前页数
	 * @param limit
	 *            每页显示记录数
	 * @param url
	 *            没有分页是的查询条件
	 * @return 拼接好了的html代码
	 */
	public static String createPage(int allCount, int currentPage, int limit,
			String url) {
		String pageStr = "";// 存储最终拼接好的html

		if (allCount == 0) {
			return "";
		}

		synchronized (pageStr) {
			int allPage = (int) Math.ceil((allCount * 1.0) / limit);// 计算出总有多少页
			int i, j;// 分页变量
			String pageCnfig = url;
			int index = pageCnfig.indexOf("?");// 判断原来的url里面是否有参数，有参数就在原来的基础上添加，没有就加添加

			for (i = currentPage - 1; i >= currentPage - 4; i--) {
				pageCnfig = url;
				if (i >= 1) {
					if (index > 0) {
						pageCnfig += "&currentPage=" + i + "&limit=" + limit;
					} else {
						pageCnfig += "?currentPage=" + i + "&limit=" + limit;
					}
					pageStr = "<span><a href='" + pageCnfig + "'>" + i
							+ "</a></span>" + pageStr;
				} else {
					break;
				}
			}

			if (currentPage != 1) {
				pageCnfig = url;
				if (index > 0) {
					pageCnfig += "&currentPage=" + (currentPage - 1)
							+ "&limit=" + limit;
				} else {
					pageCnfig += "?currentPage=" + (currentPage - 1)
							+ "&limit=" + limit;
				}
				pageStr = "<span><a href='" + pageCnfig + "'>上一页</a></span>"
						+ pageStr;
			}

			for (j = currentPage; j <= currentPage + 4; j++) {
				pageCnfig = url;
				if (j <= allPage) {
					if (index > 0) {
						pageCnfig += "&currentPage=" + j + "&limit=" + limit;
					} else {
						pageCnfig += "?currentPage=" + j + "&limit=" + limit;
					}
					if (currentPage == j) {
						pageStr = pageStr + "<span><a href='" + pageCnfig
								+ "' class='currentPage'>" + j + "</a></span>";
					} else {
						pageStr = pageStr + "<span><a href='" + pageCnfig
								+ "'>" + j + "</a></span>";
					}
				} else {
					break;
				}

			}

			if (currentPage != allPage) {
				pageCnfig = url;
				if (index > 0) {
					pageCnfig += "&currentPage=" + (currentPage + 1)
							+ "&limit=" + limit;
				} else {
					pageCnfig += "?currentPage=" + (currentPage + 1)
							+ "&limit=" + limit;
				}
				pageStr += "<span><a href='" + pageCnfig + "'>下一页</a></span>";
			}
		}

		return pageStr;

	}

	public static String formatDate(Date date) {
		return format.format(date);
	}

	public static Date praseDate(String dateStr) throws ParseException {
		return format.parse(dateStr);
	}

	/*public static void main(String[] args) throws ParseException {
		System.out.println(praseDate("2014-01-14 00:00:06"));
	}*/
	
	// 返回当前时间的字符串
	public static String getCurrentTime() {
		String time = "";
		Calendar now = Calendar.getInstance();
		int year = now.get(Calendar.YEAR);
		String strY = "" + year;
		
		int month = now.get(Calendar.MONTH) + 1;
		String strM = checkSmallTen(month);
		
		int day = now.get(Calendar.DAY_OF_MONTH);
		String strD = checkSmallTen(day);
		int hour = now.get(Calendar.HOUR_OF_DAY);
		String strH = "";
		if(hour < 10) {
			strH = " : 0" + hour;
		}else {
			strH = " : " + hour; 
		}
		int min = now.get(Calendar.MINUTE);
		String strMin = checkSmallTen(min);
		int second = now.get(Calendar.SECOND);
		String strSecond = checkSmallTen(second);
		// 当前时间的字符串
		time = strY + strM + strD + strH + strMin + strSecond;
		return time;
	}
	
	// 判断是否小于10
	public static String checkSmallTen(int num) {
		String str = "";
		if(num < 10) {
			str = "-0" + num;
		}else {
			str = "-" + num;
		}
		return str;
	}
}
