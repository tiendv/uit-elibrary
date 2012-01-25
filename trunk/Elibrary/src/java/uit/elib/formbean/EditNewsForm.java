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
public class EditNewsForm extends org.apache.struts.action.ActionForm {
    
    int txtID;
    String txtTitleEN;
    String txtTitleVN;
    String image;
    FormFile fileImage;
    String txtHeadlineEN;
    String txtHeadlineVN;    
    String fckContentEN;
    String fckContentVN;

    public int getTxtID() {
        return txtID;
    }

    public void setTxtID(int txtID) {
        this.txtID = txtID;
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

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
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
