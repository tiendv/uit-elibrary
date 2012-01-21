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
                    <div class="title_h1"><%=listLevel.get(l).getLevelNameEn() %></div>  <!--English Level Name-->
                <% } %> 
                <% if(language==2) {%>
                    <div class="title_h1"><%=listLevel.get(l).getLevelNameVn() %></div> <!--Vietnamese Level Name-->
                <% } %>         
                <%
                   if(listResource.get(r).getLevel().getLevelId()!=listLevel.get(l).getLevelId()){
                %>
                    <div class="thesis_update">
                        <img src="image/black-arrow.gif" class="image_black_arrow" alt="black-arrow"/>
                        <bean:message key="text.updating"/>
                    </div>
                 <%  }
                    if(listResource.get(r).getLevel().getLevelId()==listLevel.get(l).getLevelId()){  %> 
                    <table class="thesis_table"> 
                    <%                 
                        for(int i=r;i<listResource.size();i=i+2) {
                            if(listResource.get(i).getLevel().getLevelId()!=listLevel.get(l).getLevelId())
                                break;
                    %>
                    <tr>      
                    <td class="thesis_row">              
                            <img src="image/black-arrow.gif" class="image_black_arrow" alt="black-arrow"/>
                            <% if(language==1) { %>
                                <a href ="#<%=listResource.get(i).getResourceId()%>" class="href_subject" > <%=listResource.get(i).getResourceNameEn()%>  </a> <!--English Resource Name-->
                            <% } %> 
                            <% if(language==2) {%>
                                <a href ="#<%=listResource.get(i).getResourceId()%>" class="href_subject" ><%=listResource.get(i).getResourceNameVn()%> </a> <!--Vietnamese Resource Name-->
                            <% } %>                         
                    </td>
                    <td class="thesis_row">
                        <% if(i+1<listResource.size() && (listResource.get(i+1).getLevel().getLevelId()==listLevel.get(l).getLevelId())){ %>
                            <img src="image/black-arrow.gif" class="image_black_arrow" alt="black-arrow"/>
                            <% if(language==1) {%>
                                <a href ="#<%=listResource.get(i+1).getResourceId()%>" class="href_subject" > <%=listResource.get(i+1).getResourceNameEn()%> </a> <!--English Resource Name-->
                            <% } %> 
                            <% if(language==2) {%>
                                <a href ="#<%=listResource.get(i+1).getResourceId()%>" class="href_subject" > <%=listResource.get(i+1).getResourceNameVn()%> </a> <!--Vietnamese Resource Name-->
                            <% } %>

                        <% } %>    
                    </td>
                    </tr>
                    <% } %>
                </table>
                <table class="table_chapter" >
                    <tr class="color_title_table">
                        <td class="td_chapter_1"><bean:message key="text.orderchapter"/></td>
                        <td class="td_chapter_2"><bean:message key="text.chaptertitle"/></td>
                        <td class="td_chapter_3"></td>                
                        <td class="td_chapter_4"></td>                
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
                        <td <% if(color%2==0){ %>class="td_chapter_1_content_even"<%}%> 
                            <% if(color%2!=0){ %>class="td_chapter_1_content_odd"<%}%> >
                            <%=number++%> 
                        </td>  
                        <% if(language==1) {%>                              
                            <td <% if(color%2==0){ %>class="td_chapter_2_content_even"<%}%> 
                                <% if(color%2!=0){ %>class="td_chapter_2_content_odd"<%}%> >
                                <a href="<%=href%>" class="href_subject" name="<%=listResource.get(i).getResourceId()%>"><%=listResource.get(i).getResourceNameEn() %></a> <!--English Resource Name-->
                            </td>
                        <% } %> 
                        <% if(language==2) {%>                               
                            <td <% if(color%2==0){ %>class="td_chapter_2_content_even"<%}%> 
                                <% if(color%2!=0){ %>class="td_chapter_2_content_odd"<%}%> >
                                <a href="<%=href%>" class="href_subject" name="<%=listResource.get(i).getResourceId()%>"><%=listResource.get(i).getResourceNameVn() %></a> <!--Vietnamese Resource Name-->
                            </td>
                        <% } %>
                        <td <% if(color%2==0){ %>class="td_chapter_3_content_even"<%}%> 
                            <% if(color%2!=0){ %>class="td_chapter_3_content_odd"<%}%> >                        
                        </td>
                        <td <% if(color%2==0){ %>class="td_chapter_4_content_even"<%}%> 
                            <% if(color%2!=0){ %>class="td_chapter_4_content_odd"<%}%> >
                            <% if(oneMonth==true) {%>
                                <img src="image/new-icon.gif" class="image_newicon" alt="new-icon"/> <!-- new icon  -->
                            <% } %>
                        </td>
                    </tr >              
                    <% color ++; } %>
                </table>
            <% }}}%>
    </body>
</html>
