/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package uit.elib.formbean;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts.action.ActionErrors;
import org.apache.struts.action.ActionMapping;
import org.apache.struts.action.ActionMessage;
import org.apache.struts.upload.FormFile;

/**
 *
 * @author tiendv
 */
public class CrateResourceActionForm extends org.apache.struts.action.ActionForm {
    
    private String txtResourceName;
    private int dropResourceType;;
    private String txtChapterUSName;
    private int txtOderChapter;
    private int dropSubjectNameInChapter;
    private String fckChapterSummary;
    private String fckChapterSummaryUS;
    private String txtProjectUSName;
    private String txtAuthorProject;
    private String dropSubjectNameInProject;
    private String txtNote;
    private String dropSubjectNameInReadingAndPicture;
    private String dropSubjectNameInResourceChapter;
    private String txtorderchapter;
    
    private FormFile fileChapter;

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

    public String getDropSubjectNameInProject() {
        return dropSubjectNameInProject;
    }

    public void setDropSubjectNameInProject(String dropSubjectNameInProject) {
        this.dropSubjectNameInProject = dropSubjectNameInProject;
    }

    public String getDropSubjectNameInReadingAndPicture() {
        return dropSubjectNameInReadingAndPicture;
    }

    public void setDropSubjectNameInReadingAndPicture(String dropSubjectNameInReadingAndPicture) {
        this.dropSubjectNameInReadingAndPicture = dropSubjectNameInReadingAndPicture;
    }

    public String getDropSubjectNameInResourceChapter() {
        return dropSubjectNameInResourceChapter;
    }

    public void setDropSubjectNameInResourceChapter(String dropSubjectNameInResourceChapter) {
        this.dropSubjectNameInResourceChapter = dropSubjectNameInResourceChapter;
    }

    public String getFckChapterSummary() {
        return fckChapterSummary;
    }

    public void setFckChapterSummary(String fckChapterSummary) {
        this.fckChapterSummary = fckChapterSummary;
    }

    public String getFckChapterSummaryUS() {
        return fckChapterSummaryUS;
    }

    public void setFckChapterSummaryUS(String fckChapterSummaryUS) {
        this.fckChapterSummaryUS = fckChapterSummaryUS;
    }

    public FormFile getFileChapter() {
        return fileChapter;
    }

    public void setFileChapter(FormFile fileChapter) {
        this.fileChapter = fileChapter;
    }

    public String getTxtAuthorProject() {
        return txtAuthorProject;
    }

    public void setTxtAuthorProject(String txtAuthorProject) {
        this.txtAuthorProject = txtAuthorProject;
    }

    public String getTxtChapterUSName() {
        return txtChapterUSName;
    }

    public void setTxtChapterUSName(String txtChapterUSName) {
        this.txtChapterUSName = txtChapterUSName;
    }

    public String getTxtNote() {
        return txtNote;
    }

    public void setTxtNote(String txtNote) {
        this.txtNote = txtNote;
    }

    public int getTxtOderChapter() {
        return txtOderChapter;
    }

    public void setTxtOderChapter(int txtOderChapter) {
        this.txtOderChapter = txtOderChapter;
    }

    public String getTxtProjectUSName() {
        return txtProjectUSName;
    }

    public void setTxtProjectUSName(String txtProjectUSName) {
        this.txtProjectUSName = txtProjectUSName;
    }

    public String getTxtResourceName() {
        return txtResourceName;
    }

    public void setTxtResourceName(String txtResourceName) {
        this.txtResourceName = txtResourceName;
    }

    public String getTxtorderchapter() {
        return txtorderchapter;
    }

    public void setTxtorderchapter(String txtorderchapter) {
        this.txtorderchapter = txtorderchapter;
    }
    
    /**
     *
     */
    public CrateResourceActionForm() {
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
