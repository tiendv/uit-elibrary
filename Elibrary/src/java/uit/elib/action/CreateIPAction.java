/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package uit.elib.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;
import uit.elib.bo.IPBO;
import uit.elib.dto.Ip;
import uit.elib.formbean.CreateIPForm;
import uit.elib.utility.CheckGroup;

/**
 *
 * @author Nguyen Hoang Tan
 */
public class CreateIPAction extends org.apache.struts.action.Action {

    /* forward name="success" path="" */
    private static final String SUCCESS = "success";
    private static final String UNSUCCESS = "unsuccess";
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
        int checkgroup =2; //visitor 
        HttpSession session = request.getSession();
        if(session.getAttribute("username")!=null){ 
            CheckGroup checkGroup = new CheckGroup();
            checkgroup = checkGroup.Group((String)session.getAttribute("username"));
            if(checkgroup==-1) // account has just been locked while users are accessing or  account has just expired while users are accessing
            {   
                 session.removeAttribute("username");
                 session.removeAttribute("group");
            }
            if(checkgroup==1)
            {          
                CreateIPForm createIPForm = (CreateIPForm)form;
                IPBO ipbo = IPBO.GetIPBO();
                Ip ip = new Ip();
                if(createIPForm.getDropStatus()==0) // deny single ip
                {
                    ip.setIpvalue(createIPForm.getTxtSourceIP());
                    ip.setIpstatus(0);
                    ipbo.InsertIP(ip);
                }
                if(createIPForm.getDropStatus()==1) // deny ip range
                {
                    ip.setIpvalue(createIPForm.getTxtSourceIP());
                    ip.setIpstatus(1);
                    ipbo.InsertIP(ip);
                    ip.setIpvalue(createIPForm.getTxtDestinationIP());
                    ip.setIpstatus(2);
                    ipbo.InsertIP(ip);
                } 
                if(createIPForm.getDropStatus()==2) // allow single ip
                {
                    ip.setIpvalue(createIPForm.getTxtSourceIP());
                    ip.setIpstatus(3);
                    ipbo.InsertIP(ip);
                }
                if(createIPForm.getDropStatus()==3) // allow ip range
                {
                    ip.setIpvalue(createIPForm.getTxtSourceIP());
                    ip.setIpstatus(4);
                    ipbo.InsertIP(ip);
                    ip.setIpvalue(createIPForm.getTxtDestinationIP());
                    ip.setIpstatus(5);
                    ipbo.InsertIP(ip);
                }
                Boolean success =true;
                request.setAttribute("success",success);     
                String href="./LoadCreateIP.do";
                request.setAttribute("href",href);         
                return mapping.findForward(SUCCESS);
            }
        }
        return mapping.findForward(UNSUCCESS);
    }
}
