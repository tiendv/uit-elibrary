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
        <td class="leftmenu_td_link"><a href="LoadCreateUser.do"><bean:message key="text.createuser"/></a></td>
    </tr>
    <tr>     
        <td class="leftmenu_td_link"><a href="LoadListOfUser.do"><bean:message key="text.listofuser"/></a></td>
    </tr>
    <tr>     
        <td class="leftmenu_td_link"><a href="LoadCreateGroup.do"><bean:message key="text.creategroup"/></a></td>
    </tr> 
    <tr>     
        <td class="leftmenu_td_link"><a href="LoadListOfGroup.do"><bean:message key="text.listofgroup"/></a></td>
    </tr>        
    <tr>     
        <td class="leftmenu_td_link"><a href="LoadCreateIP.do"><bean:message key="text.createip"/></a></td>
    </tr>          
</table>