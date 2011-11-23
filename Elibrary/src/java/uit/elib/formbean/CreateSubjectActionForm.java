/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package uit.elib.formbean;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts.action.ActionErrors;
import org.apache.struts.action.ActionMapping;
import org.apache.struts.action.ActionMessage;

/**
 *
 * @author tiendv
 */
public class CreateSubjectActionForm extends org.apache.struts.action.ActionForm {

    private String txtSubjectName;
    private String txtSubjectCode;
    private String txtPeriodOfTheory;
    private String txtPeriodOfPractice;
    private String txtMidtermGrade;
    private String txtFinalGrade;
    private String txtPrerequisiteSubject;
    private String txtSubjectTime;
    private String txtTeacherName;
    private String txtLevel;
    private String fckintroductionVN;
    private String fckintroductionUS;
    private String fckProjectRequitementVN;
    private String fckProjectRequitementUS;
    
    public String getFckProjectRequitementUS() {
        return fckProjectRequitementUS;
    }

    public void setFckProjectRequitementUS(String fckProjectRequitementUS) {
        this.fckProjectRequitementUS = fckProjectRequitementUS;
    }

    public String getFckProjectRequitementVN() {
        return fckProjectRequitementVN;
    }

    public void setFckProjectRequitementVN(String fckProjectRequitementVN) {
        this.fckProjectRequitementVN = fckProjectRequitementVN;
    }

    public String getFckintroductionUS() {
        return fckintroductionUS;
    }

    public void setFckintroductionUS(String fckintroductionUS) {
        this.fckintroductionUS = fckintroductionUS;
    }

    public String getFckintroductionVN() {
        return fckintroductionVN;
    }

    public void setFckintroductionVN(String fckintroductionVN) {
        this.fckintroductionVN = fckintroductionVN;
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

    public String getTxtSubjectTime() {
        return txtSubjectTime;
    }

    public void setTxtSubjectTime(String txtSubjectTime) {
        this.txtSubjectTime = txtSubjectTime;
    }

    public String getTxtTeacherName() {
        return txtTeacherName;
    }

    public void setTxtTeacherName(String txtTeacherName) {
        this.txtTeacherName = txtTeacherName;
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
