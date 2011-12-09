<%-- 
    Document   : lecturenote
    Created on : Dec 1, 2012, 8:27:49 AM
    Author     : HERO
--%>

<%@page import="uit.elib.dto.Resource"%>
<%@page import="uit.elib.dto.Subject" %>
<%@page import="org.apache.struts.Globals"%>
<%@page import="java.util.Locale"%>
<%@page import="java.util.List"%>
<%@ taglib uri="http://struts.apache.org/tags-bean" prefix="bean" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link href="<html:rewrite page='/css/uit.css'/>" rel="stylesheet" type="text/css" />
    </head>
    <body>
        <%
                    List<Resource> listResource; // List resource of subject ( not chapter)
                    List<Resource> listChapter; // List Chapter of Subject
                    listResource = (List<Resource>)request.getAttribute("listResource");
                    listChapter = (List<Resource>)request.getAttribute("listChapter");
                    int orderChapter = Integer.parseInt(request.getAttribute("orderChapter").toString());
                    Subject subject =(Subject)request.getAttribute("subject"); // lấy thông tin môn học
                    int subjectID = Integer.parseInt(request.getAttribute("subjectID").toString());
                    int resourceCategoryID = Integer.parseInt(request.getAttribute("resourceCategoryID").toString());
                    int language =1; // English
                    Locale locale = request.getLocale();
                    if(request.getSession().getAttribute(Globals.LOCALE_KEY).toString().equals("vn"))
                        language = 2; // VietNamese
                    int color=1;
        %>
        
        <!-- Begin load resource by OrderChapter (ResourceCategoryID= 10, giáo trình) -->
        <%if(resourceCategoryID==10) {%>
        
        <div class="hyperlink_title_subject" ><a href="LoadSubject.do"><bean:message key ="text.menu.subject"/></a> > <a href="SubjectHome.do?subjectID=<%=subjectID%>">
                <% if(language==1){%>
                    <%=subject.getSubjectNameEn()%>
                <%}if(language==2){%>
                    <%=subject.getSubjectNameVn()%>
                    <%}%>
            </a> > <bean:message key ="text.menu.lecturenote"/></div>
        <table  class="resource_table">
            <tr  class="color_title_table"> <!-- title -->
                <td width="80px"><bean:message key="text.OrderChapter" /></td>
                <td width="230px"><bean:message key="text.ChapterTitle" /></td>
                <td width="330px"><bean:message key="text.Summary" /></td>
                <td width="98px"><bean:message key="text.Document" /></td>
            </tr>
        <% 
                    
                    for(int i = 0; i<listChapter.size();i++){
        %>
        <tr>
            <td <% if(color%2==0){ %> 
                                    class="color_table2"
                                <%}%> > 
                               <%=listChapter.get(i).getOrderChapter()%>
             </td>
             <td <% if(color%2==0){ %> 
                                    class="color_table2"
                                <%}%> >              
                        <% if(language==1) {%>
                        <p><u>  <%=listChapter.get(i).getResourceNameEn()%></u> </p>
                        <% } %> 
                        <% if(language==2) {%>
                            <u> <%=listChapter.get(i).getResourceNameVn()%> </u>
                        <% } %>                         
             </td>
             <td <% if(color%2==0){ %> 
                                class="color_table2"
                                <%}%> >              
                        <% if(language==1) {%>
                             <u> <%=listChapter.get(i).getSummaryEn()%> </u>
                        <% } %> 
                        <% if(language==2) {%>
                            <u> <%=listChapter.get(i).getSummaryVn()%> </u>
                        <% } %>                         
             </td>
             <td <% if(color%2==0){ %> 
                                    class="color_table2"
                                <%}%>  >
                    <%for(int k=0;k<listResource.size();k++)
                        if(Integer.parseInt(listChapter.get(i).getOrderChapter().toString())== Integer.parseInt(listResource.get(k).getOrderChapter().toString()))
                           {%>
                     <u> <a href="DownLoad.do?resourceID=<%=listResource.get(k).getResourceId()%>" > <%=listResource.get(k).getFormat() %> </a> </u>
                    <%}%>
             </td>
             <%color++;%>
        </tr>
                <%}%>
        </table>
        <%}%>  <!--End of ResourceCategoryID=10  IF -->
        
        
        <!--End of ResourceCategoryID= 10, giáo trình -->
        
        <!--Begin Load Reading ( ResourceCategoryID=9, tài liệu tham khảo) -->
        
        <%if(resourceCategoryID==9) {%>
        <div class="hyperlink_title_subject"><a href="Loadsubject.do"><bean:message key ="text.menu.subject"/></a> > <a href="SubjectHome.do?subjectID=<%=subjectID%>">
            <% if(language==1){%>
                    <%=subject.getSubjectNameEn()%>
            <%}if(language==2){%>
                    <%=subject.getSubjectNameVn()%>
            <%}%>
            </a> > <bean:message key ="text.menu.reading"/></div>
        <table class="resource_table" >
            <tr class="color_title_table">
                <td width="100px"><bean:message key="text.OrderNumber"/> </td>
                <td width="638px"><bean:message key="text.Document"/> </td>
            </tr>
                <%
                    int count = 1; //thứ tự
                    for(int i = 0; i<listResource.size();i++){
                 %>
                 <tr>
                 <td <% if(color%2==0){ %> 
                                    class="color_table2"
                                <%}%>>
                     <%=count%></td>
                 <td <% if(color%2==0){ %> 
                                    class="color_table2"
                                <%}%>>
                     <% if(language==1) {%>
                         <u>  <%=listResource.get(i).getResourceNameEn()%> </u>
                     <%}%>
                     <% if(language==2) {%>
                        <u> <%=listResource.get(i).getResourceNameVn()%> </u>
                     <%}%>
                 </td>
                 <% count++;%>
                 <%color++;%>
                 <%}%>
            </tr>
         </table>
        <%}%> 
        
        
        
        <!--End of ResourceCategoryID=9 IF -->
        
        
        
        <!--Begin Load Video ( ResourceCategoryID=11, video) -->
        
        <%if(resourceCategoryID==11) {%>
        <div class="hyperlink_title_subject"><a href="Loadsubject.do"><bean:message key ="text.menu.video"/></a> > <a href="SubjectHome.do?subjectID=<%=subjectID%>">
            <% if(language==1){%>
                    <%=subject.getSubjectNameEn()%>
            <%}if(language==2){%>
                    <%=subject.getSubjectNameVn()%>
            <%}%>
            </a> > <bean:message key ="text.menu.reading"/></div>
        <table class="resource_table" >
            <tr class="color_title_table">
                <td width="100px"><bean:message key="text.OrderNumber"/> </td>
                <td width="638px"><bean:message key="text.Document"/> </td>
            </tr>
                <%
                    int count = 1; //thứ tự
                    for(int i = 0; i<listResource.size();i++){
                 %>
                 <tr>
                 <td <% if(color%2==0){ %> 
                                    class="color_table2"
                                <%}%>>
                     <%=count%></td>
                 <td <% if(color%2==0){ %> 
                                    class="color_table2"
                                <%}%>>
                     <% if(language==1) {%>
                         <u>  <%=listResource.get(i).getResourceNameEn()%> </u>
                     <%}%>
                     <% if(language==2) {%>
                        <u> <%=listResource.get(i).getResourceNameVn()%> </u>
                     <%}%>
                 </td>
                 <% count++;%>
                 <%color++;%>
                 <%}%>
            </tr>
         </table>
        <%}%> 
        
        
        
        <!--End of ResourceCategoryID=11 IF -->
        
        
         <!-- Begin load resource by OrderChapter (ResourceCategoryID=4, bài tập) -->
        <%if(resourceCategoryID==4) {%>
        
        <div class="hyperlink_title_subject" ><a href="LoadSubject.do"><bean:message key ="text.menu.subject"/></a> > <a href="SubjectHome.do?subjectID=<%=subjectID%>">
                <% if(language==1){%>
                    <%=subject.getSubjectNameEn()%>
                <%}if(language==2){%>
                    <%=subject.getSubjectNameVn()%>
                    <%}%>
            </a> > <bean:message key ="text.menu.assignments"/></div>
        <table  class="resource_table">
            <tr  class="color_title_table"> <!-- title -->
                <td width="80px"><bean:message key="text.OrderChapter" /></td>
                <td width="230px"><bean:message key="text.ChapterTitle" /></td>
                <td width="330px"><bean:message key="text.Summary" /></td>
                <td width="98px"><bean:message key="text.Document" /></td>
            </tr>
        <% 
                    
                    for(int i = 0; i<listChapter.size();i++){
        %>
        <tr>
            <td <% if(color%2==0){ %> 
                                    class="color_table2"
                                <%}%> > 
                               <%=listChapter.get(i).getOrderChapter()%>
             </td>
             <td <% if(color%2==0){ %> 
                                    class="color_table2"
                                <%}%> >              
                        <% if(language==1) {%>
                        <p><u>  <%=listChapter.get(i).getResourceNameEn()%></u> </p>
                        <% } %> 
                        <% if(language==2) {%>
                            <u> <%=listChapter.get(i).getResourceNameVn()%> </u>
                        <% } %>                         
             </td>
             <td <% if(color%2==0){ %> 
                                class="color_table2"
                                <%}%> >              
                        <% if(language==1) {%>
                             <u> <%=listChapter.get(i).getSummaryEn()%> </u>
                        <% } %> 
                        <% if(language==2) {%>
                            <u> <%=listChapter.get(i).getSummaryVn()%> </u>
                        <% } %>                         
             </td>
             <td <% if(color%2==0){ %> 
                                    class="color_table2"
                                <%}%>  >
                    <%for(int k=0;k<listResource.size();k++)
                        if(Integer.parseInt(listChapter.get(i).getOrderChapter().toString())== Integer.parseInt(listResource.get(k).getOrderChapter().toString()))
                           {%>
                     <u> <a href="DownLoad.do?resourceID=<%=listResource.get(k).getResourceId()%>" > <%=listResource.get(k).getFormat() %> </a> </u>
                    <%}%>
             </td>
             <%color++;%>
        </tr>
                <%}%>
        </table>
        <%}%>  <!--End of ResourceCategoryID=4  IF -->
        
        
        
        
        <!--Begin of ResourceCategoryID = 6 (đồ án môn học) -->
        
        <%if(resourceCategoryID==6) {%>
        <div class="hyperlink_title_subject"><a href="LoadSubject.do"><bean:message key ="text.menu.subject"/></a> > <a href="SubjectHome.do?subjectID=<%=subjectID%>">
            <% if(language==1){%>
                    <%=subject.getSubjectNameEn()%>
            <%}if(language==2){%>
                    <%=subject.getSubjectNameVn()%>
            <%}%>
            </a> > <bean:message key ="text.menu.project"/></div>
        
        <div><a><h2><bean:message key="text.ProjectRequirementTitle"/>:</h2></a></div>
        <% if(language==1){%>
            <u> <%=subject.getProjectRequirementEn()%> </u>
        <%}%>
        <% if(language==2){%>
            <u>  <%=subject.getProjectRequirementVn()%> </u>
        <%}%>
        
        <div><a><h2><bean:message key="text.ListTemplateProject"/></h2></a></div>
        <table class="resource_table" >
            <tr class="color_title_table">
                <td width="100px"><bean:message key="text.OrderNumber"/> </td>
                <td width="200px"><bean:message key="text.projectAuthor"/> </td>
                <td width="328px"><bean:message key="text.projectNameEN"/> </td>
                <td width="110px"><bean:message key="text.note"/> </td>
            </tr>
                <%
                    int count = 1; //thứ tự
                    for(int i = 0; i<listResource.size();i++){
                 %>
                 <tr>
                 <td <% if(color%2==0){ %> 
                                    class="color_table2"
                     <%}%>>
                        <%=count%>
                 </td>
                 <td <% if(color%2==0){ %> 
                                    class="color_table2"
                     <%}%>>
                        <%=listResource.get(i).getAuthor()%> 
                 </td>
                 <td <% if(color%2==0){ %> 
                                    class="color_table2"
                                <%}%>>
                     <% if(language==1) {%>
                     <%
                        if(Integer.parseInt(listResource.get(i).getSubject().getSubjectId().toString())== Integer.parseInt(subject.getSubjectId().toString()))
                           {%>
                     <u> <a href="DownLoad.do?resourceID=<%=listResource.get(i).getResourceId()%>" > <%=listResource.get(i).getResourceNameEn() %> </a> </u>
                    <%}%> 
                     <%}%>
                     <% if(language==2) {%>
                     <%
                        if(Integer.parseInt(listResource.get(i).getSubject().getSubjectId().toString())== Integer.parseInt(subject.getSubjectId().toString()))
                           {%>
                     <u> <a href="DownLoad.do?resourceID=<%=listResource.get(i).getResourceId()%>" > <%=listResource.get(i).getResourceNameVn() %> </a> </u>
                    <%}%> 
                     <%}%>
                 </td>
                 <td <% if(color%2==0){ %> 
                                    class="color_table2"
                                <%}%>>
                     <% if(language==1) {%>
                        <p> <%=listResource.get(i).getSummaryEn()%> </p>
                     <%}%>
                     <% if(language==2) {%>
                        <p><%=listResource.get(i).getSummaryVn()%> </p>
                     <%}%>
                 </td>
                 <% count++;%>
                 <%color++;%>
                 <%}%>
            </tr>
         </table>
        <%}%>
        
        
        <!--End of ResourceCategoryID=6( đồ án môn học) IF -->
        
        
    </body>
</html>
