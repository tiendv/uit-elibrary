<%--
    Document   : leftmenu
    Created on : Nov 16, 2011, 9:26:30 AM
    Author     : tiendv
--%>
<%@taglib uri="http://struts.apache.org/tags-bean" prefix="bean" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://struts.apache.org/tags-bean" prefix="bean" %>
<!DOCTYPE html>
<table width="100%" border="0" cellspacing="2" cellpadding="2">
        <tr>
            <td >&nbsp;</td>
        </tr>
        <tr>
            <td  class="leftmenu_td_title"><bean:message key="text.menu.adminpage"/></td>
 	</tr>
        <tr>
            <td class="leftmenu_td_link"><a href="#"></a></td>
        </tr>
        <tr>
            <td class="leftmenu_td_link"><a href="LoadCreateSubject.do"><bean:message key="text.leftmenu.createsubject"/></a></td>
        </tr>
        <tr>
            <td class="leftmenu_td_link"><a href="LoadCreateResource.do"><bean:message key="text.leftmenu.createresource"/></a></td>
        </tr>
        <tr>
            <td class="leftmenu_td_link"><a href="LoadResource.do"><bean:message key="text.leftmenu.viewresource"/></a></td>
        </tr>
</table>