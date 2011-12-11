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
    
    private String txtResourceName;
    private int dropResourceType;;
    private String txtChapterUSName;
    private int txtOrderChapter;
    private int dropSubjectNameInChapter;
    private String fckChapterSummaryVN;
    private String fckChapterSummaryEN;
    private String txtProjectNameEN;
    private String txtAuthorProject;
    private int dropSubjectNameInProject;
    private FormFile fileProject;
    private String txtNote;
    private int dropSubjectNameInReadingAndPicture;
    private FormFile filePictureReading;
    private int dropSubjectNameInResourceChapter;
    private int dropOrderChapterSubject;
    private FormFile fileResourceChapter;
    private String hiddenResourceType;
    private int dropSubjectNameInSysllabus;

    public int getDropSubjectNameInSysllabus() {
        return dropSubjectNameInSysllabus;
    }

    public void setDropSubjectNameInSysllabus(int dropSubjectNameInSysllabus) {
        this.dropSubjectNameInSysllabus = dropSubjectNameInSysllabus;
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

    public String getHiddenResourceType() {
        return hiddenResourceType;
    }

    public void setHiddenResourceType(String hiddenResourceType) {
        this.hiddenResourceType = hiddenResourceType;
    }
    
    public int getDropResourceType() {
        return dropResourceType;
    }

    public void setDropResourceType(int dropResourceType) {
        this.dropResourceType = dropResourceType;
    }

    public int getDropSubjectNameInChapter() {
        return dropSubjectNameInChapter;
    }

    public void setDropSubjectNameInChapter(int dropSubjectNameInChapter) {
        this.dropSubjectNameInChapter = dropSubjectNameInChapter;
    }

    public int getDropSubjectNameInProject() {
        return dropSubjectNameInProject;
    }

    public void setDropSubjectNameInProject(int dropSubjectNameInProject) {
        this.dropSubjectNameInProject = dropSubjectNameInProject;
    }

    public int getDropSubjectNameInReadingAndPicture() {
        return dropSubjectNameInReadingAndPicture;
    }

    public void setDropSubjectNameInReadingAndPicture(int dropSubjectNameInReadingAndPicture) {
        this.dropSubjectNameInReadingAndPicture = dropSubjectNameInReadingAndPicture;
    }

    public int getDropSubjectNameInResourceChapter() {
        return dropSubjectNameInResourceChapter;
    }

    public void setDropSubjectNameInResourceChapter(int dropSubjectNameInResourceChapter) {
        this.dropSubjectNameInResourceChapter = dropSubjectNameInResourceChapter;
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

    public String getTxtResourceName() {
        return txtResourceName;
    }

    public void setTxtResourceName(String txtResourceName) {
        this.txtResourceName = txtResourceName;
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
