/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package uit.elib.utility;

/**
 *
 * @author HERO
 */
public class IsNumber {
     public boolean checkInt(String ID)
    {
        try
        {
            int x = Integer.parseInt(ID);
            return true;
        }
        catch(Exception ex)
        {
            return false;
        }
    }  
}
