package com.zumbaportal.service;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import com.zumbaportal.entity.Batch;
import com.zumbaportal.util.DbUtil;

public class BatchService {
	
	
	public int addBatch(Batch batch) throws Exception {
       
		Connection con=DbUtil.getdbConn();
		
	       if(con!=null) {
	    	   System.out.println("connected to db");
	       }
	       else {
	    	   System.out.println("failed");
	       }
	       
	    String sql = "insert into batches(batch_name, timing) values(?, ?)";
	    
        PreparedStatement ps = con.prepareStatement(sql);

        ps.setString(1, batch.getBatchName());
        ps.setString(2, batch.getTiming()); 

        int row= ps.executeUpdate();
        System.out.println(row +" row got inserted for the "+ batch.getBatchName());
        con.close();
		return row;
        
     
    }

	public List<Batch> getAllBatches() throws Exception {

	    Connection con = DbUtil.getdbConn();
	    List<Batch> list = new ArrayList<>();
	    
	    if (con != null) {
	        System.out.println("connected to db");
	    } else {
	        System.out.println("failed");
	        return null;
	    }

	    String sql = "select batch_id, batch_name, timing from batches";

	    PreparedStatement ps = con.prepareStatement(sql);
	    ResultSet rs = ps.executeQuery();

	    while (rs.next()) {
	        Batch b = new Batch();
	        b.setBatchId(rs.getInt("batch_id"));
	        b.setBatchName(rs.getString("batch_name"));
	        b.setTiming(rs.getString("timing"));

	        list.add(b);
	    }

	    rs.close();
	    con.close();

	    System.out.println(list.size() + " batches fetched from database.");

	    return list;
	}

	
    public int updateBatch(Batch batch) throws Exception {
     
		Connection con=DbUtil.getdbConn();
		
	       if(con!=null) {
	    	   System.out.println("connected to db");
	       }
	       else {
	    	   System.out.println("failed");
	       }

	       String sql = "update batches set batch_name=?, timing=? where batch_id=?";
	       PreparedStatement ps = con.prepareStatement(sql);

	       ps.setString(1, batch.getBatchName());
	       ps.setString(2, batch.getTiming());  
	       ps.setInt(3, batch.getBatchId());

        int row= ps.executeUpdate();
        
        System.out.println(row + " row updated for batch ID: " 
                + batch.getBatchId() + " [Name: " 
                + batch.getBatchName() + ", Timing: " 
                + batch.getTiming() + "]");
        con.close();
		return row;
    }

    
    public int deleteBatch(int batchId) throws Exception {
       

		Connection con=DbUtil.getdbConn();
		
	       if(con!=null) {
	    	   System.out.println("connected to db");
	       }
	       else {
	    	   System.out.println("failed");
	       }

	    String sql = "delete from batches where batch_id=?";
	       
        PreparedStatement ps = con.prepareStatement(sql);

        ps.setInt(1, batchId);
       
        int row= ps.executeUpdate();
        System.out.println(row + " row deleted for batch Id " + batchId);
        con.close();
		return row;
        
    }
}


