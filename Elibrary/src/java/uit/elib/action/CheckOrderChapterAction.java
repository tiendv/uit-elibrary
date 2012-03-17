/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package uit.elib.action;

import java.util.List;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;
import uit.elib.bo.ResourceBO;
import uit.elib.dto.Resource;

/**
 *
 * @author Nguyen Hoang Tan
 */
public class CheckOrderChapterAction extends org.apache.struts.action.Action {

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
        if(request.getParameter("subjectID")!=null&&request.getParameter("orderChapter")!=null)
        {   
            int subjectID = Integer.parseInt(request.getParameter("subjectID"));
            int orderChapter = Integer.parseInt(request.getParameter("orderChapter"));
            String query = "SubjectId="+subjectID + " and OrderChapter="+orderChapter;
            List<Resource> listResource= ResourceBO.getResourceBO().getAllResource(query, null);
            if(listResource.size()>0)
                response.getWriter().println("1");
        }
        return null;
    }
}
