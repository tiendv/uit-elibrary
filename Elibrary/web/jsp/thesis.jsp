<%-- 
    Document   : thesis
    Created on : Jan 16, 2012, 11:08:17 PM
    Author     : Nguyen Hoang Tan
--%>

<%@page import="uit.elib.dto.Level"%>
<%@page import="org.apache.struts.Globals"%>
<%@page import="java.util.Locale"%>
<%@page import="uit.elib.dto.Faculty"%>
<%@page import="java.util.Date"%>
<%@page import="java.util.List"%>
<%@page import="uit.elib.dto.Resource"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://struts.apache.org/tags-bean" prefix="bean" %>
<!DOCTYPE html>
<html>
    <head>
        <link rel="stylesheet" type="text/css" href="css/uit.css" />
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title><bean:message key="text.thesis"/> </title>
    </head>
    <body>
        <div style="clear:both"></div> 
        <% 
            List<Resource> listResource =  (List<Resource>)request.getAttribute("listResource");
            List<Faculty> listFaculty=  (List<Faculty>)request.getAttribute("listFaculty");
            List<Level> listLevel =  (List<Level>)request.getAttribute("listLevel");
            int language =1; // English
            Locale locale = request.getLocale();
            if(request.getSession().getAttribute(Globals.LOCALE_KEY).toString().equals("vn"))
                language=2; // VietNamese
            if(listResource.size()>0){
            int r=0;                     
            for(int l=0;l<listLevel.size();l++){
                if(language==1) { %>
                    <div class="title_h1"><%=listLevel.get(l).getLevelNameEn() %></div>  <!--English Faculty Name-->
                <% } %> 
                <% if(language==2) {%>
                    <div class="title_h1"><%=listLevel.get(l).getLevelNameVn() %></div> <!--Vietnamese Faculty Name-->
                <% } %>         
                <%
                   if(listResource.get(r).getLevel().getLevelId()!=listLevel.get(l).getLevelId()){
                %>
                    <div style="margin-left: 30px;color: #680a12">
                        <img src="image/black-arrow.gif" width="3" height="5" alt="black-arrow"/>
                        <bean:message key="text.updating"/>
                    </div>
                <%  }
                    if(listResource.get(r).getLevel().getLevelId()==listLevel.get(l).getLevelId()){  %> 
                <table style="margin-left: 30px " width="600px"> 
                    <%                 
                        for(int i=r;i<listResource.size();i=i+2) {
                            if(listResource.get(i).getLevel().getLevelId()!=listLevel.get(l).getLevelId())
                                break;
                            String href = "#"+listResource.get(i).getResourceId().toString();
                    %>
                    <tr>      
                    <td width="250px" style="color: #680a12">              
                            <img src="image/black-arrow.gif" width="3" height="5" alt="black-arrow"/>
                            <% if(language==1) { %>
                                <a href =<%=href%> class="href_subject" > <%=listResource.get(i).getResourceNameEn()%>  </a> <!--English Resource Name-->
                            <% } %> 
                            <% if(language==2) {%>
                                <a href =<%=href%> class="href_subject" ><%=listResource.get(i).getResourceNameVn()%> </a> <!--Vietnamese Resource Name-->
                            <% } %>                         
                    </td>
                    <td width="250px" style="color: #680a12">
                        <% if(i+1<listResource.size() && (listResource.get(i).getLevel().getLevelId()==listLevel.get(l).getLevelId())){ %>
                            <img src="image/black-arrow.gif" width="3" height="5" alt="black-arrow"/>
                            <% if(language==1) {%>
                                <a href =<%=href%> class="href_subject" > <%=listResource.get(i+1).getResourceNameEn()%> </a> <!--English Resource Name-->
                            <% } %> 
                            <% if(language==2) {%>
                                <a href =<%=href%> class="href_subject" > <%=listResource.get(i+1).getResourceNameVn()%> </a> <!--Vietnamese Resource Name-->
                            <% } %>

                        <% } %>    
                    </td>
                    </tr>
                    <% } %>
                </table>
                <table class="table_chapter" >
                    <tr class="color_title_table">
                        <td class="td_chapter_3"><bean:message key="text.orderchapter"/></td>
                        <td class="td_chapter_4"><bean:message key="text.chaptertitle"/></td>
                        <td class="td_chapter_2"></td>                
                        <td class="td_chapter_1"></td>                
                    </tr>
      
                    <%  
                        int color=0;
                        int number =0;
                        for(int i=r;i<listResource.size();i++) {
                            String href="./LoadThesisDetail.do?resourceID="+listResource.get(i).getResourceId();
                            if(listResource.get(i).getLevel().getLevelId()!=listLevel.get(l).getLevelId())
                            {     
                                r=i;
                                break;
                            }
                    %>
                    <% Date date = new Date();
                       boolean oneMonth = false; 
                       if(listResource.get(i).getPostDate()!=null)
                       {
                           long time= date.getTime()- listResource.get(i).getPostDate().getTime(); // time = today - postdate
                           if(time<=((long)30*24*60*60*1000)) // time <= 30 days
                               oneMonth=true;
                       }                    
                    %>
                   <tr>    
                        <td width="160px"  class="td_chapter_border"              
                        style="<% if(color%2==0){ %>background-color:#E2E1D9;<%}%> color:#680a12">
                            <%=number++%> <!--Chapter-->
                        </td>  
                        <% if(language==1) {%>                              
                            <td width="354px"              
                                style="<% if(color%2==0){ %>background-color:#E2E1D9;<%}%> color:#680a12">
                                <%=listResource.get(i).getResourceNameEn() %> <!--English Resource Name-->
                            </td>
                        <% } %> 
                        <% if(language==2) {%>                               
                            <td width="354px"                           
                                style="<% if(color%2==0){ %>background-color:#E2E1D9;<%}%> color:#680a12">
                                <%=listResource.get(i).getResourceNameVn() %> <!--Vietnamese Resource Name-->
                            </td>
                        <% } %>
                        <td width="140px"
                            <% if(color%2==0){ %> 
                                style="background-color:#E2E1D9"
                            <%}%>                               >                          
                        </td>
                        <td width="40px"
                            <% if(color%2==0){ %> 
                                style="background-color:#E2E1D9"
                            <%}%>                               >
                            <% if(oneMonth==true) {%>
                                <img src="image/new-icon.gif" width="18" height="5" alt="new-icon"/> <!-- new icon  -->
                            <% } %>
                        </td>
                    </tr >              
                    <% color ++; } %>
                </table>
            <% }}}%>
    </body>
</html>
