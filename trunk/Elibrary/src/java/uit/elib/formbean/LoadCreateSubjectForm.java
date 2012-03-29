/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package uit.elib.formbean;
import java.util.List;
import uit.elib.dto.Faculty;
import uit.elib.dto.Subjectcategory;

/**
 *
 * @author Nguyen Hoang Tan
 */
public class LoadCreateSubjectForm extends org.apache.struts.action.ActionForm {
    
    private List<Subjectcategory> listDropSubjectCategory;
    private List<Faculty> listDropFaculty;

    public List<Faculty> getListDropFaculty() {
        return listDropFaculty;
    }

    public void setListDropFaculty(List<Faculty> listDropFaculty) {
        this.listDropFaculty = listDropFaculty;
    }

    public List<Subjectcategory> getListDropSubjectCategory() {
        return listDropSubjectCategory;
    }

    public void setListDropSubjectCategory(List<Subjectcategory> listDropSubjectCategory) {
        this.listDropSubjectCategory = listDropSubjectCategory;
    }

}
