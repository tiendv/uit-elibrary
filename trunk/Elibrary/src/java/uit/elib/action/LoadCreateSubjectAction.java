/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package uit.elib.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;
import uit.elib.bo.FacultyBO;
import uit.elib.bo.SubjectCategoryBO;
import uit.elib.dto.Faculty;
import uit.elib.formbean.LoadCreateSubjectForm;
import java.util.List;

/**
 *
 * @author Nguyen Hoang Tan
 */
public class LoadCreateSubjectAction extends org.apache.struts.action.Action {

    /* forward name="success" path="" */
    private static final String SUCCESS = "success";

    /**
     * This is the action called from the Struts framework.
     * @param mapping The ActionMapping used to select this instance.
     * @param form The optional ActionForm bean for this request.
     * @param request The HTTP Request we are processing.
     * @param response The HTTP Response we are processing.
     * @throws java.lang.Exception
     * @return
     */
    @Override
    public ActionForward execute(ActionMapping mapping, ActionForm form,
            HttpServletRequest request, HttpServletResponse response)
            throws Exception {
        LoadCreateSubjectForm loadCreateSubjectForm = (LoadCreateSubjectForm)form;
        //faculty
        FacultyBO facultyBO = FacultyBO.getFacultyBO();
        List<Faculty> listFaculty = facultyBO.getAllFaculty();
        loadCreateSubjectForm.setListDropFaculty(listFaculty);
        //Subject Category
        SubjectCategoryBO subjectCategoryBO = SubjectCategoryBO.getSubjectCategoryBO();
        loadCreateSubjectForm.setListDropSubjectCategory(subjectCategoryBO.getAllSubjectCategory());
        return mapping.findForward(SUCCESS);
    }
}
