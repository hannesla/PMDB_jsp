package ht.kanta;
// Generated by ComTest BEGIN
import static org.junit.Assert.*;
import org.junit.*;
import static ht.kanta.ElokuvaTarkistus.*;
// Generated by ComTest END

/**
 * Test class made by ComTest
 * @version 2016.04.19 17:18:54 // Generated by ComTest
 *
 */
public class ElokuvaTarkistusTest {



  // Generated by ComTest BEGIN
  /** testTarkistaNimi33 */
  @Test
  public void testTarkistaNimi33() {    // ElokuvaTarkistus: 33
    assertEquals("From: ElokuvaTarkistus line: 34", "Elokuvalla on oltava nimi", tarkistaNimi("")); 
    assertEquals("From: ElokuvaTarkistus line: 35", null, tarkistaNimi("Mit� tahansa muuta")); 
  } // Generated by ComTest END


  // Generated by ComTest BEGIN
  /** testTarkistaVuosi50 */
  @Test
  public void testTarkistaVuosi50() {    // ElokuvaTarkistus: 50
    assertEquals("From: ElokuvaTarkistus line: 51", null, tarkistaVuosi("1999")); 
    assertEquals("From: ElokuvaTarkistus line: 52", "vuoden on oltava v�lilt� 1895 - 2025", tarkistaVuosi("1")); 
    assertEquals("From: ElokuvaTarkistus line: 53", "vuoden on oltava v�lilt� 1895 - 2025", tarkistaVuosi("2026")); 
    assertEquals("From: ElokuvaTarkistus line: 54", null, tarkistaVuosi("2025")); 
    assertEquals("From: ElokuvaTarkistus line: 55", null, tarkistaVuosi("1895")); 
  } // Generated by ComTest END
}