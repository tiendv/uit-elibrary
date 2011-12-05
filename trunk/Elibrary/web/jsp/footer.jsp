<%-- 
    Document   : footer
    Created on : Nov 14, 2011, 2:03:04 PM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://struts.apache.org/tags-bean" prefix="bean" %>
<link rel="stylesheet" type="text/css" href="css/uit.css" />
<!DOCTYPE html>

<table class="footer" >
    <tr>
    <td  width="31px" align="right"><img src="<bean:message key="image.uitlogo"/>" width="31" height="32" alt="<bean:message key="image.uitlogo.alttext"/>" longdesc="http://www.uit.edu.vn" /></td>
    <td class="sub_footer">
        <bean:message key="txt.copright"/><br />
        <bean:message key="txt.uit"/> <br/>
        <bean:message key="txt.uit.address"/>
    </td>
    <td width="25%" ></td>
    </tr>
</table>