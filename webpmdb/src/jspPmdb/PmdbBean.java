/**
 * 
 */
package jspPmdb;

import java.io.File;

import javax.servlet.http.HttpServletRequest;

import ht.kokoelma.Kokoelma;
import ht.kokoelma.SailoException;

/**
 * @author Hannes Laukkanen
 * @version 25.5.2016
 * hannes.v.laukkanen@student.jyu.fi
 */
public class PmdbBean {
	static private Kokoelma kokoelma = new Kokoelma();

	static {	    
		 File f = new File(".");
	     String s = f.getAbsolutePath();
	     System.out.println(s);
	     System.out.println();
		
		try {
			kokoelma.lueTiedostot("kayttajat\\hannes");
		} catch (SailoException e) {
			System.err.println("Ongelma tiedostojen lukemisessa: " + 
					e.getMessage());
		}
	}

	/**
	 * Luokan kokeiluun
	 * @param args ei käytetä
	 */
	public static void main(String[] args) {
		System.out.println("*********Beansin kokeilua:***********");
				
		for (int i = 0; i < kokoelma.getElokuvienLkm(); i++) {
			System.out.println(kokoelma.getElokuva(i));
		}			
	}
	
	
	/**
	 * antaa käsiteltävän kokoelma kutsujan käyttöön
	 * @return kokoelma
	 */
	public static Kokoelma getKokoelma() {
		return kokoelma;
	}
	
	
	/**
	 * Selvittää osoiterivin parametrin integer-muodon
	 * @param request osoiterivi
	 * @param parametri selvitettävä parametri
	 * @param oletus oletus integer
	 * @return integer muoto annetusta parametrista tai oletus jos muunto ei onnistu
	 */
	public static int getInt(HttpServletRequest request, String parametri, int oletus) {
		try {
			return Integer.parseInt(request.getParameter(parametri));
		} catch (Exception e) {
			return oletus;
		}
	}
	
	
	/**
	 * pyytää kokoelmaa tarkistamaan, onko merkkijono sopiva kokoelmaan
	 * @param request osoiterivi
	 * @param parametri jota tutkitaan
	 * @return null jos kaikki ok, muuten ongelman merkkijonona
	 */
	public static String tarkistaString(HttpServletRequest request, String parametri) {
		String ongelma = kokoelma.tarkistaNimi(request.getParameter(parametri));
		
		return ongelma;
	}
}
