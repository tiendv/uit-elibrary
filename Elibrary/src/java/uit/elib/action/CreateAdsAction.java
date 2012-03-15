/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package uit.elib.action;

import java.io.File;
import java.io.FileOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;
import org.apache.struts.upload.FormFile;
import uit.elib.formbean.AdsForm;
import uit.elib.dto.Advertising;
import uit.elib.bo.AdvertisingBO;
import uit.elib.utility.CheckGroup;
/**
 *
 * @author HERO
 */
public class CreateAdsAction extends org.apache.struts.action.Action {

    /*
     * forward name="success" path=""
     */
    private static final String SUCCESS = "success";
    private static final String UNSUCCESS = "unsuccess";
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
        int checkgroup =2; //visitor 
        HttpSession session = request.getSession();
        if(session.getAttribute("username")!=null){ 
            CheckGroup checkGroup = new CheckGroup();
            checkgroup = checkGroup.Group((String)session.getAttribute("username"));
            if(checkgroup==-1) // account has just been locked while users are accessing or  account has just expired while users are accessing
            {   
                 session.removeAttribute("username");
                 session.removeAttribute("group");
            }
            if(checkgroup==1)
            {        
                AdsForm adsForm = (AdsForm)form;
                Advertising advertising = new Advertising();
                FormFile fileImage = adsForm.getFileImage();
                if(!fileImage.getFileName().isEmpty())
                {
                    File dirFile;   // manage dir
                    File file;     // manage name
                    FileOutputStream fileOutputStream; // save to server
                    dirFile = new File(request.getServletContext().getRealPath("/")+"upload/");
                    String []suffixFile = fileImage.getFileName().split("\\.");            
                    file = File.createTempFile("Image_","."+suffixFile[suffixFile.length-1],dirFile);
                    fileOutputStream = new FileOutputStream(request.getServletContext().getRealPath("/")+"upload/"+file.getName());
                    advertising.setImage(file.getName());
                    fileOutputStream.write(fileImage.getFileData());
                    fileOutputStream.close();            
                }
                advertising.setAdvertisingNameEn(adsForm.getTxtAdsNameEN());
                advertising.setAdvertisingNameVn(adsForm.getTxtAdsNameVN());
                advertising.setLink(adsForm.getTxtAdsLink());
                AdvertisingBO.getAdvertisingBO().addNew(advertising);
                Boolean success =true;
                request.setAttribute("success",success);     
                String href="./LoadListOfAds.do";
                request.setAttribute("href",href);        
                return mapping.findForward(SUCCESS);
            }
        }
        return mapping.findForward(UNSUCCESS);
    }
}
