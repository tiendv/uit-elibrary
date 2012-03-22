/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package uit.elib.action;

import java.util.List;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;
import uit.elib.utility.IsNumber;
import uit.elib.bo.SubjectBO;
import uit.elib.bo.SubjectCategoryBO;
import uit.elib.bo.FacultyBO;
import uit.elib.dto.Subject;
import uit.elib.formbean.EditSubjectForm;
import uit.elib.utility.CheckGroup;

/**
 *
 * @author HERO
 */
public class LoadEditSubjectAction extends org.apache.struts.action.Action {

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
                if(request.getParameter("subjectID")!=null)
                {
                    IsNumber isnumber = new IsNumber();
                    if(isnumber.checkInt(request.getParameter("subjectID")))
                    {
                        List<Subject> subjectInfo = SubjectBO.getSubjectBO().getAllSubject("SubjectID="+request.getParameter("subjectID"), null);
                        request.setAttribute("subjectInfo",subjectInfo);
                        request.setAttribute("listSubjectCategory", SubjectCategoryBO.getSubjectCategoryBO().getAllSubjectCategory());
                        request.setAttribute("listFaculty", FacultyBO.getFacultyBO().getAll());
                        int facultyID = Integer.parseInt(request.getParameter("facultyID"));
                        request.setAttribute("hiddenFacultyID",facultyID );
                        request.setAttribute("hiddenSubjectCategoryID", subjectInfo.get(0).getSubjectcategory().getSubjectCategoryId());
                        EditSubjectForm editSubjectForm = (EditSubjectForm)form;
                        editSubjectForm.setDropSubjectCategory(subjectInfo.get(0).getSubjectcategory().getSubjectCategoryId());
                        if(subjectInfo.get(0).getSubjectcategory().getSubjectCategoryId()>1)
                            editSubjectForm.setDropFaculty(subjectInfo.get(0).getFaculty().getFacultyId());
                        return mapping.findForward(SUCCESS);
                    }
                }               
            }
        }
        return mapping.findForward(UNSUCCESS);
    }
}
