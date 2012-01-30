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
     public void UpdateUser(User us) throws Exception
     {
         update(us);
     }
}
