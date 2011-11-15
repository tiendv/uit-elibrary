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
    private static String preAction = "/Welcome.do";

    public ActionForward vietnamese(ActionMapping mapping, ActionForm form,
            HttpServletRequest request, HttpServletResponse response)
            throws Exception {
        String webHttp = request.getRequestURL().toString();
        webHttp = webHttp.substring(0,webHttp.lastIndexOf("/"));
        String url = request.getParameter("page");
        url = formatToPath(url,webHttp);
        request.getSession().setAttribute(
                Globals.LOCALE_KEY, new Locale("vn"));
        if (!url.isEmpty()) {
            myAction = new ActionForward(url);
        }
        preAction = url;
        return myAction;
    }

    public ActionForward english(ActionMapping mapping, ActionForm form,
            HttpServletRequest request, HttpServletResponse response)
            throws Exception {
        String webHttp = request.getRequestURL().toString();
        webHttp = webHttp.substring(0,webHttp.lastIndexOf("/"));
        String url = request.getParameter("page");
        url = formatToPath(url,webHttp);
        request.getSession().setAttribute(
                Globals.LOCALE_KEY, Locale.ENGLISH);
        if (!url.isEmpty()) {
            myAction = new ActionForward(url);
        }
        preAction = url;
        return myAction;
    }

    public static String formatToPath(String url,String webHttp) {
        String result = "";
        result = url.replace(webHttp, "");
        if ("/".equals(result.trim()) || "".equals(result.trim())) {
            result = DEFAUFT_RETURN;
        }
        if (result.matches(LOCATE_ACTION_PATTERN)) {
            result = preAction;
        }
        return result;
    }
}
