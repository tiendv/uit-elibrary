/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package uit.elib.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;
import uit.elib.bo.IPBO;
import uit.elib.dto.Ip;
import uit.elib.formbean.CreateIPForm;

/**
 *
 * @author Nguyen Hoang Tan
 */
public class CreateIPAction extends org.apache.struts.action.Action {

    /* forward name="success" path="" */
    private static final String SUCCESS = "success";

    /**
     * This is the action called from the Struts framework.
     * @param mapping The ActionMapping used to select this instance.
     * @param form The optional ActionForm bean for this request.
     * @param request The HTTP Request we are processing.
     * @param response The HTTP Response we are processing.
     * @throws java.lang.Exception
     * @return
     */
    @Override
    public ActionForward execute(ActionMapping mapping, ActionForm form,
            HttpServletRequest request, HttpServletResponse response)
            throws Exception {
        CreateIPForm createIPForm = (CreateIPForm)form;
        IPBO ipbo = IPBO.getIPBO();
        Ip ip = new Ip();
        if(createIPForm.getDropStatus()==0)
        {
            ip.setIpvalue(createIPForm.getTxtSourceIP());
        }
        return mapping.findForward(SUCCESS);
    }
}
