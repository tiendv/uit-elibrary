<%-- 
    Document   : editgroup
    Created on : Feb 2, 2012, 10:59:02 PM
    Author     : HERO
--%>

<%@page import="java.util.List"%>
<%@page import="uit.elib.dto.Group" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://struts.apache.org/tags-bean" prefix="bean" %>
<%@taglib uri="http://struts.apache.org/tags-html"  prefix="html"%>
<!DOCTYPE html>
<%
    List<Group> listGroup = (List<Group>) request.getAttribute("listGroup");
%>
<h1><bean:message key="text.editgroup"/></h1>
<html:form  method="post" action="EditGroup" onsubmit="return validateGroupForm(this)">
<input type="hidden" name="txtGroupID" value="<%=listGroup.get(0).getGroupId()%>" />
<table >
    <tr>
        <td>
            <bean:message key="text.groupnamevn"/>
        </td>
        <td>
            <input class="textbox" id="txtGroupNameVN" name="txtGroupNameVN" type="text" value="<%=listGroup.get(0).getGroupNameVn()%>" maxlength="255"/>
        </td>
    </tr>
    <tr>
        <td>
            <bean:message key="text.groupnameen"/>
        </td>
        <td>
            <input class="textbox" id="txtGroupNameEN" name="txtGroupNameEN" type="text" value="<%=listGroup.get(0).getGroupNameEn()%>" maxlength="255"/>
        </td>
    </tr>
</table>
<html:submit property="btnSubmit"><bean:message key="text.buttonedit"/></html:submit><noscript><bean:message key="text.noscript"/></noscript>
<html:javascript formName="GroupForm"/>
</html:form>