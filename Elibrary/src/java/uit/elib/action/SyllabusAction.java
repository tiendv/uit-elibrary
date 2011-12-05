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
import uit.elib.bo.SubjectBO;
import uit.elib.dto.Subject;

/**
 *
 * @author Nguyen Hoang Tan
 */
public class SyllabusAction extends org.apache.struts.action.Action {

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
                //Entity
                Subject subject= new Subject(); 
                //get subject
                subject=SubjectBO.getSubjectBO().getSubjectByID(id);
                //set Attribute
                request.setAttribute("subject", subject);
            }     
        } 
        return mapping.findForward(SUCCESS);
    }
}
