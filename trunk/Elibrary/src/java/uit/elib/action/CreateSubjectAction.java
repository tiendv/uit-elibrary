/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package uit.elib.action;

import uit.elib.dto.Subject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;
import uit.elib.bo.FacultyBO;
import uit.elib.bo.SubjectBO;
import uit.elib.bo.SubjectCategoryBO;
import uit.elib.dto.Faculty;
import uit.elib.dto.Subjectcategory;
import uit.elib.formbean.CreateSubjectActionForm;

/**
 *
 * @author tiendv
 */
public class CreateSubjectAction extends org.apache.struts.action.Action {

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
          request.setCharacterEncoding("UTF-8");
        
        CreateSubjectActionForm subjectFormBean = (CreateSubjectActionForm) form;
        
        // Get infor category
        Subjectcategory tempCategory;
        tempCategory = SubjectCategoryBO.getSubjectBO().getById(subjectFormBean.getDropSubjectCategory(), true);
        
        // Get infor faculty
        Faculty tempFaculty;
        tempFaculty = FacultyBO.getFacultyBO().getById(subjectFormBean.getDropSubjectFaculty(), true);
                
        SubjectBO subjectBO = SubjectBO.getSubjectBO();
        Subject temp = new Subject(); 
        
        temp.setSubjectNameEn(subjectFormBean.getTxtSubjectNameUS());
        temp.setSubjectNameVn(subjectFormBean.getTxtSubjectName());
        temp.setSubjectcategory(tempCategory);
        temp.setCourseCode(subjectFormBean.getTxtSubjectCode());
        temp.setPeriodOfTheory(subjectFormBean.getTxtPeriodOfTheory());
        temp.setPeriodOfPractice(subjectFormBean.getTxtPeriodOfPractice());
        temp.setMidtermGrade(subjectFormBean.getTxtMidtermGrade());
        temp.setFinalGrade(subjectFormBean.getTxtFinalGrade());
        temp.setPrerequisiteSubjectEn(subjectFormBean.getTxtPrerequisiteSubject());
        temp.setTimeTeaching(subjectFormBean.getTxtSubjectTime());
        temp.setTeacher(subjectFormBean.getTxtTeacherName());
        temp.setLevel(subjectFormBean.getTxtLevel());
        temp.setFaculty(tempFaculty);
        temp.setSubjectIntroduceVn(subjectFormBean.getFckintroductionVN());
        temp.setSubjectIntroduceEn(subjectFormBean.getFckintroductionUS());
        temp.setProjectRequirementVn(subjectFormBean.getFckintroductionVN());
        temp.setProjectRequirementEn(subjectFormBean.getFckProjectRequitementUS());
        subjectBO.addNew(temp);  
        return mapping.findForward(SUCCESS);
    }
}
