package com.zumbaportal.service;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import com.zumbaportal.entity.Member;
import com.zumbaportal.util.DbUtil;

public class MemberService {
	
	public int addMember(Member m) throws Exception {
		
        
        Connection con=DbUtil.getdbConn();
        
	       if(con!=null) {
	    	   System.out.println("connected to db");
	       }
	       else {
	    	   System.out.println("failed");
	       }
	       
	    String sql = "insert into members2(name,email,gender,dob,phone,address,batch_id) VALUES(?,?,?,?,?,?,?)";
        PreparedStatement ps = con.prepareStatement(sql);

        ps.setString(1, m.getName());
        ps.setString(2, m.getEmail());
        ps.setString(3, m.getGender());
        ps.setString(4, m.getDob());
        ps.setString(5, m.getPhone());
        ps.setString(6, m.getAddress());
        ps.setInt(7, m.getBatchId());

        int row= ps.executeUpdate();
        System.out.println(row + " row inserted for Member: " + m.getName());
        con.close();
		return row;
    }

	public List<Member> getAllMembers() throws Exception {
      
        Connection con = DbUtil.getdbConn();
        
        if (con != null) {
        	System.out.println("connected to db");
        }
        else {
        	System.out.println("failed");
        }
        
        
        String sql = "select * from members2";
        PreparedStatement ps = con.prepareStatement(sql);
        ResultSet rs = ps.executeQuery();

        List<Member> list = new ArrayList<>();

        while (rs.next()) {
            Member m = new Member();
            m.setMemberId(rs.getInt("member_id"));
            m.setName(rs.getString("name"));
            m.setEmail(rs.getString("email"));
            m.setGender(rs.getString("gender"));
            m.setDob(rs.getString("dob"));
            m.setPhone(rs.getString("phone"));
            m.setAddress(rs.getString("address"));
            m.setBatchId(rs.getInt("batch_id"));

            list.add(m);
            
            System.out.println("Member fetched: ID=" + m.getMemberId() + ", Name=" + m.getName()
            + ", Email=" + m.getEmail() + ", Batch ID=" + m.getBatchId());
           
           
        }
        
        rs.close();
        con.close();
        return list;
    }

	
	
    public int updateMember(Member m) throws Exception {
        
        Connection con=DbUtil.getdbConn();
        
	       if(con!=null) {
	    	   System.out.println("connected to db");
	       }
	       else {
	    	   System.out.println("failed");
	       }
	    	   
	    String sql = "update members2 set name=?,email=?,gender=?,dob=?,phone=?,address=?,batch_id=? WHERE member_id=?";
        PreparedStatement ps = con.prepareStatement(sql);

        ps.setString(1, m.getName());
        ps.setString(2, m.getEmail());
        ps.setString(3, m.getGender());
        ps.setString(4, m.getDob());
        ps.setString(5, m.getPhone());
        ps.setString(6, m.getAddress());
        ps.setInt(7, m.getBatchId());
        ps.setInt(8, m.getMemberId());

        int row= ps.executeUpdate();
        
        System.out.println(row + " row updated for Member ID: " + m.getMemberId()
        + " [Name: " + m.getName()
        + ", Email: " + m.getEmail()
        + ", Batch ID: " + m.getBatchId() + "]");
    
	       con.close();
		   return row;
			
    }
    
    public int deleteMember(int memberId) throws Exception {
       
        Connection con=DbUtil.getdbConn();
        
	       if(con!=null) {
	    	   System.out.println("connected to db");
	       }
	       else {
	    	   System.out.println("failed");
	       }
	    	   
	       
	    String sql = "delete from members2 where member_id=?";
        PreparedStatement ps = con.prepareStatement(sql);

        ps.setInt(1, memberId);

        int row= ps.executeUpdate();
    
	       con.close();
		   return row;
}
}

