/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package uit.elib.bo;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import uit.elib.database.hibernate.ManagerBase;
import uit.elib.dto.Group;
/**
 *
 * @author HERO
 */
public class GroupBO extends ManagerBase<Group> {
    private static GroupBO groupBO = null;

    public GroupBO() throws Exception {
    }
     public static GroupBO getGroupBO() throws Exception{
         if (groupBO == null ){
              groupBO = new GroupBO();
          }
         return groupBO;
    }
      public List<Group> getAllGroup(String where,String [] sort) {
        try {

            List<Group> list = getBySQLQuery(where, sort, 0);
            return list;

        } catch (Exception ex) {
            Logger.getLogger(GroupBO.class.getName()).log(Level.SEVERE, null, ex);
            return null;
        }
     }    
      public List<Group> getUser() {
        try {
            String [] sort= null;
            String where ="GroupID<>1 and GroupID<>3";
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
     public int DeleteGroup(String sql) throws Exception
     {
         try {
            return excecuteSQl(sql);
        } catch (Exception ex) {
            Logger.getLogger(GroupBO.class.getName()).log(Level.SEVERE, null, ex);
            return 0;
        }            
     }
     public int DeleteSubject(String sql)
     {
         try {
            return excecuteSQl(sql);
        } catch (Exception ex) {
            Logger.getLogger(SubjectBO.class.getName()).log(Level.SEVERE, null, ex);
            return 0;
        }            
     }
     public void UpdateGroup(Group g) throws Exception
     {
        try {
             update(g);
        } catch (Exception ex) {
            Logger.getLogger(GroupBO.class.getName()).log(Level.SEVERE, null, ex);
        } 
     }
}
