<%-- 
    Document   : subject
    Created on : Nov 22, 2011, 8:47:13 PM
    Author     : Nguyen Hoang Tan
--%>

<%@page import="java.util.Date"%>
<%@ taglib uri="http://struts.apache.org/tags-bean" prefix="bean" %>
<%@page import="org.apache.struts.Globals"%>
<%@page import="java.util.List"%>
<%@page import="uit.elib.dto.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<div class="title_h1"><bean:message key="text.subject"/></div>
<table class="subjecttable">               
    <% 
        List<Subject> listSubject;
        listSubject = (List<Subject>)request.getAttribute("listSubject");
        int language =1; // English
        if(request.getSession().getAttribute(Globals.LOCALE_KEY).toString().equals("vi_VN"))
            language=2; // VietNamese
    %>
    <%                 
        for(int i=0;i<listSubject.size();i=i+2) {
    %>
    <tr>          
    <td class="subjectname">              
            <img src="image/black-arrow.gif" class="image_black_arrow" alt="black-arrow"/>
            <% if(language==1) { %>
                <a href ="#<%=listSubject.get(i).getSubjectId()%>" class="href_subject" > <%=listSubject.get(i).getSubjectNameEn()%>  </a> <!--English Subject Name-->
            <% } %> 
            <% if(language==2) {%>
                <a href ="#<%=listSubject.get(i).getSubjectId()%>" class="href_subject" ><%=listSubject.get(i).getSubjectNameVn()%> </a> <!--Vietnamese Subject Name-->
            <% } %>  
    </td>
    <td class="subjectname">
        <% if(i+1<listSubject.size()){ %>
            <img src="image/black-arrow.gif" class="image_black_arrow" alt="black-arrow"/>
            <% if(language==1) {%>
                <a href ="#<%=listSubject.get(i+1).getSubjectId()%>" class="href_subject" > <%=listSubject.get(i+1).getSubjectNameEn()%> </a> <!--English Subject Name-->
            <% } %> 
            <% if(language==2) {%>
                <a href ="#<%=listSubject.get(i+1).getSubjectId()%>"class="href_subject" > <%=listSubject.get(i+1).getSubjectNameVn()%> </a> <!--Vietnamese Subject Name-->
            <% } %>

        <% } %>    
    </td>
    </tr>
    <% } %>
</table><br/>
<div class="af_legends">
    <ul class="legendList">
    <li class="lectureNotes" alt="Lecture notes"
        title="<bean:message key="text.lecturenote"/>"><bean:message key="text.lecturenote"/></li>
    <li class="multimediaContent"
        alt="Video"
        title="<bean:message key="text.video"/>"><bean:message key="text.video"/></li>
    <li class="assignmentsSolutions"
        alt="Assignments"
        title="<bean:message key="text.assignments"/>"><bean:message key="text.assignments"/></li>
    <li class="examsSolutions"
        alt="Example"
        title="<bean:message key="text.example"/>"><bean:message key="text.example"/></li>
</div>   
<% 
    List<Resource> listResource;
    listResource = (List<Resource>)request.getAttribute("listResource");
%> 
<%  int j=0;
    for(int i=0;i<listSubject.size();i++) {
        String href="./SubjectIntroduction.do?subjectID="+listSubject.get(i).getSubjectId();
%>
<% if(language==1) {%>
    <div class="subject">
        <a href =<%=href%> name=<%=listSubject.get(i).getSubjectId()%> ><%=listSubject.get(i).getSubjectNameEn() %></a> <!--English Subject Name-->
    </div>    
<% } %> 
<% if(language==2) {%>
    <div class="subject">
        <a href =<%=href%> name=<%=listSubject.get(i).getSubjectId()%>  ><%=listSubject.get(i).getSubjectNameVn() %></a> <!--Vietnamese Subject Name-->
    </div>    
<% } %>
<table class="table_chapter" >
    <tr class="color_title_table">
        <td class="td_chapter_1"><bean:message key="text.orderchapter"/></td>
        <td class="td_chapter_2"><bean:message key="text.chaptertitle"/></td>
        <td class="td_chapter_3"></td>
        <td class="td_chapter_4"></td>
    </tr>
    <% int color =0; %>
    <% for(;j<listResource.size();j++) {%>
         <%
            int numberOfResource=0;
            int newestPosition=-1;
            int chapterID =-1;
            int []arrayIcon = new int[11] ;
            for(int a=0;a<11;a++)
                arrayIcon[a]=0;
            int chapter = listResource.get(j).getOrderChapter();
            if(!listSubject.get(i).getSubjectId().equals(listResource.get(j).getSubject().getSubjectId()))
            {
                break;
            }
            while(chapter==listResource.get(j).getOrderChapter()&&(listSubject.get(i).getSubjectId().equals(listResource.get(j).getSubject().getSubjectId()))){
                if(numberOfResource==0)
                {
                    int rCID = listResource.get(j).getResourcecategory().getResourceCategoryId();
                        if(rCID==4||rCID==5||rCID==10||rCID==11)
                            numberOfResource=1;
                }
                if(newestPosition==-1)
                    newestPosition=j;
                if(listResource.get(j).getResourcecategory().getResourceCategoryId()==7)
                    chapterID=j;
                else
                    arrayIcon[listResource.get(j).getResourcecategory().getResourceCategoryId()-1]=1;
                j++;
                if(j>=listResource.size())
                    break;
            }
                j--;
            if(chapterID>=0)
            {    

        %>                       
        <tr>
        <% Date date = new Date(); 
           boolean oneMonth = false;

           if(listResource.get(newestPosition).getPostDate()!=null)
           {
               long time= date.getTime()- listResource.get(newestPosition).getPostDate().getTime(); // time = today - postdate
               if(time<=((long)30*24*60*60*1000)) // time <= 30 days
                   oneMonth=true;
           }
          %>                                                                            
        <% if(listSubject.get(i).getSubjectId().equals(listResource.get(j).getSubject().getSubjectId()))  // if resource belong to subject
        { %> 
            <td <% if(color%2==0){ %>class="td_chapter_1_content_even"<%}%> 
                <% if(color%2!=0){ %>class="td_chapter_1_content_odd"<%}%> >
                    <%=listResource.get(chapterID).getOrderChapter() %> <!--Chapter-->
            </td>  
        <% if(language==1) {%>                              
            <td <% if(color%2==0){ %>class="td_chapter_2_content_even"<%}%> 
                <% if(color%2!=0){ %>class="td_chapter_2_content_odd"<%}%> >
                <%=listResource.get(chapterID).getResourceNameEn() %> <!--English Resource Name-->
            </td>
        <% } %> 
        <% if(language==2) {%>                               
            <td <% if(color%2==0){ %>class="td_chapter_2_content_even"<%}%> 
                <% if(color%2!=0){ %>class="td_chapter_2_content_odd"<%}%> >
                <%=listResource.get(chapterID).getResourceNameVn() %> <!--Vietnamese Resource Name-->
            </td>
        <% } %>
            <td <% if(color%2==0){ %>class="td_chapter_3_content_even"<%}%> 
                <% if(color%2!=0){ %>class="td_chapter_3_content_odd"<%}%> >
            <% if(numberOfResource==1){%>
                <div class="displayIcon">
                <%
                for(int a=0;a<11;a++){
                    int resourceCategoryId = -1;
                    if(arrayIcon[a]==1)
                    resourceCategoryId=a+1 ;
                %>                           
                <% if(resourceCategoryId==4 ){ %>
                    <a  href = <%="./SubjectCategory.do?subjectID="+ listSubject.get(i).getSubjectId()+"&"+"resourceCategoryID="+4+"&"+"orderChapter="+listResource.get(chapterID).getOrderChapter() %> alt="<bean:message key="text.assignments"/>" class="assignmentsSolutions" title="<bean:message key="text.assignments"/>"></a><% } %>
                <% if(resourceCategoryId==5 ){ %>
                    <a  href = <%="./SubjectCategory.do?subjectID="+ listSubject.get(i).getSubjectId()+"&"+"resourceCategoryID="+5+"&"+"orderChapter="+listResource.get(chapterID).getOrderChapter() %> alt="<bean:message key="text.example"/>" class="examsSolutions" title="<bean:message key="text.example"/>"></a>  <% } %>
                <% if(resourceCategoryId==10 ){ %>
                    <a  href = <%="./SubjectCategory.do?subjectID="+ listSubject.get(i).getSubjectId()+"&"+"resourceCategoryID="+10+"&"+"orderChapter="+listResource.get(chapterID).getOrderChapter() %> alt="<bean:message key="text.lecturenote"/>" class="lectureNotes" title="<bean:message key="text.lecturenote"/>"></a><% } %>                        
                <% if(resourceCategoryId==11 ){ %>
                    <a  href = <%="./SubjectCategory.do?subjectID="+ listSubject.get(i).getSubjectId()+"&"+"resourceCategoryID="+11+"&"+"orderChapter="+listResource.get(chapterID).getOrderChapter() %> alt="<bean:message key="text.video"/>" class="multimediaContent" title="<bean:message key="text.video"/>"></a>   <% } %>
                <%}%>       
                </div>
            <%}%>
        </td>
        <td 
            <% if(color%2==0){ %>class="td_chapter_4_content_even"<%}%> 
            <% if(color%2!=0){ %>class="td_chapter_4_content_odd"<%}%> >
            <% if(oneMonth==true) {%>
                <img src="image/new-icon.gif" class="image_newicon" alt="new-icon"/> <!-- new icon  -->
            <% } %>
        </td>                
        <% } %>
        <% color ++; %>
    </tr >
        <% }} %>
</table>
<% } %> 