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
public class SubjectCategoryBO extends ManagerBase<Subjectcategory> {

    
    private static SubjectCategoryBO subjectCategorytBO = null;
    public SubjectCategoryBO() throws Exception {
    }

    public static SubjectCategoryBO getSubjectCategoryBO() throws Exception{
        if(subjectCategorytBO == null){
            subjectCategorytBO = new SubjectCategoryBO();
        }
        return subjectCategorytBO;
    }
    /**
     * 
     * @return List Subject In Database order by subject ID
     */
    
     public List<Subjectcategory> getAllSubjectCategory() {
        try {
            String[] sort = new String[]{"subjectCategoryId"}; // tang dan
            //String[] sort = new String[]{"name desc"}; // giam dan

            List<Subjectcategory> list = getBySQLQuery(sort, 0);
            return list;

        } catch (Exception ex) {
            Logger.getLogger(SubjectCategoryBO.class.getName()).log(Level.SEVERE, null, ex);
            return null;
        }
    }

     
 
}
