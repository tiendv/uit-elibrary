/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package uit.elib.action;

import uit.elib.entities.Subject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;
import uit.elib.bo.SpecialityBO;
import uit.elib.bo.SubjectBO;
import uit.elib.bo.SubjectCategorytBO;
import uit.elib.entities.Speciality;
import uit.elib.entities.Subjectcategory;
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
        SubjectCategorytBO tempSubjectCategorytBO =  new SubjectCategorytBO();
        Subjectcategory tempCategory;
        tempCategory = tempSubjectCategorytBO.getById(subjectFormBean.getDropSubjectCategory(), true);
        
        // Get infor speciality
        Speciality tempSpeciality;
        SpecialityBO tempSpecialityBO = SpecialityBO.getSpecialityBO();
        tempSpeciality = tempSpecialityBO.getById(subjectFormBean.getDropSubjectFaculty(), true);
                
        SubjectBO subjectBO = SubjectBO.getSubjectBO();
        Subject temp = new Subject(); 
        
        temp.setSubjectName(subjectFormBean.getTxtSubjectNameUS());
        temp.setSubjectNameVn(subjectFormBean.getTxtSubjectName());
        temp.setSubjectcategory(tempCategory);
        temp.setCourseCode(subjectFormBean.getTxtSubjectCode());
        temp.setPeriodOfTheory(subjectFormBean.getTxtPeriodOfTheory());
        temp.setPeriodOfPractice(subjectFormBean.getTxtPeriodOfPractice());
        temp.setMidtermGrade(subjectFormBean.getTxtMidtermGrade());
        temp.setFinalGrade(subjectFormBean.getTxtFinalGrade());
        temp.setPrerequisiteSubject(subjectFormBean.getTxtPrerequisiteSubject());
        temp.setTimeTeaching(subjectFormBean.getTxtSubjectTime());
        temp.setTeacher(subjectFormBean.getTxtTeacherName());
        temp.setLevel(subjectFormBean.getTxtLevel());
        temp.setSpeciality(tempSpeciality);
        temp.setSubjectIntroduceVn(subjectFormBean.getFckintroductionVN());
        temp.setSubjectIntroduce(subjectFormBean.getFckintroductionUS());
        temp.setProjectRequitement(subjectFormBean.getFckintroductionVN());
        temp.setProjectRequitementUs(subjectFormBean.getFckProjectRequitementUS());
        subjectBO.addNew(temp);  
        return mapping.findForward(SUCCESS);
    }
}
