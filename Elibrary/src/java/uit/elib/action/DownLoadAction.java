/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package uit.elib.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;
import uit.elib.bo.ResourceBO;
import uit.elib.dto.Resource;

/**
 *
 * @author Nguyen Hoang Tan
 */
public class DownLoadAction extends org.apache.struts.action.Action {

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
    boolean checkInt(String resourceID)
    {
        try
        {
            int x = Integer.parseInt(resourceID);
            return true;
        }
        catch(Exception ex)
        {
            return false;
        }
    }
    @Override
    public ActionForward execute(ActionMapping mapping, ActionForm form,
            HttpServletRequest request, HttpServletResponse response)
            throws Exception {
        Resource resource = null;
        ActionForward actionForward =null;
        if(request.getParameter("resourceID") !=null) // check null
        {
            String resourceID = request.getParameter("resourceID");
            if(checkInt(resourceID)) // if resourceID is int
            {
                int id = Integer.parseInt(resourceID);
                resource=ResourceBO.getResourceBO().getResourceByID(id);
                if(resource.getUploadName()!=null &&resource.getServerName()!=null ){
                    response.setHeader("Content-Disposition","attachment;filename="+resource.getUploadName()) ;
                    actionForward= new ActionForward("/upload/"+resource.getServerName());
                    if(resource.getDownloadNumber()==null)
                        resource.setDownloadNumber(0);
                    resource.setDownloadNumber(resource.getDownloadNumber()+1);
                    HttpSession session = request.getSession();
                    if(session.getAttribute(resourceID)==null)
                    {
                        session.setAttribute(resourceID, 1);
                        ResourceBO.getResourceBO().updateResource(resource);
                    }
                    
                } 
            }   
        }
        return actionForward;
    }
}
