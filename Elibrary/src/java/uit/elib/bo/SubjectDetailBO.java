/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package uit.elib.bo;

import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import uit.elib.database.hibernate.ManagerBase;
import uit.elib.dto.Subjectdetail;

/**
 *
 * @author Nguyen Hoang Tan
 */
public class SubjectDetailBO extends ManagerBase<Subjectdetail> {
    private static SubjectDetailBO subjectDetailBO = null;
    public SubjectDetailBO() throws Exception {
    }

    public static SubjectDetailBO getSubjectDetailBO() throws Exception{
        if(subjectDetailBO == null){
            subjectDetailBO = new SubjectDetailBO();
        }
        return subjectDetailBO;
    }
    public void insert(Subjectdetail subject) {
        try {
            addNew(subject);
        } catch (Exception ex) {
             Logger.getLogger(SubjectDetailBO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    public List getAllSubjectDetail(String where,String[] sort) {
        try {
            List<Subjectdetail> list = getBySQLQuery(where,sort, 0);
            return list;

        } catch (Exception ex) {
            Logger.getLogger(SubjectDetailBO.class.getName()).log(Level.SEVERE, null, ex);
            return null;
        }
    } 
    public void addSubjectDetail (Subjectdetail subjectdetail) {
        try {
            addNew(subjectdetail);
        } catch (Exception ex) {
            Logger.getLogger(SubjectDetailBO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
     public void runSQL (String sql) throws Exception
     {
         excecuteSQl(sql);
     }  
     public void deleteSubjectDetail (Subjectdetail subjectdetail) throws Exception
     {
         delete(subjectdetail);
     }         
}
