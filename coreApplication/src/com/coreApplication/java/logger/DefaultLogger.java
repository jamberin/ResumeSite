package com.coreApplication.java.logger;

import java.util.logging.Logger;
import java.util.logging.FileHandler;
import java.util.logging.Level;
import java.util.logging.SimpleFormatter;

import java.util.Calendar;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.io.IOException;


public class DefaultLogger {
	//TODO: CHANGE BASED ON MACHINE USE, MAY ADD TO PROPERTIES FILE
	static String defaultLocation = "C:\\MainApp\\coreApplication\\AppLogs\\default.log";
	
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
		Logger logger = Logger.getLogger("com.coreApplication.java.logger");
		FileHandler fh = null;
		try {
			fh = new FileHandler(defaultLocation, true);
			logger.addHandler(fh);
			SimpleFormatter formatter = new SimpleFormatter();
			fh.setFormatter(formatter);
			if (lvl == "ERR") {
				logger.log(Level.SEVERE, message + "\n");
			} else if (lvl == "WAR") {
				logger.log(Level.WARNING, message + "\n");
			} else if (lvl == "INF") {
				logger.log(Level.INFO, message + "\n");
			}
		} catch (SecurityException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		} finally {
			fh.close();
		}
	}
	
	public static String getDateTime () {
		Calendar cal = Calendar.getInstance();
		DateFormat sdf = new SimpleDateFormat("yyyy/MM/dd HH:mm:ss");
		String dt = sdf.format(cal.getTime());
		return dt;
	}
	
	public static void main(String[] args) {
		logMsg("This is an info level message", "INFO");
		logMsg("This is another info level message", "INFO");
	}

}
