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
            <input class="textbox" id="txtGroupNameVN" name="txtGroupNameVN" type="text"  maxlength="255"/>
        </td>
    </tr>
    <tr>
        <td>
            <bean:message key="text.groupnameen"/>
        </td>
        <td>
            <input class="textbox" id="txtGroupNameEN" name="txtGroupNameEN" type="text"  maxlength="255"/>
        </td>
    </tr>
</table>
<html:submit property="btnSubmit"><bean:message key="text.buttoncreate"/></html:submit><noscript><bean:message key="text.noscript"/></noscript>
<html:javascript formName="GroupForm"/>
</html:form>
<script type="text/javascript">
    void init()
    {
        document.getElementsById("txtGroupNameVN").value = "";
        document.getElementsById("txtGroupNameEN").value = "";
        
    }
</script>