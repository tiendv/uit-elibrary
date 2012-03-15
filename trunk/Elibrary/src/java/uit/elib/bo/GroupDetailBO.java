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
public class GroupDetailBO extends ManagerBase<Groupdetail> {
    public static GroupDetailBO groupDetailBO = null;
    public GroupDetailBO() throws Exception{
    }
    public static GroupDetailBO getGroupDetailBO() throws Exception{
         if (groupDetailBO == null ){
              groupDetailBO = new GroupDetailBO();
          }
         return groupDetailBO;
    }
    /**
     * 
     * @return List GroupDetail In Database order by GroupDetail ID
     */
      public List getAllGroupDetail(String where,String [] sort) {
        try {

            List<Groupdetail> list = getBySQLQuery(where, sort, 0);
            return list;

        } catch (Exception ex) {
            Logger.getLogger(GroupDetailBO.class.getName()).log(Level.SEVERE, null, ex);
            return null;
        }
     }    
      public List getAllGroupDetail() {
        try {
            String[] sort = new String[]{"groupDetailId"}; // tang dan
            //String[] sort = new String[]{"name desc"}; // giam dan

            List<Groupdetail> list = getBySQLQuery(sort, 0);
            return list;

        } catch (Exception ex) {
            Logger.getLogger(GroupDetailBO.class.getName()).log(Level.SEVERE, null, ex);
            return null;
        }
     }
      public int DeleteGroupDetail(String sql)
     {
         try {
            return excecuteSQl(sql);
        } catch (Exception ex) {
            Logger.getLogger(GroupDetailBO.class.getName()).log(Level.SEVERE, null, ex);
            return 0;
        }            
     }
     public void UpdateGroupDetail(Groupdetail gd) throws Exception
     {
         update(gd);
     }
}
