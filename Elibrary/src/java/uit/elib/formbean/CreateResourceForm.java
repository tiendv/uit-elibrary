/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package uit.elib.formbean;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts.action.ActionErrors;
import org.apache.struts.action.ActionMapping;
import org.apache.struts.upload.FormFile;

/**
 *
 * @author Nguyen Hoang Tan
 */
public class CreateResourceForm extends org.apache.struts.action.ActionForm {
    
    private String txtResourceNameVN;
    private String txtResourceNameEN;
    private int dropResourceCategory;
    private String txtChapterUSName;
    private int txtOrderChapter;
    private int dropSubjectInChapter;
    private String fckChapterSummaryVN;
    private String fckChapterSummaryEN;
    private String txtProjectNameEN;
    private String txtAuthorProject;
    private int dropSubjectInProject;
    private FormFile fileProject;
    private FormFile fileResourceSysllabus;
    private String txtNote;
    private int dropSubjectInReadingAndPicture;
    private FormFile filePictureReading;
    private int dropSubjectInResourceChapter;
    private int dropOrderChapterSubject;
    private FormFile fileResourceChapter;
    private int dropSubjectInSysllabus;

    public String getTxtResourceNameEN() {
        return txtResourceNameEN;
    }

    public void setTxtResourceNameEN(String txtResourceNameEN) {
        this.txtResourceNameEN = txtResourceNameEN;
    }

    public String getTxtResourceNameVN() {
        return txtResourceNameVN;
    }

    public void setTxtResourceNameVN(String txtResourceNameVN) {
        this.txtResourceNameVN = txtResourceNameVN;
    }

    public FormFile getFileResourceSysllabus() {
        return fileResourceSysllabus;
    }

    public void setFileResourceSysllabus(FormFile fileResourceSysllabus) {
        this.fileResourceSysllabus = fileResourceSysllabus;
    }

    public int getDropSubjectInSysllabus() {
        return dropSubjectInSysllabus;
    }

    public void setDropSubjectInSysllabus(int dropSubjectInSysllabus) {
        this.dropSubjectInSysllabus = dropSubjectInSysllabus;
    }
    
    public String getTxtChapterUSName() {
        return txtChapterUSName;
    }

    public void setTxtChapterUSName(String txtChapterUSName) {
        this.txtChapterUSName = txtChapterUSName;
    }

    public int getDropOrderChapterSubject() {
        return dropOrderChapterSubject;
    }

    public void setDropOrderChapterSubject(int dropOrderChapterSubject) {
        this.dropOrderChapterSubject = dropOrderChapterSubject;
    }

    public FormFile getFilePictureReading() {
        return filePictureReading;
    }

    public void setFilePictureReading(FormFile filePictureReading) {
        this.filePictureReading = filePictureReading;
    }

    public FormFile getFileProject() {
        return fileProject;
    }

    public void setFileProject(FormFile fileProject) {
        this.fileProject = fileProject;
    }

    public FormFile getFileResourceChapter() {
        return fileResourceChapter;
    }

    public void setFileResourceChapter(FormFile fileResourceChapter) {
        this.fileResourceChapter = fileResourceChapter;
    }

    public int getDropResourceCategory() {
        return dropResourceCategory;
    }

    public void setDropResourceCategory(int dropResourceCategory) {
        this.dropResourceCategory = dropResourceCategory;
    }

    public int getDropSubjectInChapter() {
        return dropSubjectInChapter;
    }

    public void setDropSubjectInChapter(int dropSubjectInChapter) {
        this.dropSubjectInChapter = dropSubjectInChapter;
    }

    public int getDropSubjectInProject() {
        return dropSubjectInProject;
    }

    public void setDropSubjectInProject(int dropSubjectInProject) {
        this.dropSubjectInProject = dropSubjectInProject;
    }

    public int getDropSubjectInReadingAndPicture() {
        return dropSubjectInReadingAndPicture;
    }

    public void setDropSubjectInReadingAndPicture(int dropSubjectInReadingAndPicture) {
        this.dropSubjectInReadingAndPicture = dropSubjectInReadingAndPicture;
    }

    public int getDropSubjectInResourceChapter() {
        return dropSubjectInResourceChapter;
    }

    public void setDropSubjectInResourceChapter(int dropSubjectInResourceChapter) {
        this.dropSubjectInResourceChapter = dropSubjectInResourceChapter;
    }

    public String getFckChapterSummaryVN() {
        return fckChapterSummaryVN;
    }

    public void setFckChapterSummaryVN(String fckChapterSummary) {
        this.fckChapterSummaryVN = fckChapterSummary;
    }

    public String getFckChapterSummaryEN() {
        return fckChapterSummaryEN;
    }

    public void setFckChapterSummaryEN(String fckChapterSummaryEN) {
        this.fckChapterSummaryEN = fckChapterSummaryEN;
    }

    public String getTxtAuthorProject() {
        return txtAuthorProject;
    }

    public void setTxtAuthorProject(String txtAuthorProject) {
        this.txtAuthorProject = txtAuthorProject;
    }

    public String getTxtNote() {
        return txtNote;
    }

    public void setTxtNote(String txtNote) {
        this.txtNote = txtNote;
    }

    public int getTxtOrderChapter() {
        return txtOrderChapter;
    }

    public void setTxtOrderChapter(int txtOrderChapter) {
        this.txtOrderChapter = txtOrderChapter;
    }

    public String getTxtProjectNameEN() {
        return txtProjectNameEN;
    }

    public void setTxtProjectNameEN(String txtProjectNameEN) {
        this.txtProjectNameEN = txtProjectNameEN;
    }

    /**
     *
     */
    public CreateResourceForm() {
        super();
        // TODO Auto-generated constructor stub
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
