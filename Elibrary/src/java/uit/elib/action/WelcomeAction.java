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
public class WelcomeAction extends org.apache.struts.action.Action {

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
        int maxResult =5;
        String [] order = new String[1];
        order[0] = "postDate desc";
        String where = "newsCategory=1";
        List<News> listNewsCate1 = NewsBO.getNewsBO().getAllNews(where, order,maxResult);
        request.setAttribute("listNewsCate1", listNewsCate1);
        where = "newsCategory=2";
        List<News> listNewsCate2 = NewsBO.getNewsBO().getAllNews(where, order,1);
        request.setAttribute("listNewsCate2", listNewsCate2);
        return mapping.findForward(SUCCESS);
    }
}
