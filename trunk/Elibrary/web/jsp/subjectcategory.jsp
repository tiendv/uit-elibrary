<%-- 
    Document   : lecturenote
    Created on : Dec 1, 2012, 8:27:49 AM
    Author     : HERO
--%>
<%@page import="uit.elib.utility.CheckGroupDetail"%>
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
                    if(request.getSession().getAttribute(Globals.LOCALE_KEY).toString().equals("vn"))
                        language = 2; // VietNamese
                    int color=1;
        %>

        <%
        boolean allow=false;
        String username = null;
        if(session.getAttribute("username")!=null)
            username = (String)session.getAttribute("username");
        CheckGroupDetail checkGroupDetail = new CheckGroupDetail();
        if(checkGroupDetail.GroupDetail(username,resourceCategoryID,1)==true)
        {
            allow=true; 
        %>        
        <!-- Begin load resource by OrderChapter (ResourceCategoryID= 10, bài giảng) -->
        <%if(resourceCategoryID==10) {%>
        
        <div class="hyperlink_title_subject" ><a href="LoadSubject.do"><bean:message key ="text.subject"/></a> > <a href="SubjectIntroduction.do?subjectID=<%=subjectID%>">
                <% if(language==1){%>
                    <%=subject.getSubjectNameEn()%>
                <%}if(language==2){%>
                    <%=subject.getSubjectNameVn()%>
                    <%}%>
            </a> > <bean:message key ="text.lecturenote"/></div>
        <table  class="resource_table">
            <tr  class="color_title_table"> <!-- title -->
                <td width="80px"><bean:message key="text.orderchapter" /></td>
                <td width="230px"><bean:message key="text.chaptertitle" /></td>
                <td width="330px"><bean:message key="text.summary" /></td>
                <td width="98px"><bean:message key="text.document" /></td>
            </tr>
        <% 
                    
                    for(int i = 0; i<listChapter.size();i++){
        %>
        <tr>
            <td style="text-align: center;"<% if(color%2==0){ %> 
                                    class="color_table2"
                                <%}%> > 
                               <%=listChapter.get(i).getOrderChapter()%>
             </td>
             <td <% if(color%2==0){ %> 
                                    class="color_table2"
                                <%}%> >              
                        <% if(language==1) {%>
                            <%=listChapter.get(i).getResourceNameEn()%>
                        <% } %> 
                        <% if(language==2) {%>
                            <%=listChapter.get(i).getResourceNameVn()%> 
                        <% } %>                         
             </td>
             <td <% if(color%2==0){ %> 
                                class="color_table2"
                                <%}%> >              
                        <% if(language==1) {%>
                              <%=listChapter.get(i).getSummaryEn()%> 
                        <% } %> 
                        <% if(language==2) {%>
                             <%=listChapter.get(i).getSummaryVn()%> 
                        <% } %>                         
             </td>
             <td <% if(color%2==0){ %> 
                                    class="color_table2"
                                <%}%>  >
                    <%for(int k=0;k<listResource.size();k++)
                        if(Integer.parseInt(listChapter.get(i).getOrderChapter().toString())== Integer.parseInt(listResource.get(k).getOrderChapter().toString()))
                           {%>
                           <div class="displayIcon"><a  href = "DownLoad.do?resourceID=<%=listResource.get(k).getResourceId()%>" alt="<bean:message key="text.lecturenote"/>" class="lectureNotes" 
                                                        <% if(language==1) {%>
                            title="<%=listResource.get(k).getResourceNameEn()%>"
                        <% } %> 
                        <% if(language==2) {%>
                            title="<%=listResource.get(k).getResourceNameVn()%>" 
                        <% } %>></a></div>
                           
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
        <div class="hyperlink_title_subject"><a href="LoadSubject.do"><bean:message key ="text.subject"/></a> > <a href="SubjectIntroduction.do?subjectID=<%=subjectID%>">
            <% if(language==1){%>
                    <%=subject.getSubjectNameEn()%>
            <%}if(language==2){%>
                    <%=subject.getSubjectNameVn()%>
            <%}%>
            </a> > <bean:message key ="text.reading"/></div>
        <table class="resource_table" >
            <tr class="color_title_table">
                <td width="100px"><bean:message key="text.orderchapter"/> </td>
                <td width="638px"><bean:message key="text.document"/> </td>
            </tr>
                <%if(listResource.size()==0){ %> <!--Nếu chưa có tài nguyên thì hiện "đang cập nhật" -->
                    <td></td>
                    <td>Đang cập nhật...</td>
                 <%}%>
                <%
                    int count = 1; //thứ tự
                    for(int i = 0; i<listResource.size();i++){
                        
                 %>
                 <tr>
                 <td style="text-align: center;"<% if(color%2==0){ %> 
                                    class="color_table2"
                                <%}%>>
                     <%=count%></td>
                 <td <% if(color%2==0){ %> 
                                    class="color_table2"
                                <%}%>>
                     <% if(language==1) {%>
                        <%if(listResource.get(i).getServerName() != null){%><!--Nếu có link download thì cho download -->
                            <a href="DownLoad.do?resourceID=<%=listResource.get(i).getResourceId()%>" > <%=listResource.get(i).getResourceNameEn() %> </a>
                        <%}else{%>
                              <%=listResource.get(i).getResourceNameEn()%> 
                        <%}%>
                     <%}%>
                     <% if(language==2) {%>
                        <%if(listResource.get(i).getServerName() != null){%><!--Nếu có link download thì cho download -->
                            <a href="DownLoad.do?resourceID=<%=listResource.get(i).getResourceId()%>" > <%=listResource.get(i).getResourceNameVn() %> </a>
                        <%}else{%>
                               <%=listResource.get(i).getResourceNameVn()%> 
                        <%}%>
                     <%}%>
                 </td>
                 <% count++;%>
                 <%color++;%>
                 <%}%>
            </tr>
         </table>
        <%}%> 
        
        
        
        <!--End of ResourceCategoryID=9 IF -->
        
        
         <!-- Begin load resource by OrderChapter (ResourceCategoryID=4, bài tập) -->
        <%if(resourceCategoryID==4) {%>
        
        <div class="hyperlink_title_subject" ><a href="LoadSubject.do"><bean:message key ="text.subject"/></a> > <a href="SubjectIntroduction.do?subjectID=<%=subjectID%>">
                <% if(language==1){%>
                    <%=subject.getSubjectNameEn()%>
                <%}if(language==2){%>
                    <%=subject.getSubjectNameVn()%>
                    <%}%>
            </a> > <bean:message key ="text.assignments"/></div>
        <table  class="resource_table">
            <tr  class="color_title_table"> <!-- title -->
                <td width="80px"><bean:message key="text.orderchapter" /></td>
                <td width="230px"><bean:message key="text.chaptertitle" /></td>
                <td width="330px"><bean:message key="text.summary" /></td>
                <td width="98px"><bean:message key="text.document" /></td>
            </tr>
        <% 
                    
                    for(int i = 0; i<listChapter.size();i++){
        %>
        <tr>
            <td style="text-align: center;"<% if(color%2==0){ %> 
                                    class="color_table2"
                                <%}%> > 
                               <%=listChapter.get(i).getOrderChapter()%>
             </td>
             <td <% if(color%2==0){ %> 
                                    class="color_table2"
                                <%}%> >              
                        <% if(language==1) {%>
                        <p>  <%=listChapter.get(i).getResourceNameEn()%> </p>
                        <% } %> 
                        <% if(language==2) {%>
                            <%=listChapter.get(i).getResourceNameVn()%> 
                        <% } %>                         
             </td>
             <td <% if(color%2==0){ %> 
                                class="color_table2"
                                <%}%> >              
                        <% if(language==1) {%>
                              <%=listChapter.get(i).getSummaryEn()%> 
                        <% } %> 
                        <% if(language==2) {%>
                             <%=listChapter.get(i).getSummaryVn()%> 
                        <% } %>                         
             </td>
             <td <% if(color%2==0){ %> 
                                    class="color_table2"
                                <%}%>  >
                    <%for(int k=0;k<listResource.size();k++)
                        if(Integer.parseInt(listChapter.get(i).getOrderChapter().toString())== Integer.parseInt(listResource.get(k).getOrderChapter().toString()))
                           {%>
                      <a href="DownLoad.do?resourceID=<%=listResource.get(k).getResourceId()%>" alt="<bean:message key="text.assignments"/>" class="multimediaContent" title="<bean:message key="text.assignments"/>"></a>
                    <%}%>
             </td>
             <%color++;%>
        </tr>
                <%}%>
        </table>
        <%}%>  <!--End of ResourceCategoryID=4  IF -->
        
        
        
      
        
        <!-- Begin load resource by OrderChapter (ResourceCategoryID=5, ví dụ) -->
        <%if(resourceCategoryID==5) {%>
        
        <div class="hyperlink_title_subject" ><a href="LoadSubject.do"><bean:message key ="text.subject"/></a> > <a href="SubjectIntroduction.do?subjectID=<%=subjectID%>">
                <% if(language==1){%>
                    <%=subject.getSubjectNameEn()%>
                <%}if(language==2){%>
                    <%=subject.getSubjectNameVn()%>
                    <%}%>
            </a> > <bean:message key ="text.example"/></div>
        <table  class="resource_table">
            <tr  class="color_title_table"> <!-- title -->
                <td width="80px"><bean:message key="text.orderchapter" /></td>
                <td width="230px"><bean:message key="text.chaptertitle" /></td>
                <td width="330px"><bean:message key="text.summary" /></td>
                <td width="98px"><bean:message key="text.document" /></td>
            </tr>
        <% 
                    
                    for(int i = 0; i<listChapter.size();i++){
        %>
        <tr>
            <td style="text-align: center;"<% if(color%2==0){ %> 
                                    class="color_table2"
                                <%}%> > 
                               <%=listChapter.get(i).getOrderChapter()%>
             </td>
             <td <% if(color%2==0){ %> 
                                    class="color_table2"
                                <%}%> >              
                        <% if(language==1) {%>
                        <p>  <%=listChapter.get(i).getResourceNameEn()%> </p>
                        <% } %> 
                        <% if(language==2) {%>
                            <%=listChapter.get(i).getResourceNameVn()%> 
                        <% } %>                         
             </td>
             <td <% if(color%2==0){ %> 
                                class="color_table2"
                                <%}%> >              
                        <% if(language==1) {%>
                              <%=listChapter.get(i).getSummaryEn()%> 
                        <% } %> 
                        <% if(language==2) {%>
                             <%=listChapter.get(i).getSummaryVn()%> 
                        <% } %>                         
             </td>
             <td <% if(color%2==0){ %> 
                                    class="color_table2"
                                <%}%>  >
                    <%for(int k=0;k<listResource.size();k++)
                        if(Integer.parseInt(listChapter.get(i).getOrderChapter().toString())== Integer.parseInt(listResource.get(k).getOrderChapter().toString()))
                           {%>
                     <a href="DownLoad.do?resourceID=<%=listResource.get(k).getResourceId()%>" alt="<bean:message key="text.example"/>" class="multimediaContent" title="<bean:message key="text.example"/>"></a>
                    <%}%>
             </td>
             <%color++;%>
        </tr>
                <%}%>
        </table>
        <%}%>  <!--End of ResourceCategoryID=5  IF -->
        
        
        
        <!--Begin of ResourceCategoryID = 6 (đồ án môn học) -->
        
        <%if(resourceCategoryID==6) {%>
        <div class="hyperlink_title_subject"><a href="LoadSubject.do"><bean:message key ="text.subject"/></a> > <a href="SubjectIntroduction.do?subjectID=<%=subjectID%>">
            <% if(language==1){%>
                    <%=subject.getSubjectNameEn()%>
            <%}if(language==2){%>
                    <%=subject.getSubjectNameVn()%>
            <%}%>
            </a> > <bean:message key ="text.project"/></div>
        
            <div class="hyperlink_title_subject"><h2><bean:message key="text.projectrequirementtitle"/>:</h2></div>
        <% if(language==1){%>
            <div class="hyperlink_title_subject"><%=subject.getProjectRequirementEn()%></div>
        <%}%>
        <% if(language==2){%>
            <div class="hyperlink_title_subject"><%=subject.getProjectRequirementVn()%></div> 
        <%}%>
        <div class="hyperlink_title_subject"><br><h2><bean:message key="text.listtemplateproject"/></h2></div>
        <table class="resource_table" >
            <tr class="color_title_table">
                <td width="12%"><bean:message key="text.orderchapter"/> </td>
                <td width="20%"><bean:message key="text.projectauthor"/> </td>
                <td width="53%"><bean:message key="text.projectnameen"/> </td>
                <td width="15%"><bean:message key="text.note"/> </td>
            </tr>
            <%if(listResource.size()==0){ %> <!--Nếu chưa có tài nguyên thì hiện "đang cập nhật" -->
                    <td></td>
                    <td></td>
                    <td>Đang cập nhật...</td>
                 <%}%>
                <%
                    int count = 1; //thứ tự
                    for(int i = 0; i<listResource.size();i++){
                 %>
                 <tr>
                 <td style="text-align: center;"<% if(color%2==0){ %> 
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
        
        
         <!-- Begin load resource by OrderChapter (ResourceCategoryID=11, Video) -->
        <%if(resourceCategoryID==11) {%>
        
        <div class="hyperlink_title_subject" ><a href="LoadSubject.do"><bean:message key ="text.subject"/></a> > <a href="SubjectIntroduction.do?subjectID=<%=subjectID%>">
                <% if(language==1){%>
                    <%=subject.getSubjectNameEn()%>
                <%}if(language==2){%>
                    <%=subject.getSubjectNameVn()%>
                    <%}%>
            </a> > <bean:message key ="text.video"/></div>
        <table  class="resource_table">
            <tr  class="color_title_table"> <!-- title -->
                <td width="80px"><bean:message key="text.orderchapter" /></td>
                <td width="230px"><bean:message key="text.chaptertitle" /></td>
                <td width="330px"><bean:message key="text.summary" /></td>
                <td width="98px"><bean:message key="text.document" /></td>
            </tr>
        <% 
                    
                    for(int i = 0; i<listChapter.size();i++){
        %>
        <tr>
            <td style="text-align: center;"<% if(color%2==0){ %> 
                                    class="color_table2"
                                <%}%> > 
                               <%=listChapter.get(i).getOrderChapter()%>
             </td>
             <td <% if(color%2==0){ %> 
                                    class="color_table2"
                                <%}%> >              
                        <% if(language==1) {%>
                        <p>  <%=listChapter.get(i).getResourceNameEn()%> </p>
                        <% } %> 
                        <% if(language==2) {%>
                            <%=listChapter.get(i).getResourceNameVn()%> 
                        <% } %>                         
             </td>
             <td <% if(color%2==0){ %> 
                                class="color_table2"
                                <%}%> >              
                        <% if(language==1) {%>
                              <%=listChapter.get(i).getSummaryEn()%> 
                        <% } %> 
                        <% if(language==2) {%>
                             <%=listChapter.get(i).getSummaryVn()%> 
                        <% } %>                         
             </td>
             <td <% if(color%2==0){ %> 
                                    class="color_table2"
                                <%}%>  >
                    <%for(int k=0;k<listResource.size();k++)
                        if(Integer.parseInt(listChapter.get(i).getOrderChapter().toString())== Integer.parseInt(listResource.get(k).getOrderChapter().toString()))
                           {%>
                      <a href="DownLoad.do?resourceID=<%=listResource.get(k).getResourceId()%>" alt="<bean:message key="text.video"/>" class="multimediaContent" title="<bean:message key="text.video"/>"></a>
                    <%}%>
             </td>
             <%color++;%>
        </tr>
                <%}%>
        </table>
        <%}%>  <!--End of ResourceCategoryID=11  IF -->
     </body>
</html>
<%}%>
<%if(allow==false){%>
<jsp:include page="../jsp/wrongpage.jsp" flush="true"/>
<%}%>
