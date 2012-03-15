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
import uit.elib.bo.FacultyBO;
import uit.elib.bo.SubjectCategoryBO;
import uit.elib.dto.Faculty;
import uit.elib.formbean.LoadCreateSubjectForm;
import java.util.List;
import javax.servlet.http.HttpSession;
import uit.elib.utility.CheckGroup;

/**
 *
 * @author Nguyen Hoang Tan
 */
public class LoadCreateSubjectAction extends org.apache.struts.action.Action {

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
                LoadCreateSubjectForm loadCreateSubjectForm = (LoadCreateSubjectForm)form;
                //faculty
                FacultyBO facultyBO = FacultyBO.getFacultyBO();
                List<Faculty> listFaculty = facultyBO.getAllFaculty();
                loadCreateSubjectForm.setListDropFaculty(listFaculty);
                //Subject Category
                SubjectCategoryBO subjectCategoryBO = SubjectCategoryBO.getSubjectCategoryBO();
                loadCreateSubjectForm.setListDropSubjectCategory(subjectCategoryBO.getAllSubjectCategory());
                return mapping.findForward(SUCCESS);
            }
        }
        return mapping.findForward(UNSUCCESS);
    }
}
