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
import uit.elib.bo.ResourceBO;
import uit.elib.dto.Resource;

/**
 *
 * @author Nguyen Hoang Tan
 */
public class CheckSyllabusImageAction extends org.apache.struts.action.Action {

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
        if(request.getParameter("id")!=null)
        {   
            int subjectID = Integer.parseInt(request.getParameter("id"));
            int resourceCategoryID = Integer.parseInt(request.getParameter("resourceCategoryID"));
            List<Resource> listResource= ResourceBO.getResourceBO().getAllResource(subjectID, resourceCategoryID);
            if(listResource.size()>0)
                response.getWriter().println("1");
        }
        return null;
    }
}
