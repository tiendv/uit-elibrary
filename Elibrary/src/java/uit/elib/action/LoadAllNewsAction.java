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
import uit.elib.bo.NewsBO;
import uit.elib.dto.News;

/**
 *
 * @author Nguyen Hoang Tan
 */
public class LoadAllNewsAction extends org.apache.struts.action.Action {

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
        NewsBO newsBO = NewsBO.getNewsBO();
        String []order = new String[1];
        order[0]="postDate desc";
        List<News> listBook = newsBO.getAllNews("NewsCategory=1",order);
        List<News> listAnnoun = newsBO.getAllNews("NewsCategory=2",order);
        request.setAttribute("listBook", listBook);
        request.setAttribute("listAnnoun", listAnnoun);     
        return mapping.findForward(SUCCESS);
    }
}
