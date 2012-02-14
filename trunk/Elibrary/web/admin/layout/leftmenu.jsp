<%--
    Document   : leftmenu
    Created on : Nov 16, 2011, 9:26:30 AM
    Author     : tiendv
--%>
<%
if(session.getAttribute("username")!=null)
{    
    if((Integer)session.getAttribute("group") ==1)//admin
    {
%>
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
        <td class="leftmenu_td_link"><a href="LoadListOfGroupDetail.do"><bean:message key="text.decentralization"/></a></td>
    </tr>        
</table>
<div id="onlinecounter" class="onlinecounter" >
<script id="_wau7c9">var _wau = _wau || []; _wau.push(["small", "pu6efdvzs5le", "7c9"]);(function() { var s=document.createElement("script"); s.async=true; s.src="http://widgets.amung.us/small.js";document.getElementsByTagName("head")[0].appendChild(s);})();</script>
</div>        
<%}}%>    