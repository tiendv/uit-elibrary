/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package uit.elib.bo;
import uit.elib.database.hibernate.ManagerBase;
import uit.elib.entities.Subject;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author tiendv
 */
public class SubjectBO extends ManagerBase<Subject> {

    private static SubjectBO subjectBO = null;
    public SubjectBO() throws Exception {
    }

    public static SubjectBO getSubjectBO() throws Exception{
        if(subjectBO == null){
            subjectBO = new SubjectBO();
        }
        return subjectBO;
    }
    
    /**
     * 
     * @return List Subject In Database order by subject ID
     */
    
     public List getAllSubject() {
        try {
            String[] sort = new String[]{"subjectId"}; // tang dan
            //String[] sort = new String[]{"name desc"}; // giam dan

            List<Subject> list = getBySQLQuery(sort, 0);
            return list;

        } catch (Exception ex) {
            Logger.getLogger(Subject.class.getName()).log(Level.SEVERE, null, ex);
            return null;
        }
    }
     /**
      * 
      * @param id : ID of oject
      * @return Subject with ID
      */
     public Subject getSubjectByID (int id) {
        try {
            return getById(id, true);
        } catch (Exception ex) {
            Logger.getLogger(SubjectBO.class.getName()).log(Level.SEVERE, null, ex);
            return null;
        }
     }
     
 
}
