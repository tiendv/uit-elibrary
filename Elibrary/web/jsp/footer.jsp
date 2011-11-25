<%-- 
    Document   : footer
    Created on : Nov 14, 2011, 2:03:04 PM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://struts.apache.org/tags-bean-el" prefix="bean" %>
<!DOCTYPE html>

<table width="100%" border="0" cellspacing="0" cellpadding="0">
    <tr>
    <td width="90" align="center"><img src="<bean:message key="image.uitlogo"/>" width="31" height="32" alt="<bean:message key="image.uitlogo.alttext"/>" longdesc="http://www.uit.edu.vn" /></td>
    <td>
        <bean:message key="txt.copright"/><br />
        <bean:message key="txt.uit"/> <br/>
        <bean:message key="txt.uit.address"/></td>
    </tr>
</table>