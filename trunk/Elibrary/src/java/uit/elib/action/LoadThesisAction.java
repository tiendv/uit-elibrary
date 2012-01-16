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
import uit.elib.bo.ResourceBO;
import uit.elib.dto.Faculty;
import uit.elib.dto.Resource;
import uit.elib.utility.IsNumber;

/**
 *
 * @author Nguyen Hoang Tan
 */
public class LoadThesisAction extends org.apache.struts.action.Action {

    /* forward name="success" path="" */
    private static final String SUCCESS = "success";
    private static final String UNSUCCESS = "unsuccess";
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
        IsNumber isNumber = new IsNumber();
        if(request.getParameter("facultyID")!=null)
        {
            if(isNumber.checkInt(request.getParameter("facultyID")))
            {
                int facultyID = Integer.parseInt(request.getParameter("facultyID"));
                List<Faculty> listFaculty = FacultyBO.getFacultyBO().getAllFaculty(facultyID);
                if(listFaculty.size()>0)
                {
                    List<Resource> listResource = ResourceBO.getResourceBO().getAllResourceByFR(facultyID, 2);
                    request.setAttribute("listResource", listResource);
                    return mapping.findForward(SUCCESS);
                }
            }
        }
        return mapping.findForward(UNSUCCESS);
    }
}
