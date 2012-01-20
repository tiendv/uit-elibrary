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
import uit.elib.bo.ResourceBO;
import uit.elib.dto.Faculty;
import uit.elib.dto.Level;
import uit.elib.dto.Resource;
import uit.elib.utility.IsNumber;

/**
 *
 * @author Nguyen Hoang Tan
 */
public class LoadThesisDetailAction extends org.apache.struts.action.Action {

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
       if(request.getParameter("resourceID")!=null)
        {
            IsNumber isNumber = new IsNumber();
            if(isNumber.checkInt(request.getParameter("resourceID")))
            {
                int resourceID = Integer.parseInt(request.getParameter("resourceID"));
                ResourceBO resourceBO = ResourceBO.getResourceBO();
                List<Resource> listResource = resourceBO.getAllResource("resourceId="+resourceID, null);
                if(listResource.size()>0)
                {
                    List<Level> listLevel = LevelBO.getLevelBO().getAllLevel(listResource.get(0).getLevel().getLevelId());
                    List<Faculty> listFaculty = FacultyBO.getFacultyBO().getAllFaculty(listResource.get(0).getFaculty().getFacultyId());
                    request.setAttribute("listResource", listResource);
                    request.setAttribute("listLevel", listLevel);
                    request.setAttribute("listFaculty", listFaculty);
                    return mapping.findForward(SUCCESS);
                }
            }
        }      
        return mapping.findForward(UNSUCCESS);
    }
}
