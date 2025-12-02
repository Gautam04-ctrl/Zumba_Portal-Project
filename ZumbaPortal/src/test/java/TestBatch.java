import static org.junit.Assert.*;
import java.util.List;
import org.junit.Test;
import com.zumbaportal.entity.Batch;
import com.zumbaportal.service.BatchService;

public class TestBatch {

	private BatchService bs;
	@Test
	public void test() throws Exception{

            BatchService bs = new BatchService();

            
//           ... TEST 1: Add Batch ...
            
            System.out.println("... TEST 1: Add Batch ...");
            Batch b1 = new Batch();
            b1.setBatchName("Morning");
            b1.setTiming("7 AM - 8 AM");
            int result1 = bs.addBatch(b1);
            System.out.println("Add Result = " + result1);

            
             ...TEST 2: Select Batches ...
            
//            System.out.println("... TEST 2: Select Batches ...");
//            List<Batch> batches = bs.getAllBatches();
//            assertNotNull("Batch list should not be null", batches);
//            assertTrue("Batch list should contain at least one record", batches.size() > 0);
//            for (Batch b : batches) {
//                System.out.println( "ID: " + b.getBatchId() +  ", Name: " + b.getBatchName() +  ", Timing: " + b.getTiming()
//                		  );                    
//            }
//            
            ...TEST 3 : Update Batch ...
            
//            System.out.println("...TEST 3: Update Batch ...");
//            Batch b2 = new Batch();
//            b2.setBatchId(13); 
//            b2.setBatchName("Evening Updated");
//            b2.setTiming("6 PM - 7 PM"); 
//            int result2 = bs.updateBatch(b2);
//            System.out.println("Update Result = " + result2 );
//
            ...TEST 4 : Delete Batch ...
            
//            System.out.println("... TEST 4: Delete Batch ...");
//            int result3 = bs.deleteBatch(13); 
//            System.out.println("Delete Result = " + result3);

	}

}

