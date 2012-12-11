<%-- 
    Document   : menu
    Created on : Nov 14, 2011, 2:03:44 PM
    Author     : Admin
--%>

<%@page import="uit.elib.utility.CheckGroupDetail"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://struts.apache.org/tags-html" prefix="html" %>
<%@taglib uri="http://struts.apache.org/tags-bean" prefix="bean" %>
<link href="<html:rewrite page='/css/uit.css'/>" rel="stylesheet" type="text/css" />
<!DOCTYPE html>
<table class="menu">
    <tr>
        <td class="menu_td_link"><a class="menu_link" href="Welcome.do" ><bean:message  key="text.home"/></a></td>
        <td class="menu_td_link"><a class="menu_link" href="LoadSubject.do"><bean:message  key="text.subject"/></a></td>
         <%
            String username = null;
            if(session.getAttribute("username")!=null)
                username = (String)session.getAttribute("username"); 
            CheckGroupDetail checkGroupDetail = new CheckGroupDetail(); 
            if(checkGroupDetail.GroupDetail(username, 2, 1))
            {
        %>          
        <td class="menu_td_link"><a class="menu_link" href="LoadThesis.do"><bean:message key ="text.thesis"/></a></td>
        <%}%>       
        <td class="menu_td_link"><a class="menu_link" href="LoadAllNews.do"><bean:message key ="text.news"/></a></td>
        <%
        if(username!=null)
        {    
            if((Integer)session.getAttribute("group") ==1||(Integer)session.getAttribute("group") ==3)//admin or mod
            {
        %>          
        <td class="menu_td_link"><a class="menu_link" href="Mod.do"><bean:message key="text.modpage"/></a></td>
        <%}}%>  
        <%
        if(username!=null)
        {    
            if((Integer)session.getAttribute("group") ==1)//admin
            {
        %>        
            <td class="menu_td_link"><a class="menu_link" href="Admin.do"><bean:message key="text.adminpage"/></a></td>
        <%}}%>
        <%if(username==null)
        {%> 
            <td class="menu_td_link"><a class="menu_link" href="LoadLogin.do"><bean:message key="text.login"/></a></td>
        <%}%>
        <%if(username!=null)
        {%>  
            <td class="menu_td_link"><a class="menu_link" href="Logout.do"><bean:message key="text.logout"/></a></td>
        <%}%>     
        <td align="right"><script type="text/javascript" src="js/ocw.js"></script>
                <div class="searchform">
                    <div>
                        <input type="text" onblur="fillSearchBox()" onfocus="clearSearchBox()" maxlength="255" value="<bean:message key="text.keyword"/>" name="q" class="search" id="terms" /> 			 
                        <a href="Search.do"><bean:message key="text.go"/></a>			 
                        <a href="Search.do"><bean:message key="text.advancedsearch"/></a>
                    </div>
                </div>
        </td>
    </tr>
</table>
