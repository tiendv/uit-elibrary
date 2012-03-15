/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package uit.elib.action;

import java.util.ArrayList;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;
import uit.elib.bo.ResourceBO;
import uit.elib.bo.SubjectBO;
import uit.elib.dto.Resource;
import uit.elib.dto.Subject;

/**
 *
 * @author Nguyen Hoang Tan
 */
public class SubjectHomeAction extends org.apache.struts.action.Action {

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
        if(request.getParameter("subjectID")!=null)
        {
            if(checkInt(request.getParameter("subjectID")))
            {
                int id = Integer.parseInt(request.getParameter("subjectID"));
                List<Subject>listSubject=SubjectBO.getSubjectBO().getSubject(id);
                if(listSubject.size()>0)
                {
                    List<Resource> listResource = new ArrayList<Resource>();   
                    //get subject
                    Subject subject = listSubject.get(0);
                    //set Attribute for subject
                    request.setAttribute("subject", subject);
                    //get image link of subject
                    if(ResourceBO.getResourceBO().getAllResource(id, 8).size()>0)
                    {
                        listResource=ResourceBO.getResourceBO().getAllResource(id, 8);
                        String imageLink = "./upload/"+listResource.get(0).getServerName().toString();
                        request.setAttribute("imageLink", imageLink); 
                    }
                    return mapping.findForward(SUCCESS);
                }
            }
        }     
        return mapping.findForward(UNSUCCESS);
    }
}
