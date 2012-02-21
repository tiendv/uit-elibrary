/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package uit.elib.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;
import uit.elib.bo.AdvertisingBO;

/**
 *
 * @author HERO
 */
public class DeleteAdsAction extends org.apache.struts.action.Action {

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
        String listAdsID = request.getParameter("listAdsID"); // danh sách ID (kể cả dấu ,)
        listAdsID = listAdsID.substring(0, listAdsID.length()-1);
        String sqlAds ="delete from `advertising` where AdvertisingID in("+listAdsID+")";
        AdvertisingBO.getAdvertisingBO().DeleteAds(sqlAds);
        return mapping.findForward(SUCCESS);
    }
}
