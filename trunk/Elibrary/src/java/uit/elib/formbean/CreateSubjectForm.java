/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package uit.elib.formbean;
import javax.servlet.http.HttpServletRequest;
import org.apache.struts.action.ActionErrors;
import org.apache.struts.action.ActionMapping;

/**
 *
 * @author Nguyen Hoang Tan
 */
public class CreateSubjectForm extends org.apache.struts.action.ActionForm {

    private String txtSubjectNameUS;
    private int dropSubjectCategory;
    private String txtSubjectCode;
    private String txtPeriodOfTheory;
    private String txtPeriodOfPractice;
    private String txtMidtermGrade;
    private String txtFinalGrade;
    private String txtPrerequisiteSubject;
    private String txtPrerequisiteSubjectVN;
    private String txtTimeTeaching;
    private String txtTeacherName;
    private String txtLevel;
    private int []dropFaculty;
    private String FckIntroductionVN;
    private String FckIntroductionEN;
    private String FckProjectRequitementVN;
    private String FckProjectRequitementEN;
    private String txtSubjectName;
    private String txtNumberChapter;
    private String txtCreditNumber;

    public int[] getDropFaculty() {
        return dropFaculty;
    }

    public void setDropFaculty(int[] dropFaculty) {
        this.dropFaculty = dropFaculty;
    }

    public int getDropSubjectCategory() {
        return dropSubjectCategory;
    }

    public void setDropSubjectCategory(int dropSubjectCategory) {
        this.dropSubjectCategory = dropSubjectCategory;
    }

    public String getFckProjectRequitementEN() {
        return FckProjectRequitementEN;
    }

    public void setFckProjectRequitementEN(String FckProjectRequitementEN) {
        this.FckProjectRequitementEN = FckProjectRequitementEN;
    }

    public String getFckProjectRequitementVN() {
        return FckProjectRequitementVN;
    }

    public void setFckProjectRequitementVN(String FckProjectRequitementVN) {
        this.FckProjectRequitementVN = FckProjectRequitementVN;
    }

    public String getFckIntroductionEN() {
        return FckIntroductionEN;
    }

    public void setFckIntroductionEN(String FckIntroductionEN) {
        this.FckIntroductionEN = FckIntroductionEN;
    }

    public String getFckIntroductionVN() {
        return FckIntroductionVN;
    }

    public void setFckIntroductionVN(String FckIntroductionVN) {
        this.FckIntroductionVN = FckIntroductionVN;
    }

    public String getTxtCreditNumber() {
        return txtCreditNumber;
    }

    public void setTxtCreditNumber(String txtCreditNumber) {
        this.txtCreditNumber = txtCreditNumber;
    }

    public String getTxtFinalGrade() {
        return txtFinalGrade;
    }

    public void setTxtFinalGrade(String txtFinalGrade) {
        this.txtFinalGrade = txtFinalGrade;
    }

    public String getTxtLevel() {
        return txtLevel;
    }

    public void setTxtLevel(String txtLevel) {
        this.txtLevel = txtLevel;
    }

    public String getTxtMidtermGrade() {
        return txtMidtermGrade;
    }

    public void setTxtMidtermGrade(String txtMidtermGrade) {
        this.txtMidtermGrade = txtMidtermGrade;
    }

    public String getTxtNumberChapter() {
        return txtNumberChapter;
    }

    public void setTxtNumberChapter(String txtNumberChapter) {
        this.txtNumberChapter = txtNumberChapter;
    }

    public String getTxtPeriodOfPractice() {
        return txtPeriodOfPractice;
    }

    public void setTxtPeriodOfPractice(String txtPeriodOfPractice) {
        this.txtPeriodOfPractice = txtPeriodOfPractice;
    }

    public String getTxtPeriodOfTheory() {
        return txtPeriodOfTheory;
    }

    public void setTxtPeriodOfTheory(String txtPeriodOfTheory) {
        this.txtPeriodOfTheory = txtPeriodOfTheory;
    }

    public String getTxtPrerequisiteSubject() {
        return txtPrerequisiteSubject;
    }

    public void setTxtPrerequisiteSubject(String txtPrerequisiteSubject) {
        this.txtPrerequisiteSubject = txtPrerequisiteSubject;
    }

    public String getTxtPrerequisiteSubjectVN() {
        return txtPrerequisiteSubjectVN;
    }

    public void setTxtPrerequisiteSubjectVN(String txtPrerequisiteSubjectVN) {
        this.txtPrerequisiteSubjectVN = txtPrerequisiteSubjectVN;
    }

    public String getTxtSubjectCode() {
        return txtSubjectCode;
    }

    public void setTxtSubjectCode(String txtSubjectCode) {
        this.txtSubjectCode = txtSubjectCode;
    }

    public String getTxtSubjectName() {
        return txtSubjectName;
    }

    public void setTxtSubjectName(String txtSubjectName) {
        this.txtSubjectName = txtSubjectName;
    }

    public String getTxtSubjectNameUS() {
        return txtSubjectNameUS;
    }

    public void setTxtSubjectNameUS(String txtSubjectNameUS) {
        this.txtSubjectNameUS = txtSubjectNameUS;
    }

    public String getTxtTeacherName() {
        return txtTeacherName;
    }

    public void setTxtTeacherName(String txtTeacherName) {
        this.txtTeacherName = txtTeacherName;
    }

    public String getTxtTimeTeaching() {
        return txtTimeTeaching;
    }

    public void setTxtTimeTeaching(String txtTimeTeaching) {
        this.txtTimeTeaching = txtTimeTeaching;
    }

    
   
    /**
     * This is the action called from the Struts framework.
     * @param mapping The ActionMapping used to select this instance.
     * @param request The HTTP Request we are processing.
     * @return
     */
    public ActionErrors validate(ActionMapping mapping, HttpServletRequest request) {
        ActionErrors errors = new ActionErrors();
     
        return errors;
    }
}
