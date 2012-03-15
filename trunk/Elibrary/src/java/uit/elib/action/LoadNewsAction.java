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
import uit.elib.utility.IsNumber;

/**
 *
 * @author Nguyen Hoang Tan
 */
public class LoadNewsAction extends org.apache.struts.action.Action {

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
        if(request.getParameter("newsID")!=null)
        {
            IsNumber isNumber = new IsNumber();
            if(isNumber.checkInt(request.getParameter("newsID")))
            {
                int newsID = Integer.parseInt(request.getParameter("newsID"));
                NewsBO newsBO = NewsBO.getNewsBO();
                List<News> listNews = newsBO.getAllNews("newsId="+newsID, null);
                if(listNews.size()>0)
                {
                    request.setAttribute("listNews", listNews);
                    String []order = new String[1];
                    order[0]="postDate desc";                    
                    String where ="newsID!="+listNews.get(0).getNewsId();
                    List<News> listNewNews = newsBO.getAllNews(where,order,5);
                    request.setAttribute("listNewNews", listNewNews);                    
                    return mapping.findForward(SUCCESS);
                }
            }
        }        
        return mapping.findForward(UNSUCCESS);
    }
}
