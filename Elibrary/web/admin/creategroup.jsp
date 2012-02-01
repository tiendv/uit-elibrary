<%-- 
    Document   : creategroup
    Created on : Feb 1, 2012, 1:16:14 AM
    Author     : HERO
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://struts.apache.org/tags-bean" prefix="bean" %>
<%@taglib uri="http://struts.apache.org/tags-html"  prefix="html"%>
<!DOCTYPE html>
<h1><bean:message key="text.creategroup"/></h1>
<html:form  method="post" action="CreateGroup" onsubmit="return validateGroupForm(this)">
<table >
    <tr>
        <td>
            <bean:message key="text.groupnamevn"/>
        </td>
        <td>
            <html:text styleClass="textbox" property="txtGroupNameVN"/>
        </td>
    </tr>
    <tr>
        <td>
            <bean:message key="text.groupnameen"/>
        </td>
        <td>
            <html:text styleClass="textbox" property="txtGroupNameEN"/>
        </td>
    </tr>
</table>
<html:submit property="btnSubmit"><bean:message key="text.buttoncreate"/></html:submit><noscript><bean:message key="text.noscript"/></noscript>
<html:javascript formName="GroupForm"/>
</html:form>