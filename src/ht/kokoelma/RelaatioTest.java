package ht.kokoelma;
// Generated by ComTest BEGIN
import static org.junit.Assert.*;
import org.junit.*;
import ht.kokoelma.*;
// Generated by ComTest END

/**
 * Test class made by ComTest
 * @version 2016.04.19 16:04:36 // Generated by ComTest
 *
 */
public class RelaatioTest {



  // Generated by ComTest BEGIN
  /** testToString112 */
  @Test
  public void testToString112() {    // Relaatio: 112
    Relaatio test = new Relaatio(); 
    test.asetaTiedot("5", "34", "100"); 
    assertEquals("From: Relaatio line: 115", true, "5|34|100|".equals(test.toString())); 
    assertEquals("From: Relaatio line: 116", false, "5|elokuva|1939|vansanat|".equals(test.toString())); 
  } // Generated by ComTest END
}