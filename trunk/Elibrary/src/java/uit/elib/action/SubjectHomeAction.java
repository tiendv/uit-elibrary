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
import uit.elib.entities.Resource;
import uit.elib.entities.Subject;

/**
 *
 * @author Nguyen Hoang Tan
 */
public class SubjectHomeAction extends org.apache.struts.action.Action {

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
        if(request.getParameter("subjectID")!=null)
        {
            if(checkInt(request.getParameter("subjectID")))
            {
                int id = Integer.parseInt(request.getParameter("subjectID"));
                //BO
                SubjectBO subjectBO = new SubjectBO();
                ResourceBO resourceBO = new ResourceBO(); 
                //Entity
                Subject subject= new Subject();
                List<Resource> listResource = new ArrayList<Resource>();   
                //get subject
                subject=subjectBO.getSubjectByID(id);
                //get image link of subject
                listResource=resourceBO.getAllResourceOfSubjectAndResourceCategory(id, 8);
                String imageLink = "./file/"+listResource.get(0).getServerName().toString();
                //set Attribute
                request.setAttribute("imageLink", imageLink); 
                request.setAttribute("subject", subject);
            }
        }     
        return mapping.findForward(SUCCESS);
    }
}
