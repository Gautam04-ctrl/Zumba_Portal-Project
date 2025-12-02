package com.zumbaportal.service;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import com.zumbaportal.util.DbUtil;



public class AdminService {

	public boolean validate(String username, String password) throws SQLException, ClassNotFoundException {
		
	
			Connection con=DbUtil.getdbConn();
		       if(con!=null) {
		    	   System.out.println("connected to db");
		       }
		       else {
		    	   System.out.println("failed");
		       }

		
        String sql = "select * from admin_login where username=? and password=?";

      
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, username);
            ps.setString(2, password);
            ResultSet rs = ps.executeQuery();

            return rs.next();

             }
}

