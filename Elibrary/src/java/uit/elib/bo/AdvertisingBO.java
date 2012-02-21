/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package uit.elib.bo;
import uit.elib.database.hibernate.ManagerBase;
import uit.elib.dto.*;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import uit.elib.formbean.AdsForm;
/**
 *
 * @author HERO
 */
public class AdvertisingBO extends ManagerBase<Advertising> {
    private static AdvertisingBO advertisingBO = null;
    public AdvertisingBO() throws Exception {
    }
     public static AdvertisingBO getAdvertisingBO() throws Exception{
         if (advertisingBO == null ){
              advertisingBO = new AdvertisingBO();
          }
         return advertisingBO;
    }
     public List<Advertising> getAllAds() {
        try {
            String[] sort = new String[]{"advertisingId"}; // tang dan
            //String[] sort = new String[]{"name desc"}; // giam dan

            List<Advertising> list = getBySQLQuery(sort, 0);
            return list;

        } catch (Exception ex) {
            Logger.getLogger(AdvertisingBO.class.getName()).log(Level.SEVERE, null, ex);
            return null;
        }
     }
     public int DeleteAds(String sql) throws Exception
     {
         try {
            return excecuteSQl(sql);
        } catch (Exception ex) {
            Logger.getLogger(AdvertisingBO.class.getName()).log(Level.SEVERE, null, ex);
            return 0;
        }            
     }
     public List<Advertising> getAllAds(String where,String [] sort) {
        try {

            List<Advertising> list = getBySQLQuery(where, sort, 0);
            return list;

        } catch (Exception ex) {
            Logger.getLogger(AdvertisingBO.class.getName()).log(Level.SEVERE, null, ex);
            return null;
        }
     }  
}
