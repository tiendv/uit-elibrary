<%-- 
    Document   : faculty
    Created on : Dec 6, 2011, 4:44:10 AM
    Author     : Nguyen Hoang Tan
--%>

<%@page import="java.util.Date"%>
<%@ taglib uri="http://struts.apache.org/tags-bean" prefix="bean" %>
<%@page import="org.apache.struts.Globals"%>
<%@page import="java.util.Locale"%>
<%@page import="java.util.List"%>
<%@page import="uit.elib.dto.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <link rel="stylesheet" type="text/css" href="css/uit.css" />
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title><bean:message key="text.leftmenu.faculty"/></title>
    </head>
    <body>
        <div class="title_h1"><bean:message key="text.leftmenu.faculty"/></div>
        <div class="af_legends">
            <ul class="legendList">
            <li class="lectureNotes" alt="Lecture notes"
                title="<bean:message key="text.menu.lecturenote"/>"><bean:message key="text.menu.lecturenote"/></li>
            <li class="projectsExample"
                alt="Projects"
                title="<bean:message key="text.menu.project"/>"><bean:message key="text.menu.project"/></li>
            <li class="imageGallery" alt="Image Galleries"
                title="<bean:message key="text.imageGallery"/>"><bean:message key="text.imageGallery"/></li>
            <li class="multimediaContent"
                alt="Video"
                title="<bean:message key="text.video"/>"><bean:message key="text.video"/></li>
            <li class="assignmentsSolutions"
                alt="Assignments"
                title="<bean:message key="text.Assignments"/>"><bean:message key="text.Assignments"/></li>
            <li class="examsSolutions"
                alt="Example"
                title="<bean:message key="text.Example"/>"><bean:message key="text.Example"/></li>
            <li class="onlineTextBooks"
                alt="Reading"
                title="<bean:message key="text.Reading"/>"><bean:message key="text.Reading"/></li>            
            </ul>
        </div>
        <% 
            List<Subject> listSubject;
            listSubject = (List<Subject>)request.getAttribute("listSubject");             
            int language =1; // English
            Locale locale = request.getLocale();
            if(request.getSession().getAttribute(Globals.LOCALE_KEY).toString().equals("vn"))
                language=2; // VietNamese
        %>            
        <% 
            List<Faculty> listFaculty;
            listFaculty = (List<Faculty>)request.getAttribute("listFaculty");
            int s=0;                     
            for(int f=0;f<listFaculty.size();f++){
        %>    
        <% if(language==1) { %>
            <div class="title_h1"><%=listFaculty.get(f).getFacultyNameEn() %></div>  <!--English Faculty Name-->
        <% } %> 
        <% if(language==2) {%>
            <div class="title_h1"><%=listFaculty.get(f).getFacultyNameVn() %></div> <!--Vietnamese Faculty Name-->
        <% } %>         
        
        <table style="margin-left: 30px " width="600px">               
            <%                 
                for(int i=s;i<listSubject.size();i=i+2) {
                    if(listSubject.get(i).getFaculty().getFacultyId()!=listFaculty.get(f).getFacultyId())
                        break;
                    String href = "#"+listSubject.get(i).getSubjectId().toString();
            %>
            <tr>      
            <td width="250px" style="color: #680a12">              
                    <img src="image/black-arrow.gif" width="3" height="5" alt="black-arrow"/>
                    <% if(language==1) { %>
                        <a href =<%=href%> style="color:#680a12 " > <%=listSubject.get(i).getSubjectNameEn()%>  </a> <!--English Subject Name-->
                    <% } %> 
                    <% if(language==2) {%>
                        <a href =<%=href%> style="color:#680a12 " ><%=listSubject.get(i).getSubjectNameVn()%> </a> <!--Vietnamese Subject Name-->
                    <% } %>                         
            </td>
            <td width="250px" style="color: #680a12">
                <% if(i+1<listSubject.size() && (listSubject.get(i).getFaculty().getFacultyId()==listFaculty.get(f).getFacultyId())){ %>
                    <img src="image/black-arrow.gif" width="3" height="5" alt="black-arrow"/>
                    <% if(language==1) {%>
                        <a href =<%=href%> style="color:#680a12" > <%=listSubject.get(i+1).getSubjectNameEn()%> </a> <!--English Subject Name-->
                    <% } %> 
                    <% if(language==2) {%>
                        <a href =<%=href%> style="color:#680a12" > <%=listSubject.get(i+1).getSubjectNameVn()%> </a> <!--Vietnamese Subject Name-->
                    <% } %>

                <% } %>    
            </td>
            </tr>
            <% } %>
        </table><br/>
        <% 
            List<List<Resource>> arrayListResource = (List<List<Resource>>) request.getAttribute("arrayListResource");
        %> 
        <%  
            for(int i=s;i<listSubject.size();i++) {
                String href="./SubjectHome.do?subjectID="+listSubject.get(i).getSubjectId();
                if(listSubject.get(i).getFaculty().getFacultyId()!=listFaculty.get(f).getFacultyId())
                {     
                    s=i;
                    break;
                }
        %>
        <% if(language==1) {%>
            <div  style=" font-size: 12px; margin-left: 17px ; padding-top: 7px; padding-bottom:2px;  font-weight: bold; color: #680a12">
                <u><a href =<%=href%> name=<%=listSubject.get(i).getSubjectId()%> style="color:#680a12"><%=listSubject.get(i).getSubjectNameEn() %></a></u> <!--English Subject Name-->
            </div>    
        <% } %> 
        <% if(language==2) {%>
            <div style="font-size: 12px; margin-left: 17px ; padding-top: 7px; padding-bottom:2px; font-weight: bold; color: #680a12">
                <u><a href =<%=href%> name=<%=listSubject.get(i).getSubjectId()%> style="color:#680a12" ><%=listSubject.get(i).getSubjectNameVn() %></a></u> <!--Vietnamese Subject Name-->
            </div>    
        <% } %>
        <table class="table_chapter" >
            <tr class="color_title_table">
                <td class="td_chapter_1"></td><td class="td_chapter_2"></td>
                <td class="td_chapter_3"><bean:message key="text.OrderNumber"/></td>
                <td class="td_chapter_4"><bean:message key="text.ChapterTitle"/></td>
            </tr>
            <% int color =0;
               List<Resource> listResource = arrayListResource.get(s);
            %>
            <% for(int j=0;j<listResource.size();j++) {%>
                 <%
                    int newestPosition=-1;
                    int lecturePosition =-1;
                    int []arrayIcon = new int[11] ;
                    for(int a=0;a<11;a++)
                        arrayIcon[a]=0;
                    int chapter = listResource.get(j).getOrderChapter();
                    if(!listSubject.get(i).getSubjectId().equals(listResource.get(j).getSubject().getSubjectId()))
                    {
                        break;
                    }
                    while(chapter==listResource.get(j).getOrderChapter()&&(listSubject.get(i).getSubjectId().equals(listResource.get(j).getSubject().getSubjectId()))){
                        if(newestPosition==-1)
                            newestPosition=j;
                        if(listResource.get(j).getResourcecategory().getResourceCategoryId()==7)
                            lecturePosition=j;
                        else
                            arrayIcon[listResource.get(j).getResourcecategory().getResourceCategoryId()-1]=1;
                        j++;
                        if(j>=listResource.size())
                            break;
                    }
                        j--;
                    if(lecturePosition>=0)
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
                <td width="40px" 
                    <% if(color%2==0){ %> 
                        style="background-color:#E2E1D9"
                    <%}%>                               >
                    <% if(oneMonth==true) {%>
                        <img src="image/new-icon.gif" width="18" height="5" alt="new-icon"/> <!-- new icon  -->
                    <% } %>
                </td>

                <td width="140px" 
                    <% if(color%2==0){ %>
                        style="background-color:#E2E1D9"<%}%>>
                    <div class="displayIcon">
                    <%
                    for(int a=0;a<11;a++){
                        int resourceCategoryId = -1;
                        if(arrayIcon[a]==1)
                        resourceCategoryId=a+1 ;
                    %>                           
                    <% if(resourceCategoryId==4 ){ %>
                        <a  href = <%="./SubjectCategory.do?subjectID="+ listSubject.get(i).getSubjectId()+"&"+"resourceCategoryID="+4+"&"+"orderChapter="+listResource.get(lecturePosition).getOrderChapter() %> alt="<bean:message key="text.Assignments"/>" class="assignmentsSolutions" title="<bean:message key="text.Assignments"/>"></a><% } %>
                    <% if(resourceCategoryId==5 ){ %>
                        <a  href = <%="./SubjectCategory.do?subjectID="+ listSubject.get(i).getSubjectId()+"&"+"resourceCategoryID="+5+"&"+"orderChapter="+listResource.get(lecturePosition).getOrderChapter() %> alt="<bean:message key="text.Example"/>" class="examsSolutions" title="<bean:message key="text.Example"/>"></a>  <% } %>
                    <% if(resourceCategoryId==6 ){ %>
                        <a  href = <%="./SubjectCategory.do?subjectID="+ listSubject.get(i).getSubjectId()+"&"+"resourceCategoryID="+6+"&"+"orderChapter="+listResource.get(lecturePosition).getOrderChapter() %> alt="<bean:message key="text.menu.project"/>" class="projectsExample" title="<bean:message key="text.menu.project"/>"></a>  <% } %>
                    <% if(resourceCategoryId==8 ){ %>
                        <a  href = <%="./SubjectCategory.do?subjectID="+ listSubject.get(i).getSubjectId()+"&"+"resourceCategoryID="+8+"&"+"orderChapter="+listResource.get(lecturePosition).getOrderChapter() %> alt="<bean:message key="text.imageGallery"/>" class="imageGallery" title="<bean:message key="text.imageGallery"/>"></a>   <% } %>
                    <% if(resourceCategoryId==9 ){ %>
                        <a  href = <%="./SubjectCategory.do?subjectID="+ listSubject.get(i).getSubjectId()+"&"+"resourceCategoryID="+9+"&"+"orderChapter="+listResource.get(lecturePosition).getOrderChapter() %> alt="<bean:message key="text.Reading"/>" class="onlineTextBooks" title="<bean:message key="text.Reading"/>"></a><% } %>
                     <% if(resourceCategoryId==10 ){ %>
                        <a  href = <%="./SubjectCategory.do?subjectID="+ listSubject.get(i).getSubjectId()+"&"+"resourceCategoryID="+10+"&"+"orderChapter="+listResource.get(lecturePosition).getOrderChapter() %> alt="<bean:message key="text.menu.lecturenote"/>" class="lectureNotes" title="<bean:message key="text.menu.lecturenote"/>"></a><% } %>                           
                    <% if(resourceCategoryId==11 ){ %>
                        <a  href = <%="./SubjectCategory.do?subjectID="+ listSubject.get(i).getSubjectId()+"&"+"resourceCategoryID="+11+"&"+"orderChapter="+listResource.get(lecturePosition).getOrderChapter() %> alt="<bean:message key="text.video"/>" class="multimediaContent" title="<bean:message key="text.video"/>"></a>   <% } %>
                    <%}%>       
                    </div> 
                </td>
                    <td width="70px"              
                            style="<% if(color%2==0){ %>background-color:#E2E1D9;<%}%> color:#680a12">
                        <%=listResource.get(lecturePosition).getOrderChapter() %> <!--Chapter-->
                    </td>  
                <% if(language==1) {%>                              
                    <td width="354px"              
                            style="<% if(color%2==0){ %>background-color:#E2E1D9;<%}%> color:#680a12">
                        <%=listResource.get(lecturePosition).getResourceNameEn() %> <!--English Resource Name-->
                    </td>
                <% } %> 
                <% if(language==2) {%>                               
                    <td width="354px"                           
                        style="<% if(color%2==0){ %>background-color:#E2E1D9;<%}%> color:#680a12">
                        <%=listResource.get(lecturePosition).getResourceNameVn() %> <!--Vietnamese Resource Name-->
                    </td>
                <% } %>
                <% } %>

                <% if(!listSubject.get(i).getSubjectId().equals(listResource.get(j).getSubject().getSubjectId()))  break;
                %>
                <% color ++; %>
            </tr >
                <% }    
                    if(j+1>=listResource.size())
                    {
                        j++;
                        break;
                    }
                    if(j+1>=listResource.size()||!listSubject.get(i).getSubjectId().equals(listResource.get(j+1).getSubject().getSubjectId()))
                    {    
                        j++;
                        break;
                    }
                } %>
        </table>
        <% }%><div style="clear:both;height: 30px "></div>  <%} %> 
    </body>
</html>

