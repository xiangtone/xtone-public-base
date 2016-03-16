package com.account.service;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.account.dao.bean.StatisticsCurrent;
import com.account.dao.bean.StatisticsDay;
import com.account.dao.impl.StatisticsCurrentImpl;
import com.account.dao.impl.StatisticsDayImpl;
import com.account.dao.impl.UserDaoImpl;
import com.account.domain.User;
import com.account.utils.AES;
import com.account.utils.TimeUtil;
import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONObject;

/**
 * Servlet implementation class StatisticsServlet
 * 
 * 统计的servlet
 * 
 */
@WebServlet("/StatisticsServlet")
public class StatisticsServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/** 发送到通知栏的统计 */
	private final String SendNotifi = "SendNotifi";
	/** 点击下载的统计 */
	private final String ClickDown = "ClickDown";
	/** 下载成功的统计 */
	private final String DownSuccess = "DownSuccess";
	/*** 安装成功的统计 */
	private final String InstallSuccess = "InstallSuccess";

	// http://192.168.1.153:8080/adTest/StatisticsServlet?action=SendNotifi&packageName=com.aaa

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public StatisticsServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.setContentType("text/html; charset=utf-8");
		String encode = request.getParameter("encode");
		  System.err.println(encode);
		if (encode != null && !"".equals(encode)) {
			String KeyOfAES = "f17d2fb4eff547c8bebc1e7cc4dcd43c";
			String decode = AES.DecodeString(encode, KeyOfAES);
            System.err.println(decode);
			JSONObject jsonObject = JSON.parseObject(decode);

			String action = jsonObject.getString("action");
			String packageName = jsonObject.getString("packageName");
			switch (action) {
			case SendNotifi:
				// 统计 发送到通知栏
				statisticSendNotifi(packageName);
				response.getWriter().print("SendNotifi = 1");
				break;
			case ClickDown:
				// 统计 点击下载
				statisticClickDown(packageName);
				response.getWriter().print("ClickDown = 1");
				break;

			case DownSuccess:
				// 统计 下载成功
				statisticDownSuccess(packageName);
				response.getWriter().print("DownSuccess = 1");
				break;
			case InstallSuccess:
				// 统计安装成功的
				statisticInstallSuccess(packageName);
				response.getWriter().print("InstallSuccess = 1");
				break;

			default:
				break;
			}
		}

	}

	/**
	 * 统计安装成功的
	 * 
	 * @param packageName
	 */
	private void statisticInstallSuccess(String packageName) {
		statisticSetData(packageName, InstallSuccess, new ISection() {
			@Override
			public void setData(Object obj) {
				StatisticsCurrent statisticsCurrent = (StatisticsCurrent) obj;
				statisticsCurrent.setInstallSuccessCount(statisticsCurrent.getInstallSuccessCount() + 1);

			}
		});

	}

	/**
	 * 统计 下载成功
	 * 
	 * @param packageName
	 */
	private void statisticDownSuccess(String packageName) {
		statisticSetData(packageName, DownSuccess, new ISection() {
			@Override
			public void setData(Object obj) {
				StatisticsCurrent statisticsCurrent = (StatisticsCurrent) obj;
				statisticsCurrent.setDownSuccessCount(statisticsCurrent.getDownSuccessCount() + 1);

			}
		});

	}

	/**
	 * 统计 点击下载
	 * 
	 * @param packageName
	 */
	private void statisticClickDown(String packageName) {
		statisticSetData(packageName, ClickDown, new ISection() {
			@Override
			public void setData(Object obj) {
				StatisticsCurrent statisticsCurrent = (StatisticsCurrent) obj;
				statisticsCurrent.setClickDownCount(statisticsCurrent.getClickDownCount() + 1);

			}
		});

	}

	/**
	 * 统计 发送到通知栏
	 * 
	 * @param packageName
	 */
	private void statisticSendNotifi(String packageName) {
		statisticSetData(packageName, SendNotifi, new ISection() {
			@Override
			public void setData(Object obj) {
				StatisticsCurrent statisticsCurrent = (StatisticsCurrent) obj;
				statisticsCurrent.setSendNotifiCount(statisticsCurrent.getSendNotifiCount() + 1);

			}
		});

	}

	/**
	 * 统计设置数据
	 * 
	 * @param packageName
	 * @param section
	 */
	private void statisticSetData(String packageName, String action, ISection section) {
		StatisticsCurrentImpl impl = new StatisticsCurrentImpl();
		StatisticsCurrent statisticsCurrent = getStatisticsCurrent(packageName);
		if (statisticsCurrent != null) {
			statisticsDay(statisticsCurrent);
			section.setData(statisticsCurrent);
			statisticsCurrent.setDate(TimeUtil.getCurrentDate());
			statisticsCurrent.setUpdateDate(new java.sql.Date(new java.util.Date().getTime()));
			impl.update(statisticsCurrent);
		} else {
			statisticsCurrent = createStatisticsCurrent(packageName);
			switch (action) {
			case SendNotifi:
				// 统计 发送到通知栏
				statisticsCurrent.setSendNotifiCount(1);
				break;
			case ClickDown:
				// 统计 点击下载
				statisticsCurrent.setClickDownCount(1);
				break;
			case DownSuccess:
				// 统计 下载成功
				statisticsCurrent.setDownSuccessCount(1);
				break;
			case InstallSuccess:
				// 统计安装成功的
				statisticsCurrent.setInstallSuccessCount(1);
				break;
			}
			impl.add(statisticsCurrent);
		}
	}

	/**
	 * 添加每日的统计
	 * 
	 * @param packageName
	 * @param statisticsCurrent
	 */
	private void statisticsDay(StatisticsCurrent statisticsCurrent) {
		if (!TimeUtil.getCurrentDate().equals(statisticsCurrent.getDate())) {
			StatisticsDayImpl impl = new StatisticsDayImpl();
			StatisticsDay statisticsDay = new StatisticsDay();
			statisticsDay.setDate(statisticsCurrent.getDate());
			statisticsDay.setPackageName(statisticsCurrent.getPackageName());
			statisticsDay.setSendNotifiCountDay(statisticsCurrent.getSendNotifiCount());
			statisticsDay.setClickDownCountDay(statisticsCurrent.getClickDownCount());
			statisticsDay.setDownSuccessCountDay(statisticsCurrent.getDownSuccessCount());
			statisticsDay.setInstallSuccessCountDay(statisticsCurrent.getInstallSuccessCount());
			statisticsDay.setCreateDate(statisticsCurrent.getUpdateDate());
			impl.add(statisticsDay);

			StatisticsCurrentImpl currentImpl = new StatisticsCurrentImpl();
			statisticsCurrent.setSendNotifiCount(0);
			statisticsCurrent.setClickDownCount(0);
			statisticsCurrent.setDownSuccessCount(0);
			statisticsCurrent.setInstallSuccessCount(0);
			currentImpl.update(statisticsCurrent);

		}
	}

	private interface ISection {
		public void setData(Object obj);
	}

	/**
	 * 创建一个用于当前统计的对象
	 * 
	 * @param packageName
	 * @return
	 */
	private StatisticsCurrent createStatisticsCurrent(String packageName) {
		StatisticsCurrent statisticsCurrent = new StatisticsCurrent();
		statisticsCurrent.setPackageName(packageName);
		statisticsCurrent.setDate(TimeUtil.getCurrentDate());
		statisticsCurrent.setUpdateDate(new java.sql.Date(new java.util.Date().getTime()));
		return statisticsCurrent;
	}

	private StatisticsCurrent getStatisticsCurrent(String packageName) {
		StatisticsCurrentImpl impl = new StatisticsCurrentImpl();
		StatisticsCurrent statisticsCurrent = impl.findByPageName(packageName);
		return statisticsCurrent;
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
