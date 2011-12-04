/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package uit.elib.bo;
import uit.elib.database.hibernate.ManagerBase;
import uit.elib.entities.*;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author tiendv
 */
public class ResourceBO extends ManagerBase<Resource> {

    private static ResourceBO resourceBO = null;
    public ResourceBO() throws Exception {

    }

    public static ResourceBO getResourceBO() throws Exception{
         if (resourceBO == null ){
              resourceBO = new ResourceBO();
          }
         return resourceBO;
    }
    
    /**
     * 
     * @return List Subject In Database order by subject ID
     */
      public List getAllResource(String where,String [] sort) {
        try {

            List<Resource> list = getBySQLQuery(where, sort, 0);
            return list;

        } catch (Exception ex) {
            Logger.getLogger(Subject.class.getName()).log(Level.SEVERE, null, ex);
            return null;
        }
     }    
      public List getAllResource() {
        try {
            String[] sort = new String[]{"resourceID"}; // tang dan
            //String[] sort = new String[]{"name desc"}; // giam dan

            List<Resource> list = getBySQLQuery(sort, 0);
            return list;

        } catch (Exception ex) {
            Logger.getLogger(Subject.class.getName()).log(Level.SEVERE, null, ex);
            return null;
        }
     }
      public List<Resource> getAllResourceOfSubjectAndResourceCategory(int subjectID, int resourcecategoryID)
      {
          String query = "SubjectID="+subjectID + " and ResourceCategoryID="+resourcecategoryID;
          List<Resource> list;
        try {
            list = getBySQLQuery(query, null, 0);
            return  list;
        } catch (Exception ex) {
            Logger.getLogger(ResourceBO.class.getName()).log(Level.SEVERE, null, ex);
            return null;
        }
      }
     /**
       * 
       * @param resourceID
       * @return 
       */
      public Resource getResourceByID(int resourceID)
      {
        try {
            Resource resource = getById(resourceID, true);
            return  resource;
        } catch (Exception ex) {
            Logger.getLogger(ResourceBO.class.getName()).log(Level.SEVERE, null, ex);
            return null;
        }          
      }
      public List getAllChapterOfSubject (int subjectID)
      {
           String query = "SubjectID=" + subjectID;
            
            List<Resource> list;
        try {
            list = getBySQLQuery(query, null, 0);
            return  list;
        } catch (Exception ex) {
            Logger.getLogger(ResourceBO.class.getName()).log(Level.SEVERE, null, ex);
            return null;
        }
                 
      }
      
       public int countNumberChapterOfSubject (int subjectID)
      {
           String query = "[SubjectID]='" + subjectID +"'";
            
            List<Resource> list;
        try {
            list = getBySQLQuery(query, null, 0);
            return  list.size();
        } catch (Exception ex) {
            Logger.getLogger(ResourceBO.class.getName()).log(Level.SEVERE, null, ex);
            return 0;
        }
                 
      }

    
     
 
}
