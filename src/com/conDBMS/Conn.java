package com.conDBMS;
import java.sql.Connection;
import java.sql.DriverManager;

public class Conn {
	final String MYSQLDBDRIVER = "com.mysql.jdbc.Driver";
	final String MYSQLDBURL = "jdbc:mysql://localhost/user";
	final String MYSQLDBUSER = "root";
	final String MYSQLDBUSERPASS = "root";
 
	public Connection getConnection() {
		try {
			Class.forName(MYSQLDBDRIVER);
			Connection con = DriverManager.getConnection(MYSQLDBURL,
					MYSQLDBUSER, MYSQLDBUSERPASS);
			return con;
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}

}
