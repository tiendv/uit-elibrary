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


    private String txtSubjectNameUS;
    private int dropSubjectCategory;
    private String txtSubjectCode;
    private int txtPeriodOfTheory;
    private int txtPeriodOfPractice;
    private int txtMidtermGrade;
    private int txtFinalGrade;
    private String txtPrerequisiteSubject;
    private String txtSubjectTime;
    private String txtTeacherName;
    private String txtLevel;
    private int dropSubjectFaculty;
    private String fckintroductionVN;
    private String fckintroductionUS;
    private String fckProjectRequitementVN;
    private String fckProjectRequitementUS;
    private String txtSubjectName;

    public int getDropSubjectCategory() {
        return dropSubjectCategory;
    }

    public void setDropSubjectCategory(int dropSubjectCategory) {
        this.dropSubjectCategory = dropSubjectCategory;
    }

    public int getDropSubjectFaculty() {
        return dropSubjectFaculty;
    }

    public void setDropSubjectFaculty(int dropSubjectFaculty) {
        this.dropSubjectFaculty = dropSubjectFaculty;
    }

    public String getTxtSubjectNameUS() {
        return txtSubjectNameUS;
    }

    public void setTxtSubjectNameUS(String txtSubjectNameUS) {
        this.txtSubjectNameUS = txtSubjectNameUS;
    }
    
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

    public int getTxtFinalGrade() {
        return txtFinalGrade;
    }

    public void setTxtFinalGrade(int txtFinalGrade) {
        this.txtFinalGrade = txtFinalGrade;
    }

    public String getTxtLevel() {
        return txtLevel;
    }

    public void setTxtLevel(String txtLevel) {
        this.txtLevel = txtLevel;
    }

    public int getTxtMidtermGrade() {
        return txtMidtermGrade;
    }

    public void setTxtMidtermGrade(int txtMidtermGrade) {
        this.txtMidtermGrade = txtMidtermGrade;
    }

    public int getTxtPeriodOfPractice() {
        return txtPeriodOfPractice;
    }

    public void setTxtPeriodOfPractice(int txtPeriodOfPractice) {
        this.txtPeriodOfPractice = txtPeriodOfPractice;
    }

    public int getTxtPeriodOfTheory() {
        return txtPeriodOfTheory;
    }

    public void setTxtPeriodOfTheory(int txtPeriodOfTheory) {
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
