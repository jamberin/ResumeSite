package com.coreApplication.java.logger;

import java.util.logging.Logger;
import java.util.logging.FileHandler;
import java.util.logging.SimpleFormatter;

import java.util.Calendar;
import java.util.Date;

import java.text.DateFormat;
import java.text.SimpleDateFormat;

import java.io.IOException;


public class DefaultLogger {
	
	static String defaultLocation = "../AppLogs/default.log";
	
	public static void logMsg (String message, String level) {
		if (level == "INFO" || level == "INF") {
			writeInfo(message);
			
		} else if (level == "WARN" || level == "WAR") {
			writeWarn(message);
		} else if (level == "ERROR" || level == "ERR") {
			writeError(message);
		} else {
			System.err.println(level + " is not a valid log level!");
		}
	}
	
	public static void writeError (String message) {
		Logger logger = Logger.getLogger("Log");
		FileHandler fh;
		
		try {
			fh = new FileHandler(defaultLocation);
			logger.addHandler(fh);
			SimpleFormatter formatter = new SimpleFormatter();
			fh.setFormatter(formatter);
			
			logger.info("ERR | " + getDateTime() + message);
		} catch (SecurityException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	public static void writeWarn (String message) {
		Logger logger = Logger.getLogger("Log");
		FileHandler fh;
		
		try {
			fh = new FileHandler(defaultLocation);
			logger.addHandler(fh);
			SimpleFormatter formatter = new SimpleFormatter();
			fh.setFormatter(formatter);
			
			logger.info("WAR | " + getDateTime() + message);
		} catch (SecurityException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	public static void writeInfo (String message) {
		Logger logger = Logger.getLogger("Log");
		FileHandler fh;
		
		try {
			fh = new FileHandler(defaultLocation);
			logger.addHandler(fh);
			SimpleFormatter formatter = new SimpleFormatter();
			fh.setFormatter(formatter);
			
			logger.info("INF | " + getDateTime() + message);
		} catch (SecurityException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	public static String getDateTime () {
		Calendar cal = Calendar.getInstance();
		DateFormat sdf = new SimpleDateFormat("yyyy/MM/dd HH:mm:ss");
		String dt = sdf.format(cal.getTime());
		return dt;
	}
	
	public static void main(String[] args) {
		// TODO Auto-generated method stub

	}

}
