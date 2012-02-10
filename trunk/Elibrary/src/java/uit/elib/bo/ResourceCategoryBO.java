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
 * @author tiendv
 */
public class ResourceCategoryBO extends ManagerBase<Resourcecategory> {
   
   public static ResourceCategoryBO resourceCategoryBO = null;
   public ResourceCategoryBO() throws Exception {
    }
    public static ResourceCategoryBO getResourceCategoryBO() throws Exception{
         if (resourceCategoryBO == null ){
              resourceCategoryBO = new ResourceCategoryBO();
          }
         return resourceCategoryBO;
    }
    
     
    
    /**
     * 
     * @return List Subject In Database order by subject ID
     */
    
     public List getAllResourcecategory() {
        try {
            String[] sort = new String[1]; // tang dan
            sort[0]="resourceCategoryId";
            //String[] sort = new String[]{"name desc"}; // giam dan

            List<Resourcecategory> list = getBySQLQuery(sort, 0);
            return list;

        } catch (Exception ex) {
            Logger.getLogger(ResourceCategoryBO.class.getName()).log(Level.SEVERE, null, ex);
            return null;
        }
        
    }
     public List getAllResourcecategory(String where,String [] sort) {
        try {

            List<Resourcecategory> list = getBySQLQuery(where, sort, 0);
            return list;

        } catch (Exception ex) {
            Logger.getLogger(ResourceCategoryBO.class.getName()).log(Level.SEVERE, null, ex);
            return null;
        }
        
    }
     public List<Resourcecategory> getResourcecategory() { // lấy loại tài nguyên cho mục dích phân quyền
        try {
            String [] sort = null;
            String where = "ResourceCategoryID<>7 and ResourceCategoryID<>8";
            List<Resourcecategory> list = getBySQLQuery(where, sort, 0);
            return list;

        } catch (Exception ex) {
            Logger.getLogger(ResourceCategoryBO.class.getName()).log(Level.SEVERE, null, ex);
            return null;
        }
        
    }
     
 
}
