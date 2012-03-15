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
import uit.elib.bo.GroupBO;
import uit.elib.bo.GroupDetailBO;
import uit.elib.bo.UserBO;
import uit.elib.utility.CheckGroup;
/**
 *
 * @author HERO
 */
public class DeleteGroupAction extends org.apache.struts.action.Action {

    /**
     * This is the action called from the Struts framework.
     *
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
                String groupsID = request.getParameter("groupsID");
                groupsID = groupsID.substring(0, groupsID.length()-1);
                String []singleGroupID = groupsID.split(",");
                for(int i=0;i<singleGroupID.length;i++)
                {
                    if(Integer.parseInt(singleGroupID[i])==1||Integer.parseInt(singleGroupID[i])==2||Integer.parseInt(singleGroupID[i])==3)// admin ,visitor, mod
                        return null;
                }
                String sqlGroupDetail ="delete from `groupdetail` where GroupID in("+groupsID +")";
                String sqlUser ="delete from `user` where GroupID in("+groupsID +")";
                String sqlgroup = "delete from `group` where GroupID in("+groupsID+")";
                UserBO.getUserBO().DeleteUser(sqlUser);
                GroupDetailBO.getGroupDetailBO().DeleteGroupDetail(sqlGroupDetail);
                GroupBO.getGroupBO().DeleteGroup(sqlgroup);
            }
        }
        return null;
    }
}
