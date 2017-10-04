package com.coreApplication.java.SQL;

import com.coreApplication.java.SQL.GetSQLConnection;
import com.coreApplication.java.logger.DefaultLogger;

import java.sql.DriverManager;
import java.sql.Connection;
import java.sql.SQLException;
import java.sql.Statement;

public class EmailAudit {

	public static void writeRecord(String name, String emailAddress, String message, String phone) {
		DefaultLogger.logMsg("New EmailAudit record being created...", "INF");
		String connStr = GetSQLConnection.getConnectionString();
		String query = "INSERT INTO EmailAudit (strName, strEmailAddress, strMessage, strPhone) VALUES ( '" + name + "','" + emailAddress + "','" + message + "','" + phone + "')";
		//Building connection
		try {
			DriverManager.registerDriver(new com.microsoft.sqlserver.jdbc.SQLServerDriver());
			Connection conn = DriverManager.getConnection(connStr);
			Statement sta = conn.createStatement();
			DefaultLogger.logMsg("Starting insert statement...", "INF");
			sta.executeUpdate(query);
		} catch (SQLException e) {
			DefaultLogger.logMsg("SQL Exception writing new record!", "ERR");
			e.printStackTrace();
		} catch (Exception e) {
			DefaultLogger.logMsg("Exception writing new record!", "ERR");
			e.printStackTrace();
		}
		DefaultLogger.logMsg("Write record end...", "INF");
	}
	
	public static void main(String[] args) {
	}
}
