package com.coreApplication.java.SQL;

import com.coreApplication.java.SQL.GetSQLConnection;
import com.coreApplication.java.logger.DefaultLogger;

import java.sql.DriverManager;
import java.sql.Connection;
import java.sql.SQLException;
import java.sql.Statement;
import java.sql.ResultSet;

public class ContactController {
	
	private static String connStr = GetSQLConnection.getConnectionString();
		
	private static ResultSet checkCount (String query) {
		ResultSet rs;
		try {
			DriverManager.registerDriver(new com.microsoft.sqlserver.jdbc.SQLServerDriver());
			Connection conn = DriverManager.getConnection(connStr);
			Statement sta = conn.createStatement();
			rs = sta.executeQuery(query);
		} catch (SQLException e) {
			e.printStackTrace();
			DefaultLogger.logMsg("[ContactController.java] Error at checkCount: " + e.getMessage(), "ERR");
			rs = null;
			DefaultLogger.logMsg("[ContactController.java] Setting the result set to null!", "WAR");
		}
		return rs;
	}
	
	private static Integer lastDay(String email) {
		int count = 0;
		String query = "SELECT COUNT(*) AS COUNT FROM EmailAudit WHERE strEmailAddress = '" + email + "' AND dtLastSend > DATEADD(DAY,-1,GETDATE())";
		ResultSet rs = checkCount(query);
		try {
			while (rs.next()) {
				count = rs.getInt("COUNT");
			}
		} catch (SQLException e) {
			e.printStackTrace();
			DefaultLogger.logMsg("[ContactController.java] Error at lastDay: " + e.getMessage(), "ERR");
		}
		return count;
	}
	
	private static Integer lastWeek(String email) {
		int count = 0;
		String query = "SELECT COUNT(*) AS COUNT FROM EmailAudit WHERE strEmailAddress = '" + email + "' AND dtLastSend > DATEADD(DAY,-7,GETDATE())";
		ResultSet rs = checkCount(query);
		try {
			while (rs.next()) {
				count = rs.getInt("COUNT");
			}
		} catch (SQLException e) {
			e.printStackTrace();
			DefaultLogger.logMsg("[ContactController.java] Error at lastWeek: " + e.getMessage(), "ERR");
		}
		return count;
	}
	
	private static Integer lastMnth(String email) {
		int count = 0;
		String query = "SELECT COUNT(*) AS COUNT FROM EmailAudit WHERE strEmailAddress = '" + email + "' AND dtLastSend > DATEADD(DAY,-30,GETDATE())";
		ResultSet rs = checkCount(query);
		try {
			while (rs.next()) {
				count = rs.getInt("COUNT");
			}
		} catch (SQLException e) {
			e.printStackTrace();
			DefaultLogger.logMsg("[ContactController.java] Error at lastMnth: " + e.getMessage(), "ERR");
		}
		return count;
	}
	
	public static Boolean permissionCheck(String email) {
		Boolean chk = false;
		int month = lastMnth(email);
		int week = lastWeek(email);
		int day = lastDay(email);
		if (month > 30 || week > 15 || day > 5) {
			chk = false;
			DefaultLogger.logMsg("[ContactController.java] User contact frequency violation!", "WAR");
		} else {
			chk = true;
			DefaultLogger.logMsg("[ContactController.java] User permission pass...", "INF");
		}
		return chk;
	}
}
