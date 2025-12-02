package com.zumbaportal.util;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
public class DbUtil extends DbHelper{
	public static Connection getdbConn() throws ClassNotFoundException, SQLException {
		Connection con;
		//register the vendor driver
		Class.forName(DRIVER_CLASS);
		con=DriverManager.getConnection(DBURL,USRNAME,PASSWRD);
		return con;
	}
	
}
