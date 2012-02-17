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
import uit.elib.bo.FacultyBO;
import uit.elib.bo.ResourceBO;
import uit.elib.bo.SubjectBO;
import uit.elib.dto.Faculty;
import uit.elib.dto.Resource;
import uit.elib.dto.Subject;
import uit.elib.utility.CheckGroup;
import uit.elib.utility.CheckGroupDetail;

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
        //Faculty
        FacultyBO tempFacultyBO = FacultyBO.getFacultyBO();
        List<Faculty> listFaculty = new ArrayList<Faculty>();
        String []order = new String[1];
        order[0]= "facultyId";
        listFaculty=tempFacultyBO.getAllFaculty(order);
        request.setAttribute("listFaculty", listFaculty);       
        //Subject
        SubjectBO tempSubjectBO = SubjectBO.getSubjectBO();
        List<Subject> listSubject = new ArrayList<Subject>();
        order = new String[2];
        order[0]= "faculty";
        order[1]= "subjectId";
        String where ="subjectCategoryID = 3";
        listSubject=tempSubjectBO.getAllSubject(where,order);
        request.setAttribute("listSubject", listSubject);
        //Order
        order = new String[3];
        order[0]= "subject";
        order[1]= "orderChapter";
        order[2]= "postDate desc";
        ResourceBO tempResourceBO = ResourceBO.getResourceBO();
        List<List<Resource>> arrayListResource = new ArrayList<List<Resource>>();
        String []whereSubjectId = new String[listSubject.size()];
        //check permission to display resource category
        String username  = null;
        if(request.getSession().getAttribute("username")!=null)
            username=(String)request.getSession().getAttribute("username");
        CheckGroup checkGroup = new CheckGroup();
        int group = checkGroup.Group(username);
        String notIn="";
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
                notIn=" and resourceCategoryID not in("+resourceCategoryID+")";
            }             
        }        
        for(int i= 0;i<listSubject.size();i++)  
            whereSubjectId[i] = "orderChapter is not null and subjectId ="+listSubject.get(i).getSubjectId()+notIn;
        arrayListResource=tempResourceBO.getAllResource(whereSubjectId,order); 
        request.setAttribute("arrayListResource", arrayListResource);         
        return mapping.findForward(SUCCESS);
    }
}
