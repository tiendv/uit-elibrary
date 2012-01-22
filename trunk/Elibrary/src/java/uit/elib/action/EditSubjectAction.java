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
import uit.elib.bo.SubjectBO;
import uit.elib.bo.SubjectCategoryBO;
import uit.elib.dto.Faculty;
import uit.elib.dto.Subject;
import uit.elib.dto.Subjectcategory;
import uit.elib.formbean.CreateSubjectForm;
import uit.elib.formbean.EditSubjectForm;
/**
 *
 * @author HERO
 */
public class EditSubjectAction extends org.apache.struts.action.Action {

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
        
        EditSubjectForm subjectFormBean = (EditSubjectForm) form;
        
        // Get infor category
        Subjectcategory tempCategory;
        tempCategory = SubjectCategoryBO.getSubjectCategoryBO().getById(subjectFormBean.getDropSubjectCategory(), true);
        
        // Get infor faculty
        Faculty tempFaculty=null;
        if(subjectFormBean.getDropSubjectCategory()!=1)
            tempFaculty = FacultyBO.getFacultyBO().getById(subjectFormBean.getDropFaculty(), true);
        SubjectBO subjectBO = SubjectBO.getSubjectBO();
        Subject temp = new Subject();
        temp.setSubjectId(subjectFormBean.getTxtSubjectID());
        temp.setSubjectNameEn(subjectFormBean.getTxtSubjectNameUS());
        temp.setSubjectNameVn(subjectFormBean.getTxtSubjectName());
        temp.setSubjectcategory(tempCategory);
        temp.setCourseCode(subjectFormBean.getTxtSubjectCode());
        temp.setPeriodOfTheory(Integer.parseInt(subjectFormBean.getTxtPeriodOfTheory()));
        temp.setPeriodOfPractice(Integer.parseInt(subjectFormBean.getTxtPeriodOfPractice()));
        temp.setMidtermGrade(Integer.parseInt(subjectFormBean.getTxtMidtermGrade()));
        temp.setFinalGrade(Integer.parseInt(subjectFormBean.getTxtFinalGrade()));
        temp.setPrerequisiteSubjectVn(subjectFormBean.getTxtPrerequisiteSubjectVN());
        temp.setPrerequisiteSubjectEn(subjectFormBean.getTxtPrerequisiteSubject());
        temp.setTimeTeaching(String.valueOf(subjectFormBean.getTxtTimeTeaching()));
        temp.setTeacher(subjectFormBean.getTxtTeacherName());
        temp.setLevel(subjectFormBean.getTxtLevel());
        temp.setFaculty(tempFaculty);
        temp.setSubjectIntroduceVn(subjectFormBean.getFckIntroductionVN());
        temp.setSubjectIntroduceEn(subjectFormBean.getFckIntroductionEN());
        temp.setProjectRequirementVn(subjectFormBean.getFckProjectRequitementVN());
        temp.setProjectRequirementEn(subjectFormBean.getFckProjectRequitementEN());
        temp.setNumberChapter(Integer.parseInt(subjectFormBean.getTxtNumberChapter()));
        temp.setNumberOfCredit(Integer.parseInt(subjectFormBean.getTxtCreditNumber()));
        subjectBO.UpdateSubject(temp);
        //reset form
//        subjectFormBean.setTxtSubjectNameUS("");
//        subjectFormBean.setTxtSubjectName("");
//        subjectFormBean.setDropSubjectCategory(0);
//        subjectFormBean.setDropFaculty(-1);
//        subjectFormBean.setTxtCreditNumber("");
//        subjectFormBean.setTxtSubjectCode("");
//        subjectFormBean.setTxtPeriodOfTheory("");
//        subjectFormBean.setTxtPeriodOfPractice("");
//        subjectFormBean.setTxtMidtermGrade("");
//        subjectFormBean.setTxtFinalGrade("");
//        subjectFormBean.setTxtPrerequisiteSubject("");
//        subjectFormBean.setTxtPrerequisiteSubjectVN("");
//        subjectFormBean.setTxtTimeTeaching("");
//        subjectFormBean.setTxtTeacherName("");
//        subjectFormBean.setTxtLevel("");
//        subjectFormBean.setTxtNumberChapter("");
        Boolean success =true;
        String href="./LoadListOfSubject.do";
        request.setAttribute("success",success);
        request.setAttribute("href",href);
        
        return mapping.findForward(SUCCESS);
    }
}
