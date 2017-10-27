package com.coreApplication.java.Props;

import java.util.Properties;
import java.io.IOException;

import com.coreApplication.java.logger.DefaultLogger;

public class GetProperties {
	
	private static Properties getDefaultProperties() {
		Properties props = new Properties();
		try {
			props.load(Thread.currentThread().getContextClassLoader().getResourceAsStream("config.properties"));
		} catch (IOException e) {
			DefaultLogger.logMsg("[GetProperties.java] getDefaultProperties Error | IOException: " + e.getMessage(), "ERR");
			e.printStackTrace();
		}
		return props;
	}
	
	public static String getDefaultFilePathRoot() {
		String root = "";
		Properties props = getDefaultProperties();
		root = props.getProperty("path.root");
		return root;
	}
	
	public static String getDefaultLoggerPath() {
		String path = getDefaultFilePathRoot() + "/AppLogs/default.log";
		System.out.println(path);
		return path;
	}
	
	public static String getEmailTemplatePath(String filename) {
		String path = getDefaultFilePathRoot() + "/src/EmailTemplates/" + filename + ".html";
		return path;
	}
}
