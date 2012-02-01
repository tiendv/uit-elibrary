/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package uit.elib.utility;

import java.security.MessageDigest;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author Nguyen Hoang Tan
 */
public class SHA512 {
    
    public String SHA512(String password)
    {
        try
        {
            MessageDigest md = MessageDigest.getInstance("SHA-512");
            md.update(password.getBytes());

            byte byteData[] = md.digest();

            //convert the byte to hex format method 1
            StringBuilder sb = new StringBuilder();
            for (int i = 0; i < byteData.length; i++) {
             sb.append(Integer.toString((byteData[i] & 0xff) + 0x100, 16).substring(1));
            }
            return sb.toString();
        }
        catch(Exception ex)
        {
            Logger.getLogger(SHA512.class.getName()).log(Level.SEVERE, null, ex); 
            return null;
        }
    }
}
