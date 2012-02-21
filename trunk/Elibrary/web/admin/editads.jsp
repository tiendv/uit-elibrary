<%-- 
    Document   : editads
    Created on : Feb 21, 2012, 1:03:16 AM
    Author     : HERO
--%>

<%@page import="java.util.List"%>
<%@page import="uit.elib.dto.Advertising"%>
<%@page import="org.apache.struts.Globals"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://struts.apache.org/tags-bean" prefix="bean" %>
<%@taglib uri="http://struts.apache.org/tags-html"  prefix="html"%>
<!DOCTYPE html>
<%
    int language =1; // English
    if(request.getSession().getAttribute(Globals.LOCALE_KEY).toString().equals("vn"))
        language = 2; // VietNamese
    List<Advertising> listAds = (List<Advertising>)request.getAttribute("listAds");
%>
<div style="margin-left: 5px">
    <h1><bean:message key="text.editads"/></h1>
    <%if(listAds.get(0).getImage()!=null)
    {
        String imageLink = "./upload/"+ listAds.get(0).getImage().toString();
    %>
    <img src="<%=imageLink%>" class="image" width="250px" height="70px"/>
    <%}%>
    <html:form method="post" action="EditAds" enctype="multipart/form-data" onsubmit="return validateAdsForm(this)">
        <table>
            <tr>
                <td><bean:message key="text.adsnameen"/></td>
                <td><html:text property="txtAdsNameEN" styleClass="textbox" maxlength="100" value="<%=listAds.get(0).getAdvertisingNameEn()%>"/></td>
            </tr>
            <tr>
                <td><bean:message key="text.adsnamevn"/></td>
                <td><html:text property="txtAdsNameVN" styleClass="textbox" maxlength="100" value="<%=listAds.get(0).getAdvertisingNameVn()%>"/></td>
            </tr>
            <tr>
                <td><bean:message key="text.adslink"/></td>
                <td><html:text property="txtAdsLink" styleClass="textbox" maxlength="100" value="<%=listAds.get(0).getLink()%>"/></td>
            </tr>
            <tr>
                <td><bean:message key="text.imagegallery"/></td>
                <td><html:file property="fileImage" size="27"/></td>
            </tr>
        </table>
                <input type="hidden" name="txtAdsID" value="<%=listAds.get(0).getAdvertisingId()%>"/>
    <html:submit property="btnSubmit"><bean:message key="text.buttonedit"/></html:submit><noscript><bean:message key="text.noscript"/></noscript>
    <html:javascript formName="AdsForm"/>
    </html:form>
</div>