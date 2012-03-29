/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package uit.elib.action;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;
import uit.elib.bo.FacultyBO;
import uit.elib.bo.SubjectCategoryBO;
import uit.elib.dto.Faculty;
import uit.elib.dto.Subjectcategory;
import uit.elib.formbean.LoadCreateSubjectForm;
/**
 *
 * @author HERO
 */
public class LoadListOfSubjectAction extends org.apache.struts.action.Action{
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
        request.setCharacterEncoding("UTF-8");
        List<Subjectcategory> subjectCategoryBO = SubjectCategoryBO.getSubjectCategoryBO().getAllSubjectCategory();
        List<Faculty> facultyBO = FacultyBO.getFacultyBO().getAllFaculty();
        LoadCreateSubjectForm listOfsubjectFormBean = (LoadCreateSubjectForm) form;
        listOfsubjectFormBean.setListDropSubjectCategory(subjectCategoryBO);
        listOfsubjectFormBean.setListDropFaculty(facultyBO);
        return mapping.findForward(SUCCESS);
    }
}
