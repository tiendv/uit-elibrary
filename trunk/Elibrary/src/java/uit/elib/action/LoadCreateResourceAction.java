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
import uit.elib.bo.LevelBO;
import uit.elib.bo.ResourceCategoryBO;
import uit.elib.bo.SubjectBO;
import uit.elib.dto.Faculty;
import uit.elib.dto.Level;
import uit.elib.dto.Resourcecategory;
import uit.elib.dto.Subject;

/**
 *
 * @author Nguyen Hoang Tan
 */
public class LoadCreateResourceAction extends org.apache.struts.action.Action {

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
        List<Subject> listSubject = SubjectBO.getSubjectBO().getAllSubject();
        List<Resourcecategory> listResourceCategory = ResourceCategoryBO.getResourceCategoryBO().getAllResourcecategory();
        List<Level> listLevel = LevelBO.getLevelBO().getAllLevel();
        List<Faculty> listFaculty = FacultyBO.getFacultyBO().getAllFaculty();
        request.setAttribute("listResourceCategory", listResourceCategory);
        request.setAttribute("listSubject", listSubject);
        request.setAttribute("listLevel", listLevel);
        request.setAttribute("listFaculty", listFaculty);
        return mapping.findForward(SUCCESS);
    }
}
