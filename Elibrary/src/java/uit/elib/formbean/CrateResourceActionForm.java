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
