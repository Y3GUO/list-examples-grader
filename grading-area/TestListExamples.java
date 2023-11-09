import static org.junit.Assert.*;
import org.junit.*;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

class IsMoon implements StringChecker {
  public boolean checkString(String s) {
    return s.equalsIgnoreCase("moon");
  }
}

class AChecker implements StringChecker {
        @Override
        public boolean checkString(String s) {
            return s != null && s.contains("a");
        }
    }

public class TestListExamples {
  @Test(timeout = 500)
  public void testMergeRightEnd() {
    List<String> left = Arrays.asList("a", "b", "c");
    List<String> right = Arrays.asList("a", "d");
    List<String> merged = ListExamples.merge(left, right);
    List<String> expected = Arrays.asList("a", "a", "b", "c", "d");
    assertEquals(expected, merged);
  }
  
  @Test(timeout = 500)
    public void testMerge() {
        List<String> inputList1 = Arrays.asList("a","c");
        List<String> inputList2 = Arrays.asList("b","d","e","f");
        ListExamples.merge(inputList1, inputList2);
        List<String> expectedList = Arrays.asList("a", "b","c","d","e","f");
        assertEquals(expectedList, ListExamples.merge(inputList1, inputList2));
    }

  @Test(timeout = 500)
	public void testFilter() {
        // Setup
        ListExamples examples = new ListExamples();
        List<String> inputList = Arrays.asList("apple", "banana", "cherry", "date", "fig");
        
        // Execute
        List<String> filteredList = examples.filter(inputList, new AChecker());

        // Verify
        List<String> expectedList = Arrays.asList("apple", "banana", "date");
        assertEquals(expectedList, filteredList);
    }
    @Test(timeout = 500)
    public void testMerge1(){
        List<String> list1 = new ArrayList<>();
        list1.add("a");

        List<String> list2 = new ArrayList<>();
        list2.add("b");
        list2.add("c");
        list2.add("d");
        list2.add("e");

        List<String> output = new ArrayList<>();
        output.add("a");
        output.add("b");
        output.add("c");
        output.add("d");
        output.add("e");

        assertEquals(output, ListExamples.merge(list1, list2));
    }
 }
