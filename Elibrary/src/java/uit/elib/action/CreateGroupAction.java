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
import uit.elib.formbean.GroupForm;
import uit.elib.dto.Group;
import uit.elib.bo.GroupBO;
/**
 *
 * @author HERO
 */
public class CreateGroupAction extends org.apache.struts.action.Action {

    /*
     * forward name="success" path=""
     */
    private static final String SUCCESS = "success";

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
        GroupForm groupFormBean =(GroupForm)form;
        Group temp = new Group();
        temp.setGroupNameEn(groupFormBean.getTxtGroupNameEN());
        temp.setGroupNameVn(groupFormBean.getTxtGroupNameVN());
        GroupBO.getGroupBO().addNew(temp);
        Boolean success =true;
        request.setAttribute("success",success);     
        String href="./LoadListOfGroup.do";
        request.setAttribute("href",href);
        return mapping.findForward(SUCCESS);
        
    }
}
