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
public class FacultyBO extends ManagerBase<Faculty> {
    
    private static FacultyBO facultyBO = null;

    public FacultyBO() throws Exception {
    }
    
     public static FacultyBO getFacultyBO() throws Exception{
         if (facultyBO == null ){
              facultyBO = new FacultyBO();
          }
         return facultyBO;
    }
    
    /**
     * 
     * @return List Subject In Database order by subject ID
     */
    
     public List getAllFaculty() {
        try {
            String[] sort = new String[]{"facultyId"}; // tang dan
            //String[] sort = new String[]{"name desc"}; // giam dan

            List<Faculty> list = getBySQLQuery(sort, 0);
            return list;

        } catch (Exception ex) {
            Logger.getLogger(Subject.class.getName()).log(Level.SEVERE, null, ex);
            return null;
        }
    }

     
 
}
