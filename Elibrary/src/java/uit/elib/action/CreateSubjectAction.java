/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package uit.elib.action;

import uit.elib.dto.Subject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;
import uit.elib.bo.SubjectBO;
import uit.elib.bo.SubjectCategoryBO;
import uit.elib.bo.SubjectDetailBO;
import uit.elib.dto.Faculty;
import uit.elib.dto.Subjectcategory;
import uit.elib.dto.Subjectdetail;
import uit.elib.formbean.CreateSubjectForm;
import uit.elib.utility.CheckGroup;

/**
 *
 * @author Nguyen Hoang Tan
 */
public class CreateSubjectAction extends org.apache.struts.action.Action {

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
                request.setCharacterEncoding("UTF-8");
                CreateSubjectForm subjectFormBean = (CreateSubjectForm) form;

                // Get infor category
                Subjectcategory tempCategory;
                tempCategory = SubjectCategoryBO.getSubjectCategoryBO().getById(subjectFormBean.getDropSubjectCategory(), true);

                // Add Subject
                SubjectBO subjectBO = SubjectBO.getSubjectBO();
                Subject subject = new Subject(); 

                subject.setSubjectNameEn(subjectFormBean.getTxtSubjectNameUS());
                subject.setSubjectNameVn(subjectFormBean.getTxtSubjectName());
                subject.setSubjectcategory(tempCategory);
                subject.setCourseCode(subjectFormBean.getTxtSubjectCode());
                subject.setPeriodOfTheory(Integer.parseInt(subjectFormBean.getTxtPeriodOfTheory()));
                subject.setPeriodOfPractice(Integer.parseInt(subjectFormBean.getTxtPeriodOfPractice()));
                subject.setMidtermGrade(Integer.parseInt(subjectFormBean.getTxtMidtermGrade()));
                subject.setFinalGrade(Integer.parseInt(subjectFormBean.getTxtFinalGrade()));
                subject.setPrerequisiteSubjectVn(subjectFormBean.getTxtPrerequisiteSubjectVN());
                subject.setPrerequisiteSubjectEn(subjectFormBean.getTxtPrerequisiteSubject());
                subject.setTimeTeaching(Integer.parseInt(subjectFormBean.getTxtTimeTeaching()));
                subject.setTeacher(subjectFormBean.getTxtTeacherName());
                subject.setLevel(subjectFormBean.getTxtLevel());
                subject.setSubjectIntroduceVn(subjectFormBean.getFckIntroductionVN());
                subject.setSubjectIntroduceEn(subjectFormBean.getFckIntroductionEN());
                subject.setProjectRequirementVn(subjectFormBean.getFckProjectRequitementVN());
                subject.setProjectRequirementEn(subjectFormBean.getFckProjectRequitementEN());
                subject.setNumberChapter(Integer.parseInt(subjectFormBean.getTxtNumberChapter()));
                subject.setNumberOfCredit(Integer.parseInt(subjectFormBean.getTxtCreditNumber()));
                subjectBO.addSubject(subject);
                // Add Subject Detail
                Subjectdetail subjectdetail = new Subjectdetail();
                subjectdetail.setSubject(subject);
                SubjectDetailBO subjectDetailBO = SubjectDetailBO.getSubjectDetailBO();
                if(subjectFormBean.getDropSubjectCategory()!=1)
                {    
                    for(int i=0;i<subjectFormBean.getDropFaculty().length;i++)
                     {    
                         Faculty faculty = new Faculty();
                         faculty.setFacultyId(subjectFormBean.getDropFaculty()[i]);
                         subjectdetail.setFaculty(faculty);
                         subjectDetailBO.addSubjectDetail(subjectdetail);
                     }
                }
                //reset form
                subjectFormBean.setTxtSubjectNameUS("");
                subjectFormBean.setTxtSubjectName("");
                subjectFormBean.setDropSubjectCategory(0);
                int [] items = new int[subjectFormBean.getDropFaculty().length];
                subjectFormBean.setDropFaculty(items);
                subjectFormBean.setTxtCreditNumber("");
                subjectFormBean.setTxtSubjectCode("");
                subjectFormBean.setTxtPeriodOfTheory("");
                subjectFormBean.setTxtPeriodOfPractice("");
                subjectFormBean.setTxtMidtermGrade("");
                subjectFormBean.setTxtFinalGrade("");
                subjectFormBean.setTxtPrerequisiteSubject("");
                subjectFormBean.setTxtPrerequisiteSubjectVN("");
                subjectFormBean.setTxtTimeTeaching("");
                subjectFormBean.setTxtTeacherName("");
                subjectFormBean.setTxtLevel("");
                subjectFormBean.setTxtNumberChapter("");
                Boolean success =true;
                String href="./LoadListOfSubject.do";
                request.setAttribute("success",success);
                request.setAttribute("href",href);
                return mapping.findForward(SUCCESS);
            }
        }
        return mapping.findForward(UNSUCCESS);
    }
}
