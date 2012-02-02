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
/**
 *
 * @author HERO
 */
public class UserBO extends ManagerBase<User> {
    public static UserBO userBO = null;
    public UserBO() throws Exception{
    }
    public List getUser() {
        try {
            String[] sort = new String[]{"userName"}; // tang dan
            //String[] sort = new String[]{"name desc"}; // giam dan

            List<User> list = getBySQLQuery(sort, 0);
            return list;

        } catch (Exception ex) {
            Logger.getLogger(UserBO.class.getName()).log(Level.SEVERE, null, ex);
            return null;
        }
    }
    public List getUser(String where) {
        try {
            String[] sort = new String[]{"userName"}; // tang dan
            //String[] sort = new String[]{"name desc"}; // giam dan

            List<User> list = getBySQLQuery(where,sort, 0);
            return list;

        } catch (Exception ex) {
            Logger.getLogger(UserBO.class.getName()).log(Level.SEVERE, null, ex);
            return null;
        }
    }    
    public static UserBO getUserBO() throws Exception{
         if (userBO == null ){
              userBO = new UserBO();
          }
         return userBO;
    }
    public int DeleteUser(String sql)
    {
        try {
            return excecuteSQl(sql);
        } catch (Exception ex) {
            Logger.getLogger(UserBO.class.getName()).log(Level.SEVERE, null, ex);
            return 0;
        }            
    }
    public void UpdateUser(User u) throws Exception
    {
        try {
             update(u);
        } catch (Exception ex) {
            Logger.getLogger(UserBO.class.getName()).log(Level.SEVERE, null, ex);
        } 
    }
    public void insert(User u) {
        try {
            addNew(u);
        } catch (Exception ex) {
            Logger.getLogger(UserBO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }    
}
