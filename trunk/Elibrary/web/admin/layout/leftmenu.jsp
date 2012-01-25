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
            <td  class="leftmenu_td_title"><bean:message key="text.adminpage"/></td>
 	</tr>
        <tr>
            <td class="leftmenu_td_link"><a href="#"></a></td>
        </tr>
        <tr>
            <td class="leftmenu_td_link"><a href="LoadCreateSubject.do"><bean:message key="text.createsubject"/></a></td>
        </tr>
        <tr>
            <td class="leftmenu_td_link"><a href="LoadCreateResource.do"><bean:message key="text.createresource"/></a></td>
        </tr>
        <tr>
            <td class="leftmenu_td_link"><a href="LoadListOfSubject.do"><bean:message key="text.listofsubject"/></a></td>
        </tr>
        <tr>     
            <td class="leftmenu_td_link"><a href="LoadListOfResource.do"><bean:message key="text.listofresource"/></a></td>
        </tr>
        <tr>     
            <td class="leftmenu_td_link"><a href="LoadCreateNews.do"><bean:message key="text.createnews"/></a></td>
        </tr>
        <tr>     
            <td class="leftmenu_td_link"><a href="LoadListOfNews.do"><bean:message key="text.listofnews"/></a></td>
        </tr>         
</table>