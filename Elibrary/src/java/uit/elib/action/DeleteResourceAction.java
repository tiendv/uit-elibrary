/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package uit.elib.action;
import java.io.File;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;
import uit.elib.bo.ResourceBO;
import java.util.List;
import javax.servlet.http.HttpSession;
import uit.elib.dto.Resource;
import uit.elib.utility.CheckGroup;

/**
 *
 * @author Nguyen Hoang Tan
 */
public class DeleteResourceAction extends org.apache.struts.action.Action {

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
            if(checkgroup==1||checkgroup==3)// admin or mod
            {         
                String resourcesID = request.getParameter("resourcesID");
                resourcesID=resourcesID.substring(0,resourcesID.length()-1);
                ResourceBO resourceBO = ResourceBO.getResourceBO();
                List<Resource> listResource = resourceBO.getAllResource("ResourceID in("+resourcesID+")", null);     
                for(int i=0;i<listResource.size();i++)
                {    
                    // delete old file
                    if(listResource.get(i).getServerName()!=null)
                    {
                        File oldFile =  new File(request.getServletContext().getRealPath("/")+"upload/"+listResource.get(i).getServerName());
                        oldFile.delete();
                    }                
                    resourceBO.DeleteResource("delete from resource where resourceID ="+listResource.get(i).getResourceId()) ;
                }
            }
        }
        return null;
    }
}
