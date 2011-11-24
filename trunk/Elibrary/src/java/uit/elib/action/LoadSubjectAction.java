/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package uit.elib.action;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;
import uit.elib.bo.ResourceBO;
import uit.elib.bo.SubjectBO;
import uit.elib.database.hibernate.ManagerBase;
import uit.elib.entities.Resource;
import uit.elib.entities.Subject;

/**
 *
 * @author Nguyen Hoang Tan
 */
public class LoadSubjectAction extends org.apache.struts.action.Action {

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
        SubjectBO tempSubjectBO = new SubjectBO();
        List<Subject> listSubject = new ArrayList<Subject>();
        String []order = new String[1];
        order[0]= "subjectId";
        listSubject=tempSubjectBO.getBySQLQuery(order, 0);
        request.setAttribute("listSubject", listSubject);
        
        ResourceBO tempResourceBO = new ResourceBO();
        List<Resource> listResource = new ArrayList<Resource>();
        order = new String[2];
        order[0]= "subject";
        order[1]= "oderChapter";
        listResource=tempResourceBO.getBySQLQuery(order, 0);
        request.setAttribute("listResource", listResource);       
        return mapping.findForward(SUCCESS);  
    }
}
