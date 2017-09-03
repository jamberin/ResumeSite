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
	
	public static void writeError (String stackTrace, int lineNumber) {
		Logger logger = Logger.getLogger("Log");
		FileHandler fh;
		
		try {
			fh = new FileHandler(defaultLocation);
			logger.addHandler(fh);
			SimpleFormatter formatter = new SimpleFormatter();
			fh.setFormatter(formatter);
			
			logger.info("ERROR | " + );
		} catch (SecurityException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	public static Calendar getDateTime () {
		Calendar cal = Calendar.getInstance();
		DateFormat sdf = new SimpleDateFormat("yyyy/MM/dd HH:mm:ss");
		String dt = sdf.format(cal.getTime());
		
		return null;
	}
	
	public static void main(String[] args) {
		// TODO Auto-generated method stub

	}

}
