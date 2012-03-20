/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package uit.elib.formbean;
import org.apache.struts.upload.FormFile;

/**
 *
 * @author Nguyen Hoang Tan
 */
public class CreateResourceForm extends org.apache.struts.action.ActionForm {
    
    private String txtResourceNameVN;
    private String txtResourceNameEN;
    private int dropResourceCategory;
    private int txtOrderChapter;
    private int dropSubjectInChapter;
    private String fckChapterSummaryVN;
    private String fckChapterSummaryEN;
    private String txtProjectAuthor;
    private int dropSubjectInProject;
    private FormFile fileProject;
    private FormFile fileSyllabus;
    private int dropSubjectInReadingAndPicture;
    private FormFile filePictureReading;
    private int dropSubjectInResourceChapter;
    private int dropOrderChapterSubject;
    private FormFile fileResourceChapter;
    private int dropSubjectInSyllabus;
    private String txtThesisAuthor;
    private String txtTeacher;
    private String txtClass;
    private String txtSchool;
    private int txtYear;
    private int txtProjectYear;
    private String txtSchoolYear;
    private FormFile fileThesis;
    private int dropLevel;
    private int dropFaculty;
    private String fckThesisSummaryVN;
    private String fckThesisSummaryEN;

    public int getTxtProjectYear() {
        return txtProjectYear;
    }

    public void setTxtProjectYear(int txtProjectYear) {
        this.txtProjectYear = txtProjectYear;
    }

    public String getFckThesisSummaryEN() {
        return fckThesisSummaryEN;
    }

    public void setFckThesisSummaryEN(String fckThesisSummaryEN) {
        this.fckThesisSummaryEN = fckThesisSummaryEN;
    }

    public String getFckThesisSummaryVN() {
        return fckThesisSummaryVN;
    }

    public void setFckThesisSummaryVN(String fckThesisSummaryVN) {
        this.fckThesisSummaryVN = fckThesisSummaryVN;
    }
    
    public int getDropFaculty() {
        return dropFaculty;
    }

    public void setDropFaculty(int dropFaculty) {
        this.dropFaculty = dropFaculty;
    }

    public int getDropLevel() {
        return dropLevel;
    }

    public void setDropLevel(int dropLevel) {
        this.dropLevel = dropLevel;
    }
    
    public FormFile getFileThesis() {
        return fileThesis;
    }

    public void setFileThesis(FormFile fileThesis) {
        this.fileThesis = fileThesis;
    }

    public String getTxtClass() {
        return txtClass;
    }

    public void setTxtClass(String txtClass) {
        this.txtClass = txtClass;
    }

    public String getTxtSchool() {
        return txtSchool;
    }

    public void setTxtSchool(String txtSchool) {
        this.txtSchool = txtSchool;
    }

    public String getTxtSchoolYear() {
        return txtSchoolYear;
    }

    public void setTxtSchoolYear(String txtSchoolYear) {
        this.txtSchoolYear = txtSchoolYear;
    }

    public String getTxtTeacher() {
        return txtTeacher;
    }

    public void setTxtTeacher(String txtTeacher) {
        this.txtTeacher = txtTeacher;
    }

    public int getTxtYear() {
        return txtYear;
    }

    public void setTxtYear(int txtYear) {
        this.txtYear = txtYear;
    }
    
    public String getTxtProjectAuthor() {
        return txtProjectAuthor;
    }

    public void setTxtProjectAuthor(String txtProjectAuthor) {
        this.txtProjectAuthor = txtProjectAuthor;
    }

    public String getTxtThesisAuthor() {
        return txtThesisAuthor;
    }

    public void setTxtThesisAuthor(String txtThesisAuthor) {
        this.txtThesisAuthor = txtThesisAuthor;
    }

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

    public FormFile getFileSyllabus() {
        return fileSyllabus;
    }

    public void setFileSyllabus(FormFile fileResourceSysllabus) {
        this.fileSyllabus = fileResourceSysllabus;
    }

    public int getDropSubjectInSyllabus() {
        return dropSubjectInSyllabus;
    }

    public void setDropSubjectInSyllabus(int dropSubjectInSyllabus) {
        this.dropSubjectInSyllabus = dropSubjectInSyllabus;
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

    public int getTxtOrderChapter() {
        return txtOrderChapter;
    }

    public void setTxtOrderChapter(int txtOrderChapter) {
        this.txtOrderChapter = txtOrderChapter;
    }


}
