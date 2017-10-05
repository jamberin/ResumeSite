package com.coreApplication.java.SQL;

import com.coreApplication.java.SQL.GetSQLConnection;
import com.coreApplication.java.logger.DefaultLogger;

import java.sql.DriverManager;
import java.sql.Connection;
import java.sql.SQLException;
import java.sql.Statement;

import java.sql.ResultSet;

public class ContactController {
	
	static String connStr = GetSQLConnection.getConnectionString();
	
	public static ResultSet checkCount (String email) {
		ResultSet rs;
		String query = "SELECT intContactCountLastMonth, intContactCountThisWeek, intContactCountToday FROM ContactController WHERE strEmailAddress = '" + email + "'";
		try {
			DriverManager.registerDriver(new com.microsoft.sqlserver.jdbc.SQLServerDriver());
			Connection conn = DriverManager.getConnection(connStr);
			Statement sta = conn.createStatement();
			rs = sta.executeQuery(query);
		} catch (SQLException e) {
			e.printStackTrace();
			DefaultLogger.logMsg("Error at checkCount [ContactController.java]: " + e.getMessage(), "ERR");
			rs = null;
			DefaultLogger.logMsg("Setting the result set to null!", "WAR");
		}
		return rs;
	}
	
	public static Boolean emailViolationCheck (int lastMonth, int thisWeek, int today) {
		Boolean allow;
		if (lastMonth >= 30 || thisWeek >= 15 || today >= 5) {
			allow = false;
		} else {
			allow = true;
		}
		return allow;
	}
	
	public static Boolean contactPermission (String email) {
		Boolean chk = false;
		ResultSet r = checkCount(email);
		try {
			while (r.next()) {
					int month = r.getInt("intContactCountLastMonth");
					int week = r.getInt("intContactCountThisWeek");
					int today = r.getInt("intContactCountToday");
					chk = emailViolationCheck(month,week,today);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return chk;
	}
	
	public static void contactUpdate (String email) {
		String query = "UPDATE ContactController SET intContactCountLastMonth = intContactCountLastMonth + 1, intContactCountThisWeek = intContactCountThisWeek + 1, intContactCountToday = intContactCountToday + 1 WHERE strEmailAddress = '" + email + "'";
		try {
			DriverManager.registerDriver(new com.microsoft.sqlserver.jdbc.SQLServerDriver());
			Connection conn = DriverManager.getConnection(connStr);
			Statement sta = conn.createStatement();
			sta.executeUpdate(query);
		} catch (SQLException e) {
			e.printStackTrace();
			DefaultLogger.logMsg("Error at contactUpdate [ContactController.java]: " + e.getMessage(), "ERR");
		}
	}
	
	public static void purgeMonth () {
		String query = "UPDATE ContactController SET intContactCountLastMonth = 0";
		try {
			DriverManager.registerDriver(new com.microsoft.sqlserver.jdbc.SQLServerDriver());
			Connection conn = DriverManager.getConnection(connStr);
			Statement sta = conn.createStatement();
			sta.executeUpdate(query);
		} catch (SQLException e) {
			e.printStackTrace();
			DefaultLogger.logMsg("Error at purgeDaily [ContactController.java]: " + e.getMessage(), "ERR");
		}
	}
	
	public static void purgeWeek () {
		String query = "UPDATE ContactController SET intContactCountThisWeek = 0";
		try {
			DriverManager.registerDriver(new com.microsoft.sqlserver.jdbc.SQLServerDriver());
			Connection conn = DriverManager.getConnection(connStr);
			Statement sta = conn.createStatement();
			sta.executeUpdate(query);
		} catch (SQLException e) {
			e.printStackTrace();
			DefaultLogger.logMsg("Error at purgeDaily [ContactController.java]: " + e.getMessage(), "ERR");
		}
	}
	
	public static void purgeDaily () {
		String query = "UPDATE ContactController SET intContactCountToday = 0";
		try {
			DriverManager.registerDriver(new com.microsoft.sqlserver.jdbc.SQLServerDriver());
			Connection conn = DriverManager.getConnection(connStr);
			Statement sta = conn.createStatement();
			sta.executeUpdate(query);
		} catch (SQLException e) {
			e.printStackTrace();
			DefaultLogger.logMsg("Error at purgeDaily [ContactController.java]: " + e.getMessage(), "ERR");
		}
	}

	public static void main(String[] args) {
		String email = "jberinger@wesco.com";
		System.out.println("Checking " + email);
		ResultSet result = checkCount(email);
		
		try {
			while (result.next()) {
					System.out.println(result.getInt("intContactCountLastMonth"));
					System.out.println(result.getInt("intContactCountThisWeek"));
					System.out.println(result.getInt("intContactCountToday"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
}
