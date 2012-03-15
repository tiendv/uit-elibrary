<%--
    Document   : leftmenu
    Created on : Nov 16, 2011, 9:26:30 AM
    Author     : Nguyen Hoang Tan
--%>
<%
if(session.getAttribute("username")!=null)
{    
    if((Integer)session.getAttribute("group") ==1 || (Integer)session.getAttribute("group") ==3)//admin or mod
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
        <td  class="leftmenu_td_title"><bean:message key="text.modpage"/></td>
    </tr>
    <tr>
        <td class="leftmenu_td_link"><a href="LoadCreateSubject.do"><bean:message key="text.createsubject"/></a></td>
    </tr>
    <tr>
        <td class="leftmenu_td_link"><a href="LoadListOfSubject.do"><bean:message key="text.listofsubject"/></a></td>
    </tr>        
    <tr>
        <td class="leftmenu_td_link"><a href="LoadCreateResource.do"><bean:message key="text.createresource"/></a></td>
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
<div id="onlinecounter" class="onlinecounter" >
<script id="_wau7c9">var _wau = _wau || []; _wau.push(["small", "pu6efdvzs5le", "7c9"]);(function() { var s=document.createElement("script"); s.async=true; s.src="http://widgets.amung.us/small.js";document.getElementsByTagName("head")[0].appendChild(s);})();</script>
</div>        
<%}}%>     