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
import uit.elib.utility.CheckGroup;
import uit.elib.utility.CheckGroupDetail;

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
        SubjectBO tempSubjectBO = SubjectBO.getSubjectBO();
        List<Subject> listSubject = new ArrayList<Subject>();
        String []order = new String[1];
        order[0]= "subjectId";
        listSubject=tempSubjectBO.getAllSubject(order);      
        request.setAttribute("listSubject", listSubject);       
        ResourceBO tempResourceBO = ResourceBO.getResourceBO();
        List<Resource> listResource = new ArrayList<Resource>();
        order = new String[3];
        order[0]= "subject";
        order[1]= "orderChapter";
        order[2]= "postDate desc";
        String username  = null;
        if(request.getSession().getAttribute("username")!=null)
            username=(String)request.getSession().getAttribute("username");
        CheckGroup checkGroup = new CheckGroup();
        int group = checkGroup.Group(username);
        String where = "orderChapter is not null";
        //check permission to display resource category
        if(group!=1 && group!=3) //admin and mod
        {
            CheckGroupDetail checkGroupDetail = new CheckGroupDetail();
            String resourceCategoryID ="";
            if(!checkGroupDetail.GroupDetail(username, 4, 1))
                resourceCategoryID = resourceCategoryID+"4,";
            if(!checkGroupDetail.GroupDetail(username, 5, 1))
                resourceCategoryID = resourceCategoryID+"5,";
            if(!checkGroupDetail.GroupDetail(username, 10, 1))
                resourceCategoryID = resourceCategoryID+"10,";
            if(!checkGroupDetail.GroupDetail(username, 11, 1))
                resourceCategoryID = resourceCategoryID+"11,";
            if(!resourceCategoryID.equals(""))
            {
                resourceCategoryID=resourceCategoryID.substring(0, resourceCategoryID.length()-1);
                where="orderChapter is not null and resourceCategoryID not in("+resourceCategoryID+")";
            }  
        }    
        listResource=tempResourceBO.getAllResource(where,order);
        request.setAttribute("listResource", listResource);       
        return mapping.findForward(SUCCESS);  
    }
}
