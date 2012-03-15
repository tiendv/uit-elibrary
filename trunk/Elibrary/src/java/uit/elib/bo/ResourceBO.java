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
 * @author Nguyen Hoang Tan
 */
public class ResourceBO extends ManagerBase<Resource> {

    private static ResourceBO resourceBO = null;
    public ResourceBO() throws Exception {

    }
    public int DeleteResource(String sql) throws Exception
    {
        try {
            return excecuteSQl(sql);
        } catch (Exception ex) {
            Logger.getLogger(ResourceBO.class.getName()).log(Level.SEVERE, null, ex);
            return 0;
        }  
        
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
            Logger.getLogger(ResourceBO.class.getName()).log(Level.SEVERE, null, ex);
            return null;
        }
     }    
      public List getAllResource() {
        try {
            String[] sort = new String[]{"resourceId"}; // tang dan
            //String[] sort = new String[]{"name desc"}; // giam dan

            List<Resource> list = getBySQLQuery(sort, 0);
            return list;

        } catch (Exception ex) {
            Logger.getLogger(ResourceBO.class.getName()).log(Level.SEVERE, null, ex);
            return null;
        }
     }
      public List getAllResource(int resourcecategoryID,String []order)
      {
          String query = "ResourceCategoryId="+resourcecategoryID;
          List<Resource> list;
        try {
            list = getBySQLQuery(query, order, 0);
            return  list;
        } catch (Exception ex) {
            Logger.getLogger(ResourceBO.class.getName()).log(Level.SEVERE, null, ex);
            return null;
        }
      }      
      public List getAllResource(int subjectID, int resourcecategoryID)
      {
          String query = "SubjectId="+subjectID + " and ResourceCategoryId="+resourcecategoryID;
          List<Resource> list;
        try {
            list = getBySQLQuery(query, null, 0);
            return  list;
        } catch (Exception ex) {
            Logger.getLogger(ResourceBO.class.getName()).log(Level.SEVERE, null, ex);
            return null;
        }
      }
      public List getAllResourceByFR(int facultyID, int resourcecategoryID, String []order)
      {
          String query = "FacultyId="+facultyID + " and ResourceCategoryId="+resourcecategoryID;
          List<Resource> list;
        try {
            list = getBySQLQuery(query, order, 0);
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
           String query = "SubjectId=" + subjectID;  
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
           String query = "[SubjectId]='" + subjectID +"'";
            List<Resource> list;
        try {
            list = getBySQLQuery(query, null, 0);
            return  list.size();
        } catch (Exception ex) {
            Logger.getLogger(ResourceBO.class.getName()).log(Level.SEVERE, null, ex);
            return 0;
        }
                 
      }
      public List<List<Resource>> getAllResource(String []where,String [] sort) {
        try {
            List<List<Resource>> arrayList = getBySQLQuery(where, sort, 0);
            return arrayList;
        } catch (Exception ex) {
            Logger.getLogger(ResourceBO.class.getName()).log(Level.SEVERE, null, ex);
            return null;
        }
     }  
     public void updateResource(Resource r)throws Exception
     {
         try {
             update(r);
        } catch (Exception ex) {
            Logger.getLogger(ResourceBO.class.getName()).log(Level.SEVERE, null, ex);
        }             
     }
     
 
}
