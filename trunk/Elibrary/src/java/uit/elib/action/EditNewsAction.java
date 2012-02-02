/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package uit.elib.action;

import java.io.File;
import java.io.FileOutputStream;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;
import org.apache.struts.upload.FormFile;
import uit.elib.bo.NewsBO;
import uit.elib.dto.News;
import uit.elib.formbean.EditNewsForm;

/**
 *
 * @author Nguyen Hoang Tan
 */
public class EditNewsAction extends org.apache.struts.action.Action {

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
        EditNewsForm editNewsForm = (EditNewsForm)form;
        FormFile fileImage = editNewsForm.getFileImage();
        News news = new News();
        List<News> listNews =NewsBO.getNewsBO().getAllNews("newsId="+editNewsForm.getTxtID(), null);
        news = listNews.get(0);
        news.setNewsTitleEn(editNewsForm.getTxtTitleEN());
        news.setNewsTitleVn(editNewsForm.getTxtTitleVN());
        if(!fileImage.getFileName().isEmpty())
        {
            // delete old file
            if(news.getNewsImage()!=null)
            {
                File oldFile =  new File(request.getServletContext().getRealPath("/")+"upload/"+news.getNewsImage());
                oldFile.delete();
            }             
            File dirFile;   // manage dir
            File file;     // manage name
            FileOutputStream fileOutputStream; // save to server
            dirFile = new File(request.getServletContext().getRealPath("/")+"upload/");
            String []suffixFile = fileImage.getFileName().split("\\.");            
            file = File.createTempFile("Image_","."+suffixFile[suffixFile.length-1],dirFile);
            fileOutputStream = new FileOutputStream(request.getServletContext().getRealPath("/")+"upload/"+file.getName());
            news.setNewsImage(file.getName());
            fileOutputStream.write(fileImage.getFileData());
            fileOutputStream.close();            
        }
        news.setNewsHeadlineEn(editNewsForm.getTxtHeadlineEN());
        news.setNewsHeadlineVn(editNewsForm.getTxtHeadlineVN());        
        news.setNewsContentEn(editNewsForm.getFckContentEN());
        news.setNewsContentVn(editNewsForm.getFckContentVN());        
        java.util.Date utilDate = new java.util.Date();
        java.sql.Date sqlDate = new java.sql.Date(utilDate.getTime());  
        news.setPostDate(sqlDate);
        NewsBO newsBO = NewsBO.getNewsBO();
        newsBO.updateNews(news);
        Boolean success =true;
        request.setAttribute("success",success);     
        String href="./LoadListOfNews.do";
        request.setAttribute("href",href);        
        return mapping.findForward(SUCCESS);        
    }
}
