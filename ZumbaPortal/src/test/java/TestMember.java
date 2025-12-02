import static org.junit.Assert.*;
import java.util.List;
import org.junit.Test;
import com.zumbaportal.entity.Member;
import com.zumbaportal.service.MemberService;

public class TestMember {
	@Test
	public void test() throws Exception {
	
//	   TEST 1 : Add Member
	   
		MemberService service = new MemberService();
	        Member m = new Member();
	        m.setName("Gautam Pise");
	        m.setEmail("gautampise50@gmail.com");
	        m.setGender("Male");
	        m.setDob("1999-01-01");
	        m.setPhone("9011958990");
	        m.setAddress("Pune");
	        m.setBatchId(14);
	        int result = service.addMember(m);
	        assertEquals(1, result);
	        System.out.println("TEST: Add Member → Passed");
	    }
	
//	  TEST 2 : Select Members

//    List<Member> members = service.getAllMembers();
//    System.out.println("TEST: Select Members → Passed");
//    assertTrue(service.getAllMembers().size() > 0);

//   TEST 3 : Update Member
    
//    System.out.println("... TEST 3: Update Member ...");
//    m.setMemberId(2);  
//    m.setName("Sagar Pise");
//    m.setEmail("sagarpise91@gmail.com");
//    m.setGender("Male");
//    m.setDob("1992-04-10");
//    m.setPhone("9665929300");
//    m.setAddress("Mumbai");
//    m.setBatchId(14);
//    int result = service.updateMember(m);
//    System.out.println("Update Result = " + result);
//    assertEquals(1, result);
    
//    TEST 4 : Delete Member
 
//    System.out.println("... TEST 4: Delete Member ...");
//    int result = service.deleteMember(1);   
//    System.out.println("Delete Result = " + result);
//    assertEquals(1, result);
	
}
	