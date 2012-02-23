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
public class CreateNewsForm extends org.apache.struts.action.ActionForm {
    String txtTitleEN;
    String txtTitleVN;
    FormFile fileImage;
    String txtHeadlineEN;
    String txtHeadlineVN;    
    String fckContentEN;
    String fckContentVN;
    int dropNewsCategory;

    public int getDropNewsCategory() {
        return dropNewsCategory;
    }

    public void setDropNewsCategory(int dropNewsCategory) {
        this.dropNewsCategory = dropNewsCategory;
    }
    
    public String getFckContentEN() {
        return fckContentEN;
    }

    public void setFckContentEN(String fckContentEN) {
        this.fckContentEN = fckContentEN;
    }

    public String getFckContentVN() {
        return fckContentVN;
    }

    public void setFckContentVN(String fckContentVN) {
        this.fckContentVN = fckContentVN;
    }

    public FormFile getFileImage() {
        return fileImage;
    }

    public void setFileImage(FormFile fileImage) {
        this.fileImage = fileImage;
    }

    public String getTxtHeadlineEN() {
        return txtHeadlineEN;
    }

    public void setTxtHeadlineEN(String txtHeadlineEN) {
        this.txtHeadlineEN = txtHeadlineEN;
    }

    public String getTxtHeadlineVN() {
        return txtHeadlineVN;
    }

    public void setTxtHeadlineVN(String txtHeadlineVN) {
        this.txtHeadlineVN = txtHeadlineVN;
    }

    public String getTxtTitleEN() {
        return txtTitleEN;
    }

    public void setTxtTitleEN(String txtTitleEN) {
        this.txtTitleEN = txtTitleEN;
    }

    public String getTxtTitleVN() {
        return txtTitleVN;
    }

    public void setTxtTitleVN(String txtTitleVN) {
        this.txtTitleVN = txtTitleVN;
    }
    
}
   