<%-- 
    Document   : createads
    Created on : Feb 20, 2012, 9:39:20 PM
    Author     : HERO
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://struts.apache.org/tags-bean" prefix="bean" %>
<%@taglib uri="http://struts.apache.org/tags-html"  prefix="html"%>
<!DOCTYPE html>
<div style="margin-left: 5px">
    <h1><bean:message key="text.createads"/></h1>
    <html:form method="post" action="CreateAds" enctype="multipart/form-data" onsubmit="return validateAdsForm(this)">
        <table>
            <tr>
                <td><bean:message key="text.adsnameen"/></td>
                <td><html:text property="txtAdsNameEN" styleClass="textbox" maxlength="100" value=""/></td>
            </tr>
            <tr>
                <td><bean:message key="text.adsnamevn"/></td>
                <td><html:text property="txtAdsNameVN" styleClass="textbox" maxlength="100" value=""/></td>
            </tr>
            <tr>
                <td><bean:message key="text.adslink"/></td>
                <td><html:text property="txtAdsLink" styleClass="textbox" maxlength="100" value=""/></td>
            </tr>
            <tr>
                <td><bean:message key="text.imagegallery"/></td>
                <td><html:file property="fileImage" size="27"/></td>
            </tr>
        </table>
    <html:submit property="btnSubmit"><bean:message key="text.buttoncreate"/></html:submit><noscript><bean:message key="text.noscript"/></noscript>
    <html:javascript formName="AdsForm"/>
    </html:form>
</div>