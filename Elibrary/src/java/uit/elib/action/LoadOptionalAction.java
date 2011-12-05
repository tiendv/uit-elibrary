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
public class LoadOptionalAction extends org.apache.struts.action.Action {

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
        SubjectBO tempSubjectBO = SubjectBO.getSubjectBO();
        List<Subject> listSubject = new ArrayList<Subject>();
        String []order = new String[1];
        order[0]= "subjectId";
        String where ="subjectCategoryId = 3";
        listSubject=tempSubjectBO.getAllSubject(where,order);
        request.setAttribute("listSubject", listSubject);
               
        ResourceBO tempResourceBO = ResourceBO.getResourceBO();
        List<Resource> listResource = new ArrayList<Resource>();
        order = new String[3];
        order[0]= "subject";
        order[1]= "orderChapter";
        order[2]= "postDate";
        where = "orderChapter is not null";
        listResource=tempResourceBO.getAllResource(where,order);
        request.setAttribute("listResource", listResource);         
              
        return mapping.findForward(SUCCESS);
    }
}
