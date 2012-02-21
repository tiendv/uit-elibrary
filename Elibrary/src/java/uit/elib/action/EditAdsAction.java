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
import uit.elib.bo.AdvertisingBO;
import uit.elib.formbean.AdsForm;
import uit.elib.dto.Advertising;
/**
 *
 * @author HERO
 */
public class EditAdsAction extends org.apache.struts.action.Action {

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
        AdsForm adsForm = (AdsForm)form;
        Advertising ads = new Advertising();
        FormFile fileImage = adsForm.getFileImage();
        List<Advertising> listAds = AdvertisingBO.getAdvertisingBO().getAllAds("AdvertisingID="+adsForm.getTxtAdsID(), null);
        ads = listAds.get(0); 
        ads.setAdvertisingId(adsForm.getTxtAdsID());
        ads.setAdvertisingNameEn(adsForm.getTxtAdsNameEN());
        ads.setAdvertisingNameVn(adsForm.getTxtAdsNameVN());
        ads.setLink(adsForm.getTxtAdsLink());
        if(!fileImage.getFileName().isEmpty())
                {
                    // delete old file
                    if(ads.getImage()!=null)
                    {
                        File oldFile =  new File(request.getServletContext().getRealPath("/")+"upload/"+ads.getImage());
                        oldFile.delete();
                    }             
                    File dirFile;   // manage dir
                    File file;     // manage name
                    FileOutputStream fileOutputStream; // save to server
                    dirFile = new File(request.getServletContext().getRealPath("/")+"upload/");
                    String []suffixFile = fileImage.getFileName().split("\\.");            
                    file = File.createTempFile("Image_","."+suffixFile[suffixFile.length-1],dirFile);
                    fileOutputStream = new FileOutputStream(request.getServletContext().getRealPath("/")+"upload/"+file.getName());
                    ads.setImage(file.getName());
                    fileOutputStream.write(fileImage.getFileData());
                    fileOutputStream.close();            
                }
        AdvertisingBO.getAdvertisingBO().updateAds(ads);
        Boolean success =true;
        request.setAttribute("success",success);     
        String href="./LoadListOfAds.do";
        request.setAttribute("href",href);        
        return mapping.findForward(SUCCESS);
    }
}
