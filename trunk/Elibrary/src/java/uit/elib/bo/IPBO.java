/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package uit.elib.bo;

import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import uit.elib.database.hibernate.ManagerBase;
import uit.elib.dto.Ip;

/**
 *
 * @author Nguyen Hoang Tan
 */
public class IPBO extends ManagerBase<Ip> {
    public static IPBO userBO = null;
    public IPBO() throws Exception{
    }
    public List GetIP() {
        try {
            String[] sort = new String[]{"IpId"}; // tang dan
            List<Ip> list = getBySQLQuery(sort, 0);
            return list;

        } catch (Exception ex) {
            Logger.getLogger(IPBO.class.getName()).log(Level.SEVERE, null, ex);
            return null;
        }
    }
    public List GetIP(String where) {
        try {
            String[] sort = new String[]{"IpId"}; // tang dan
            List<Ip> list = getBySQLQuery(where,sort, 0);
            return list;

        } catch (Exception ex) {
            Logger.getLogger(IPBO.class.getName()).log(Level.SEVERE, null, ex);
            return null;
        }
    }    
    public static IPBO GetIPBO() throws Exception{
         if (userBO == null ){
              userBO = new IPBO();
          }
         return userBO;
    }
    public int DeleteIP(String sql)
    {
        try {
            return excecuteSQl(sql);
        } catch (Exception ex) {
            Logger.getLogger(IPBO.class.getName()).log(Level.SEVERE, null, ex);
            return 0;
        }            
    }
    public void UpdateIP(Ip u) throws Exception
    {
        try {
             update(u);
        } catch (Exception ex) {
            Logger.getLogger(IPBO.class.getName()).log(Level.SEVERE, null, ex);
        } 
    }
    public void InsertIP(Ip u) {
        try {
            addNew(u);
        } catch (Exception ex) {
            Logger.getLogger(IPBO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }    
}
