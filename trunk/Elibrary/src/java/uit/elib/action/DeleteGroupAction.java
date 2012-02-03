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
import uit.elib.bo.GroupBO;
import uit.elib.bo.GroupDetailBO;
import uit.elib.bo.UserBO;
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
                String groupsID = request.getParameter("groupsID");
                groupsID = groupsID.substring(0, groupsID.length()-1);
                String sqlGroupDetail ="delete from `groupdetail` where GroupID in("+groupsID +")";
                String sqlUser ="delete from `user` where GroupID in("+groupsID +")";
                String sqlgroup = "delete from `group` where GroupID in("+groupsID+")";
                UserBO.getUserBO().DeleteUser(sqlUser);
                GroupDetailBO.getGroupDetailBO().DeleteGroupDetail(sqlGroupDetail);
                GroupBO.getGroupBO().DeleteGroup(sqlgroup);
        return null;
    }
}
