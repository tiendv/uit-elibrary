package uit.elib.action;
import java.util.Locale;

//
//    Document   : Language selection Action
//    Created on : Nov 14, 2011, 8:19:03 AM
//    Author     : tiendv
//

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts.Globals;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;
import org.apache.struts.actions.DispatchAction;

public class languageSelectAction extends DispatchAction {

    private ActionForward myAction;
    private static final String LOCATE_ACTION_PATTERN = "(/Locale.do).*";
    private static final String DEFAUFT_RETURN = "/Welcome.do";

    public ActionForward vietnamese(ActionMapping mapping, ActionForm form,
            HttpServletRequest request, HttpServletResponse response)
            throws Exception {
        String webHttp = request.getRequestURL().toString();
        System.out.print("URL :"+webHttp);
        webHttp = webHttp.substring(0,webHttp.lastIndexOf("/"));
        String url = request.getParameter("page");
        System.out.print("URL :"+url);
        url = formatToPath(url,webHttp,request);
        System.out.print("URL FORMAT:"+url);
        request.getSession().setAttribute(
                Globals.LOCALE_KEY, new Locale("vi","VN"));
        if (!url.isEmpty()) {
            myAction = new ActionForward(url, true);
        }
        request.getSession().setAttribute("PreAction", url);
        return myAction;
    }

    public ActionForward english(ActionMapping mapping, ActionForm form,
            HttpServletRequest request, HttpServletResponse response)
            throws Exception {
        System.out.print("ENGLISH");
        String webHttp = request.getRequestURL().toString();
        System.out.print("URL :"+webHttp);
        webHttp = webHttp.substring(0,webHttp.lastIndexOf("/"));
        String url = request.getParameter("page");
        System.out.print("URL :"+url);
        url = formatToPath(url,webHttp,request);
        System.out.print("URL FORMAT:"+url);
        request.getSession().setAttribute(
                Globals.LOCALE_KEY, Locale.ENGLISH);
        if (!url.isEmpty()) {
            myAction = new ActionForward(url,true);
        }
        request.getSession().setAttribute("PreAction", url);
        return myAction;
    }

    public static String formatToPath(String url,String webHttp,HttpServletRequest request) {
        String result = "";
        result = url.replace(webHttp, "");
        if ("/".equals(result.trim()) || "".equals(result.trim())) {
            result = DEFAUFT_RETURN;
        }
        if (result.matches(LOCATE_ACTION_PATTERN)) {
            result = (String) request.getSession().getAttribute("PreAction");
            if(result == null){
                result = DEFAUFT_RETURN;
            }
        }
        return result;
    }
}
