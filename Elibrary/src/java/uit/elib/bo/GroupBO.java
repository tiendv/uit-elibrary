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
public class GroupBO extends ManagerBase<Group> {
    public static GroupBO groupBO = null;
    public GroupBO() throws Exception{
    }
    public static GroupBO getGroupBO() throws Exception{
         if (groupBO == null ){
              groupBO = new GroupBO();
          }
         return groupBO;
    }
    /**
     * 
     * @return List Group In Database order by Group ID
     */
      public List getAllGroup(String where,String [] sort) {
        try {

            List<Group> list = getBySQLQuery(where, sort, 0);
            return list;

        } catch (Exception ex) {
            Logger.getLogger(GroupBO.class.getName()).log(Level.SEVERE, null, ex);
            return null;
        }
     }    
      public List getAllGroup() {
        try {
            String[] sort = new String[]{"groupId"}; // tang dan
            //String[] sort = new String[]{"name desc"}; // giam dan

            List<Group> list = getBySQLQuery(sort, 0);
            return list;

        } catch (Exception ex) {
            Logger.getLogger(GroupBO.class.getName()).log(Level.SEVERE, null, ex);
            return null;
        }
     }
      public int DeleteGroup(String sql)
     {
         try {
            return excecuteSQl(sql);
        } catch (Exception ex) {
            Logger.getLogger(GroupBO.class.getName()).log(Level.SEVERE, null, ex);
            return 0;
        }            
     }
     public void UpdateGroup(Group g) throws Exception
     {
         update(g);
     }
}