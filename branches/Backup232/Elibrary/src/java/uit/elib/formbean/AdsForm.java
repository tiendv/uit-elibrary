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
 * @author HERO
 */
public class AdsForm extends org.apache.struts.action.ActionForm {
    
    private  int txtAdsID;
    private String txtAdsNameEN;
    private String txtAdsNameVN;
    private FormFile fileImage;
    private String txtAdsLink;

    public String getTxtAdsLink() {
        return txtAdsLink;
    }

    public void setTxtAdsLink(String txtAdsLink) {
        this.txtAdsLink = txtAdsLink;
    }

    public FormFile getFileImage() {
        return fileImage;
    }

    public void setFileImage(FormFile fileImage) {
        this.fileImage = fileImage;
    }

    public int getTxtAdsID() {
        return txtAdsID;
    }

    public void setTxtAdsID(int txtAdsID) {
        this.txtAdsID = txtAdsID;
    }

    public String getTxtAdsNameEN() {
        return txtAdsNameEN;
    }

    public void setTxtAdsNameEN(String txtAdsNameEN) {
        this.txtAdsNameEN = txtAdsNameEN;
    }

    public String getTxtAdsNameVN() {
        return txtAdsNameVN;
    }

    public void setTxtAdsNameVN(String txtAdsNameVN) {
        this.txtAdsNameVN = txtAdsNameVN;
    }
    /**
     *
     */
    public AdsForm() {
        super();
        // TODO Auto-generated constructor stub
    }

    /**
     * This is the action called from the Struts framework.
     *
     * @param mapping The ActionMapping used to select this instance.
     * @param request The HTTP Request we are processing.
     * @return
//     */
//    public ActionErrors validate(ActionMapping mapping, HttpServletRequest request) {
//        ActionErrors errors = new ActionErrors();
//        if (getName() == null || getName().length() < 1) {
//            errors.add("name", new ActionMessage("error.name.required"));
//            // TODO: add 'error.name.required' key to your resources
//        }
//        return errors;
//    }
}
