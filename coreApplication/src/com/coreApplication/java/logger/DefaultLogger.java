package com.coreApplication.java.logger;

import java.util.logging.Logger;

import java.util.logging.FileHandler;
import java.util.logging.Level;
import java.util.logging.SimpleFormatter;

import java.io.IOException;

import com.coreApplication.java.Props.GetProperties;


public class DefaultLogger {
	static String defaultLocation = GetProperties.getDefaultLoggerPath();
	
	public static void logMsg (String message, String level) {
		if (level == "INFO" || level == "INF") {
			writeMsg(message, "INF");
		} else if (level == "WARN" || level == "WAR") {
			writeMsg(message, "WAR");
		} else if (level == "ERROR" || level == "ERR") {
			writeMsg(message, "ERR");
		} else {
			System.err.println(level + " is not a valid log level!");
		}
	}
	
	public static void writeMsg (String message, String lvl) {
		System.setProperty("java.util.logging.SimpleFormatter.format", "[%1$tF %1$tT] [%4$-7s] %5$s %n");
		Logger logger = Logger.getLogger("com.coreApplication.java.logger");
		FileHandler fh = null;
		try {
			fh = new FileHandler(defaultLocation, true);
			logger.addHandler(fh);
			SimpleFormatter formatter = new SimpleFormatter();
			
			fh.setFormatter(formatter);
			if (lvl == "ERR") {
				logger.log(Level.SEVERE, message);
			} else if (lvl == "WAR") {
				logger.log(Level.WARNING, message);
			} else if (lvl == "INF") {
				logger.log(Level.INFO, message);
			}
		} catch (SecurityException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		} finally {
			fh.close();
		}
	}
	
	public static void main(String[] args) {
	}
}
