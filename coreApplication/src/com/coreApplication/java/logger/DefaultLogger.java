package com.coreApplication.java.logger;

import java.util.logging.Logger;
import java.util.logging.FileHandler;
import java.util.logging.SimpleFormatter;

import java.util.Calendar;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.io.File;
import java.io.IOException;
import java.io.*;


public class DefaultLogger {
	//TODO: CHANGE BASED ON MACHINE USE, MAY ADD TO PROPERTIES FILE
	static String defaultLocation = "G:\\MainApp\\coreApplication\\AppLogs\\default.log";
	
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
				logger.severe(message);
			} else if (lvl == "WAR") {
				logger.warning(message);
			} else if (lvl == "INF") {
				logger.info(message);
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
		
	}

}
