package com.coreApplication.java.SQL;

import java.io.IOException;
import java.util.Properties;

import com.coreApplication.java.logger.DefaultLogger;

public class GetSQLConnection {

	public static String getConnectionString () {
		//Default connection that pulls from the config.properties file
		DefaultLogger.logMsg("[GetSQLConnection.java] Building default connection string...", "INF");
		String connStr = "";
		Properties props = new Properties();
		try {
			props.load(Thread.currentThread().getContextClassLoader().getResourceAsStream("config.properties"));
			String url = props.getProperty("jdbc.url");
			String port = props.getProperty("jdbc.port");
			String database = props.getProperty("jdbc.database");
			String username = props.getProperty("jdbc.username");
			String password = props.getProperty("jdbc.password");
			connStr = url + ":" + port + ";DatabaseName=" + database + ";user=" + username + ";password=" + password + ";";
		} catch (IOException e) {
			e.printStackTrace();
			connStr = "ERROR PULLING CONNECTION STRING";
			DefaultLogger.logMsg("[GetSQLConnection.java] getConnectionString Error | IOException: " + e.getMessage(), "ERR");
			return connStr;
		}
		DefaultLogger.logMsg("Connection string built: " + connStr, "INF");
		return connStr;
	}
}
