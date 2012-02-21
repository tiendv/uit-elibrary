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
    <img src="<%=imageLink%>" class="image"/>
    <%}%>
    <bean:message key="text.adsnameen"/>
    <html:text property="txtAdsNameEN" styleClass="textbox" maxlength="100" value="<%=listAds.get(0).getAdvertisingNameEn()%>"/>
    <bean:message key="text.adsnamevn"/>
    <html:text property="txtAdsNameVN" styleClass="textbox" maxlength="100" value="<%=listAds.get(0).getAdvertisingNameEn()%>"/>
    <bean:message key="text.adslink"/>
    <html:text property="txtAdsLink" styleClass="textbox" maxlength="100" value="<%=listAds.get(0).getLink()%>"/>
    <bean:message key="text.imagegallery"/>
</div>
