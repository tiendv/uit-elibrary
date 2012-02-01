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
 * @author HERO
 */
public class GroupForm extends org.apache.struts.action.ActionForm {
    private String txtGroupNameEN;
    private String txtGroupNameVN;

    public String getTxtGroupNameEN() {
        return txtGroupNameEN;
    }

    public void setTxtGroupNameEN(String txtGroupNameEN) {
        this.txtGroupNameEN = txtGroupNameEN;
    }

    public String getTxtGroupNameVN() {
        return txtGroupNameVN;
    }

    public void setTxtGroupNameVN(String txtGroupNameVN) {
        this.txtGroupNameVN = txtGroupNameVN;
    }
    
    public GroupForm() {
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
