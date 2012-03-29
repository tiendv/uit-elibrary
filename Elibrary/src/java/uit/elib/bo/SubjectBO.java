/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package uit.elib.bo;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import uit.elib.database.hibernate.ManagerBase;
import uit.elib.dto.Subject;

/**
 *
 * @author Nguyen Hoang Tan
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
     public List getAllSubject(String[] sort) {
        try {
            List<Subject> list = getBySQLQuery(sort, 0);
            return list;

        } catch (Exception ex) {
            Logger.getLogger(SubjectBO.class.getName()).log(Level.SEVERE, null, ex);
            return null;
        }
    } 
     public List<Subject> getAllSubject(String where,String[] sort) {
        try {
            List<Subject> list = getBySQLQuery(where,sort, 0);
            return list;

        } catch (Exception ex) {
            Logger.getLogger(SubjectBO.class.getName()).log(Level.SEVERE, null, ex);
            return null;
        }
    }        
        
     public List getAllSubject() {
        try {
            String[] sort = new String[]{"subjectId"}; // tang dan
            //String[] sort = new String[]{"name desc"}; // giam dan

            List<Subject> list = getBySQLQuery(sort, 0);
            return list;

        } catch (Exception ex) {
            Logger.getLogger(SubjectBO.class.getName()).log(Level.SEVERE, null, ex);
            return null;
        }
    }
     /**
      * 
      * @param id : ID of object
      * @return Subject with ID
      */
     public List<Subject> getSubject (int id) {
        try {
            return getAllSubject("SubjectID="+id, null);
        } catch (Exception ex) {
            Logger.getLogger(SubjectBO.class.getName()).log(Level.SEVERE, null, ex);
            return null;
        }
     }
     public void addSubject (Subject subject) {
        try {
            addNew(subject);
        } catch (Exception ex) {
            Logger.getLogger(SubjectBO.class.getName()).log(Level.SEVERE, null, ex);
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
     public void UpdateSubject(Subject sj) throws Exception
     {
         update(sj);
     }
}
