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
import uit.elib.formbean.EditNewsForm;
import uit.elib.utility.IsNumber;

/**
 *
 * @author Nguyen Hoang Tan
 */
public class LoadEditNewsAction extends org.apache.struts.action.Action {

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
                    EditNewsForm editNewsForm = (EditNewsForm)form;
                    editNewsForm.setTxtTitleEN(listNews.get(0).getNewsTitleEn());
                    editNewsForm.setTxtTitleVN(listNews.get(0).getNewsTitleVn());
                    editNewsForm.setTxtHeadlineEN(listNews.get(0).getNewsHeadlineEn());
                    editNewsForm.setTxtHeadlineVN(listNews.get(0).getNewsHeadlineVn());
                    editNewsForm.setFckContentEN(listNews.get(0).getNewsContentEn());
                    editNewsForm.setFckContentVN(listNews.get(0).getNewsContentVn());
                    request.setAttribute("listNews", listNews);                    
                    return mapping.findForward(SUCCESS);
                }
            }
        }          
        return mapping.findForward(UNSUCCESS);
    }
}
