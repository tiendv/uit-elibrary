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
import uit.elib.bo.ResourceBO;
import uit.elib.utility.IsNumber;
import java.util.List;
import javax.servlet.http.HttpSession;
import uit.elib.bo.FacultyBO;
import uit.elib.bo.LevelBO;
import uit.elib.bo.ResourceCategoryBO;
import uit.elib.bo.SubjectBO;
import uit.elib.dto.Faculty;
import uit.elib.dto.Level;
import uit.elib.dto.Resource;
import uit.elib.dto.Resourcecategory;
import uit.elib.dto.Subject;
import uit.elib.utility.CheckGroup;
/**
 *
 * @author Nguyen Hoang Tan
 */
public class LoadEditResourceAction extends org.apache.struts.action.Action {

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
        int checkgroup =2; //visitor 
        HttpSession session = request.getSession();
        if(session.getAttribute("username")!=null){ 
            CheckGroup checkGroup = new CheckGroup();
            checkgroup = checkGroup.Group((String)session.getAttribute("username"));
            if(checkgroup==-1) // account has just been locked while users are accessing or  account has just expired while users are accessing
            {   
                 session.removeAttribute("username");
                 session.removeAttribute("group");
            }
            if(checkgroup==1||checkgroup==3)// admin or mod
            {        
                if(request.getParameter("resourceID")!=null)
                {
                    IsNumber isNumber = new IsNumber();
                    if(isNumber.checkInt(request.getParameter("resourceID")))
                    {
                        int resourceID = Integer.parseInt(request.getParameter("resourceID"));
                        ResourceBO resourceBO = ResourceBO.getResourceBO();
                        List<Resource> listResource = resourceBO.getAllResource("resourceId="+resourceID, null);
                        List<Level> listLevel = LevelBO.getLevelBO().getAllLevel();
                        List<Faculty> listFaculty = FacultyBO.getFacultyBO().getAllFaculty();
                        if(listResource.size()>0)
                        {
                            ResourceCategoryBO resourceCategoryBO = ResourceCategoryBO.getResourceCategoryBO();
                            List<Resourcecategory> listResourceCategory = resourceCategoryBO.getAllResourcecategory();
                            SubjectBO subjectBO = SubjectBO.getSubjectBO();
                            List<Subject> listSubject = subjectBO.getAllSubject();
                            request.setAttribute("listResource", listResource);
                            request.setAttribute("listResourceCategory", listResourceCategory);
                            request.setAttribute("listSubject", listSubject);
                            request.setAttribute("listLevel", listLevel);
                            request.setAttribute("listFaculty", listFaculty);                    
                            return mapping.findForward(SUCCESS);
                        }
                    }
                }
            }
        }
        return mapping.findForward(UNSUCCESS);
    }
}
