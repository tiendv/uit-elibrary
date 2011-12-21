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
 * @author Hoang
 */
public class LoadChapterAction extends org.apache.struts.action.Action {
    
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

        String id = request.getParameter("id");
        int subjectID = Integer.parseInt(id);
        ResourceBO resourceBO = ResourceBO.getResourceBO();
        List<Resource> chapters = resourceBO.getAllResourceOfSubjectAndResourceCategory(subjectID,7);
        response.setCharacterEncoding("UTF-8");
        response.getWriter().println("<select id=\"dropOrderChapterSubject\" name=\"dropOrderChapterSubject\">");        
        for (int i = 0; i < chapters.size(); i++) {
            Resource resource = chapters.get(i);
            response.getWriter().println("<option value = "+ resource.getOrderChapter() +" >");
            response.getWriter().println(resource.getOrderChapter());
            response.getWriter().println("</option>");
        }
        response.getWriter().println("</select>");        
        return null;
    }
}
