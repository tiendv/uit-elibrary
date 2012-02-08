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
        if(session.getAttribute("username")!=null)
        {    
            if((Integer)session.getAttribute("group") ==1||(Integer)session.getAttribute("group") ==2)//admin or mod
            {
        %>          
        <td class="menu_td_link"><a class="menu_link" href="LoadThesis.do"><bean:message key ="text.thesis"/></a></td>
        <%}}%>
         <%
        if(session.getAttribute("username")==null)
        {    
            CheckGroupDetail checkGroupDetail = new CheckGroupDetail();
            if(checkGroupDetail.GroupDetail(null, 2, 1))
            {
        %>          
        <td class="menu_td_link"><a class="menu_link" href="LoadThesis.do"><bean:message key ="text.thesis"/></a></td>
        <%}}%>         
        <td class="menu_td_link"><a class="menu_link" href="LoadAllNews.do"><bean:message key ="text.news"/></a></td>
        <%
        if(session.getAttribute("username")!=null)
        {    
            if((Integer)session.getAttribute("group") ==1||(Integer)session.getAttribute("group") ==2)//admin or mod
            {
        %>          
        <td class="menu_td_link"><a class="menu_link" href="Mod.do"><bean:message key="text.modpage"/></a></td>
        <%}}%>  
        <%
        if(session.getAttribute("username")!=null)
        {    
            if((Integer)session.getAttribute("group") ==1)//admin
            {
        %>        
            <td class="menu_td_link"><a class="menu_link" href="Admin.do"><bean:message key="text.adminpage"/></a></td>
        <%}}%>       
        <td align="right"><script type="text/javascript" src="js/ocw.js"></script>
            <form method="get" action="http://search.mit.edu/search">
                <div class="searchform">
                    <div>
                        <input type="hidden" value="ocw" name="site" />  
                        <input type="hidden" value="mit" name="client" /> 			 
                        <input type="hidden" value="*" name="getfields" />  
                        <input type="hidden" value="xml_no_dtd" name="output" /> 			 
                        <input type="hidden" value="http://ocw.mit.edu/search/google-ocw.xsl" name="proxystylesheet" />
                        <input type="hidden" value="1" name="proxyreload" />  
                        <input type="hidden" value="i" name="as_dt" /> 			 
                        <input type="hidden" value="utf-8" name="oe" />  
                        <input type="hidden" value="web" name="departmentName" />
                        <input type="hidden" value="0" name="filter" />
                        <input type="hidden" name="courseName" />
                    </div>
                    <div>
                        <input type="text" onblur="fillSearchBox()" onfocus="clearSearchBox()" maxlength="255" value="Enter search keyword" name="q" class="search" id="terms" /> 			 
                        <input type="image" alt="Go" src="../image/go_new.gif" name="btnG" class="but" /> 			 
                        <a href="/search/AdvancedSearch.htm">Advanced Search</a>
                    </div>
                </div>
            </form>
        </td>
    </tr>
</table>
