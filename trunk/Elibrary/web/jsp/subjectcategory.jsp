<%-- 
    Document   : lecturenote
    Created on : Dec 1, 2012, 8:27:49 AM
    Author     : HERO
--%>
<%@page import="java.util.Date"%>
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
            Subject subject =(Subject)request.getAttribute("subject"); // lấy thông tin môn học
            int subjectID = Integer.parseInt(request.getAttribute("subjectID").toString());
            int resourceCategoryID = Integer.parseInt(request.getAttribute("resourceCategoryID").toString());
            int language =1; // English
            if(request.getSession().getAttribute(Globals.LOCALE_KEY).toString().equals("vi_VN"))
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
                <td width="100px"><bean:message key="text.ordernumber"/></td>
                <td width="540px"><bean:message key="text.chaptertitle" /></td>
                <td width="98px"><bean:message key="text.document"/></td>
            </tr>
                <%if(listResource.size()==0){ %> <!--Nếu chưa có tài nguyên thì hiện "đang cập nhật" -->
                    <td></td>
                    <td><bean:message key="text.updating"/></td>
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
                 <td>
                     <div class="displayIcon"><a  href = "DownLoad.do?resourceID=<%=listResource.get(i).getResourceId()%>" alt="<bean:message key="text.reading"/>" class="onlineTextBooks"/>
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
                      <div class="displayIcon"><a  href = "DownLoad.do?resourceID=<%=listResource.get(k).getResourceId()%>" alt="<bean:message key="text.assignments"/>" class="assignmentsSolutions" 
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
                            <div class="displayIcon"><a  href = "DownLoad.do?resourceID=<%=listResource.get(k).getResourceId()%>" alt="<bean:message key="text.example"/>" class="examsSolutions"
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
       
        <% 
            int year;
            Boolean haveThesis;
            Boolean lastIndex=false;
            if(listResource.size()>0){
            int r=0;                     
            haveThesis=true;    
            while(lastIndex==false){
                year=listResource.get(r).getYear();
                String thesisID="";
        %> 
                    <div class="year"><bean:message key="text.year"/> <%=year%></div>
                    <table class="thesis_table"> 
                    <%                 
                        for(int i=r;i<listResource.size();i=i+2) {
                            if(year!=listResource.get(i).getYear())
                                break;
                            thesisID = thesisID+listResource.get(i).getResourceId()+",";
                    %>
                    <tr>      
                    <td class="thesis_row">              
                            <img src="image/black-arrow.gif" class="image_black_arrow" alt="black-arrow"/>
                            <% if(language==1) { %>
                                <a href ="#<%=listResource.get(i).getResourceId()%>" class="href_subject" onclick="displayDetail('y<%=year%>',<%=listResource.get(i).getResourceId()%>)" > <%=listResource.get(i).getResourceNameEn()%>  </a> <!--English Resource Name-->
                            <% } %> 
                            <% if(language==2) {%>
                                <a href ="#<%=listResource.get(i).getResourceId()%>" class="href_subject" onclick="displayDetail('y<%=year%>',<%=listResource.get(i).getResourceId()%>)" ><%=listResource.get(i).getResourceNameVn()%> </a> <!--Vietnamese Resource Name-->
                            <% } %>                         
                    </td>
                    <td class="thesis_row">
                        <% if(i+1<listResource.size() && (year==listResource.get(i+1).getYear())){ %>
                            <img src="image/black-arrow.gif" class="image_black_arrow" alt="black-arrow"/>
                            <% if(language==1) {%>
                                <a href ="#<%=listResource.get(i+1).getResourceId()%>" class="href_subject" onclick="displayDetail('y<%=year%>',<%=listResource.get(i+1).getResourceId()%>)" > <%=listResource.get(i+1).getResourceNameEn()%> </a> <!--English Resource Name-->
                            <% } %> 
                            <% if(language==2) {%>
                                <a href ="#<%=listResource.get(i+1).getResourceId()%>" class="href_subject" onclick="displayDetail('y<%=year%>',<%=listResource.get(i+1).getResourceId()%>)" > <%=listResource.get(i+1).getResourceNameVn()%> </a> <!--Vietnamese Resource Name-->
                            <% } %>
                            <%thesisID = thesisID+listResource.get(i+1).getResourceId()+",";%>
                        <% } %>    
                    </td>
                    </tr>
                    <% } %>
                </table>
                <table class="table_thesis" id="y<%=year%>">
                    <tr class="color_title_table">
                        <td class="td_chapter_1"><bean:message key="text.ordernumber"/></td>
                        <td class="td_chapter_2"><bean:message key="text.chaptertitle"/></td>
                        <td class="td_chapter_3"><bean:message key="text.mark"/></td>                
                        <td class="td_chapter_4"><bean:message key="text.document"/></td>                
                    </tr>
                    <%  
                    color=0;
                    int number =0;
                    for(int i=r;i<listResource.size();i++) {
                        if(year!=listResource.get(i).getYear())
                        {     
                                r=i;
                                break;
                        }
                    %>
                <tr id="<%=listResource.get(i).getResourceId()%>" class="none">    
                        <td <% if(color%2==0){ %>class="td_chapter_1_content_even"<%}%> 
                            <% if(color%2!=0){ %>class="td_chapter_1_content_odd"<%}%> >
                            <%=++number%> 
                        </td>  
                        <% if(language==1) {%>                              
                            <td <% if(color%2==0){ %>class="td_chapter_2_content_even"<%}%> 
                                <% if(color%2!=0){ %>class="td_chapter_2_content_odd"<%}%> >
                                <%=listResource.get(i).getResourceNameEn() %> <!--English Resource Name-->
                            </td>
                        <% } %> 
                        <% if(language==2) {%>                               
                            <td <% if(color%2==0){ %>class="td_chapter_2_content_even"<%}%> 
                                <% if(color%2!=0){ %>class="td_chapter_2_content_odd"<%}%> >
                                <%=listResource.get(i).getResourceNameVn() %> <!--Vietnamese Resource Name-->
                            </td>
                        <% } %>
                        <td <% if(color%2==0){ %>class="td_chapter_3_content_even"<%}%> 
                            <% if(color%2!=0){ %>class="td_chapter_3_content_odd"<%}%> >
                            <%=listResource.get(i).getMark()%>
                        </td>
                        <td <% if(color%2==0){ %>class="td_chapter_4_content_even"<%}%> 
                            <% if(color%2!=0){ %>class="td_chapter_4_content_odd"<%}%> >
                            <div class="displayIcon"><a  href = "DownLoad.do?resourceID=<%=listResource.get(i).getResourceId()%>" alt="<bean:message key="text.video"/>" class="openStudy"></a></div>
                        </td>
                    </tr >
                    <% color ++; 
                    if(i+1>=listResource.size()) 
                        lastIndex=true;
                    } %>
                </table> 
        <% if(haveThesis) {%>
        <div class="seealldetail" id="seealldetail<%=year%>" onclick="seeAllDetail('seealldetail<%=year%>','closealldetail<%=year%>','y<%=year%>','<%=thesisID%>')"><a class="href_subject"><bean:message key="text.seealldetail"/></a></div>
        <div class="closealldetail" id="closealldetail<%=year%>" onclick="closeAllDetail('seealldetail<%=year%>','closealldetail<%=year%>','y<%=year%>','<%=thesisID%>')"><a class="href_subject"><bean:message key="text.closealldetail"/></a></div>   
        <% } %>            
        <%}}%>        
        <input type="hidden" id="currentLevelYear" value="-1"/>
        <input type="hidden" id="currentThesisID" value="-1"/>   
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
                            <div class="displayIcon"><a  href = "DownLoad.do?resourceID=<%=listResource.get(k).getResourceId()%>" alt="<bean:message key="text.video"/>" class="multimediaContent"
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
        <%}%>  <!--End of ResourceCategoryID=11  IF -->
     </body>
</html>
<%}%>
<%if(allow==false){%>
<jsp:include page="../jsp/wrongpage.jsp" flush="true"/>
<%}%>
<script type="text/javascript">
    function displayDetail(levelYear,thesisID)
    {
        var s= document.getElementById("currentThesisID").value;
        var l= document.getElementById("currentLevelYear").value;
        if(l!=levelYear)
        {
            document.getElementById(levelYear).style.display = "block";
            if(l!=-1)
                document.getElementById(l).style.display = "none";
            document.getElementById("currentLevelYear").value=levelYear;
        }           
        if(s!=thesisID)
        {
            document.getElementById(thesisID).style.display = "table-row";
            if(s!=-1)
                document.getElementById(s).style.display = "none";
            document.getElementById("currentThesisID").value=thesisID;
        }     
        setContent();             
    }
    function seeAllDetail(seealldetail,closealldetail,levelYear,manyResourceID)
    {
        var thesisID = manyResourceID.split(',');
        document.getElementById(levelYear).style.display = "block";
        for(var i=0;i<thesisID.length-1;i++)
            document.getElementById(thesisID[i]).style.display = "table-row";
        document.getElementById(seealldetail).style.display = "none";  
        document.getElementById(closealldetail).style.display = "block";
        document.getElementById("currentThesisID").value=-1;
        document.getElementById("currentLevelYear").value=-1;        
        setContent();  
    }
    function closeAllDetail(seealldetail,closealldetail,levelYear,manyResourceID)
    {
        var thesisID = manyResourceID.split(',');
        document.getElementById(levelYear).style.display = "none";
        for(var i=0;i<thesisID.length-1;i++)
            document.getElementById(thesisID[i]).style.display = "none";
        document.getElementById(seealldetail).style.display = "block";  
        document.getElementById(closealldetail).style.display = "none";
        setContent();          
    }    
</script>
