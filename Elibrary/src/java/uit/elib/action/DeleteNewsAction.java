/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package uit.elib.action;

import java.io.File;
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
public class DeleteNewsAction extends org.apache.struts.action.Action {

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
        String newsID = request.getParameter("newsID");
        newsID=newsID.substring(0,newsID.length()-1);
        List<News> listNews = NewsBO.getNewsBO().getAllNews("NewsID in("+newsID+")",null );
        for(int i=0;i<listNews.size();i++)
        {    
            // delete old image
            if(listNews.get(i).getNewsImage()!=null)
            {
                File oldFile =  new File(request.getServletContext().getRealPath("/")+"upload/"+listNews.get(i).getNewsImage());
                oldFile.delete();
            }                
            NewsBO.getNewsBO().DeleteNews("delete from news where newsID ="+listNews.get(i).getNewsId()) ;
        }        
        return null;
    }
}
